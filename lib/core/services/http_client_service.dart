import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:customer_app_temp_7/core/constants/api_constants.dart';
import 'package:customer_app_temp_7/core/services/secure_storage_service.dart';

/// Custom exception for API errors
class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  ApiException({
    required this.message,
    this.statusCode,
    this.data,
  });

  @override
  String toString() => message;
}

/// HTTP Client Service with auto token refresh and error handling
class HttpClientService {
  HttpClientService._();

  static final HttpClientService instance = HttpClientService._();
  final SecureStorageService _storage = SecureStorageService.instance;

  // ==========================
  // GET Request
  // ==========================

  Future<Map<String, dynamic>> get(
    String endpoint, {
    bool requiresAuth = true,
  }) async {
    return _makeRequest(
      () async {
        final token = await _storage.getAccessToken();
        final headers = requiresAuth && token != null
            ? ApiConstants.authHeaders(token)
            : ApiConstants.defaultHeaders;

        final response = await http
            .get(
              Uri.parse(endpoint),
              headers: headers,
            )
            .timeout(ApiConstants.connectionTimeout);

        return response;
      },
    );
  }

  // ==========================
  // POST Request
  // ==========================

  Future<Map<String, dynamic>> post(
    String endpoint, {
    Map<String, dynamic>? body,
    bool requiresAuth = false,
  }) async {
    return _makeRequest(
      () async {
        final token = await _storage.getAccessToken();
        final headers = requiresAuth && token != null
            ? ApiConstants.authHeaders(token)
            : ApiConstants.defaultHeaders;

        final response = await http
            .post(
              Uri.parse(endpoint),
              headers: headers,
              body: body != null ? json.encode(body) : null,
            )
            .timeout(ApiConstants.connectionTimeout);

        return response;
      },
    );
  }

  // ==========================
  // PUT Request
  // ==========================

  Future<Map<String, dynamic>> put(
    String endpoint, {
    Map<String, dynamic>? body,
    bool requiresAuth = true,
  }) async {
    return _makeRequest(
      () async {
        final token = await _storage.getAccessToken();
        final headers = requiresAuth && token != null
            ? ApiConstants.authHeaders(token)
            : ApiConstants.defaultHeaders;

        final response = await http
            .put(
              Uri.parse(endpoint),
              headers: headers,
              body: body != null ? json.encode(body) : null,
            )
            .timeout(ApiConstants.connectionTimeout);

        return response;
      },
    );
  }

  // ==========================
  // DELETE Request
  // ==========================

  Future<Map<String, dynamic>> delete(
    String endpoint, {
    bool requiresAuth = true,
  }) async {
    return _makeRequest(
      () async {
        final token = await _storage.getAccessToken();
        final headers = requiresAuth && token != null
            ? ApiConstants.authHeaders(token)
            : ApiConstants.defaultHeaders;

        final response = await http
            .delete(
              Uri.parse(endpoint),
              headers: headers,
            )
            .timeout(ApiConstants.connectionTimeout);

        return response;
      },
    );
  }

  // ==========================
  // Multipart Request (for file uploads)
  // ==========================

  Future<Map<String, dynamic>> multipart(
    String endpoint, {
    required Map<String, String> fields,
    List<http.MultipartFile>? files,
    bool requiresAuth = false,
  }) async {
    try {
      final request = http.MultipartRequest('POST', Uri.parse(endpoint));

      // Add headers
      final token = await _storage.getAccessToken();
      if (requiresAuth && token != null) {
        request.headers['Authorization'] = 'Bearer $token';
      }

      // Add fields
      request.fields.addAll(fields);

      // Add files
      if (files != null) {
        request.files.addAll(files);
      }

      final streamedResponse = await request.send().timeout(
            const Duration(seconds: 60),
          );

      final response = await http.Response.fromStream(streamedResponse);

      return _handleResponse(response);
    } catch (e) {
      throw _handleError(e);
    }
  }

  // ==========================
  // Private Helper Methods
  // ==========================

  /// Make HTTP request with auto token refresh on 401
  Future<Map<String, dynamic>> _makeRequest(
    Future<http.Response> Function() request,
  ) async {
    try {
      var response = await request();

      // If token expired (401), try to refresh
      if (response.statusCode == 401) {
        final refreshed = await _refreshAccessToken();

        if (refreshed) {
          // Retry request with new token
          response = await request();
        } else {
          throw ApiException(
            message: 'Session expired. Please login again.',
            statusCode: 401,
          );
        }
      }

      return _handleResponse(response);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// Handle HTTP response
  Map<String, dynamic> _handleResponse(http.Response response) {
    final statusCode = response.statusCode;

    print('HTTP Response - Status: $statusCode');
    print('HTTP Response - Body: ${response.body}');

    if (response.body.isEmpty) {
      if (statusCode >= 200 && statusCode < 300) {
        return <String, dynamic>{};
      } else {
        throw ApiException(
          message: 'Empty response from server',
          statusCode: statusCode,
        );
      }
    }

    try {
      final body = json.decode(response.body) as Map<String, dynamic>;
      print('Parsed body: $body');

      if (statusCode >= 200 && statusCode < 300) {
        return body;
      } else {
        throw ApiException(
          message: body['message']?.toString() ?? 'An error occurred',
          statusCode: statusCode,
          data: body,
        );
      }
    } catch (e) {
      print('Error parsing JSON: $e');
      throw ApiException(
        message: 'Invalid response format: ${response.body}',
        statusCode: statusCode,
      );
    }
  }

  /// Handle errors
  ApiException _handleError(dynamic error) {
    if (error is ApiException) {
      return error;
    } else if (error is SocketException) {
      return ApiException(
        message: 'No internet connection',
        statusCode: 0,
      );
    } else if (error is http.ClientException) {
      return ApiException(
        message: 'Network error occurred',
        statusCode: 0,
      );
    } else {
      return ApiException(
        message: error.toString(),
        statusCode: 0,
      );
    }
  }

  /// Refresh access token using refresh token
  Future<bool> _refreshAccessToken() async {
    try {
      final refreshToken = await _storage.getRefreshToken();

      if (refreshToken == null) return false;

      final response = await http.post(
        Uri.parse(ApiConstants.refreshToken),
        headers: ApiConstants.defaultHeaders,
        body: json.encode({'refreshToken': refreshToken}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        await _storage.saveTokens(
          accessToken: data['token'] as String,
          refreshToken: data['refreshToken'] as String,
        );
        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }
}

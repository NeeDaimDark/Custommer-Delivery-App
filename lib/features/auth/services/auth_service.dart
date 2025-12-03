import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:customer_app_temp_7/core/constants/api_constants.dart';
import 'package:customer_app_temp_7/core/services/http_client_service.dart';
import 'package:customer_app_temp_7/core/services/secure_storage_service.dart';
import 'package:customer_app_temp_7/features/auth/models/user_model.dart';

/// Authentication Service
/// Handles all authentication-related API calls
class AuthService {
  final HttpClientService _httpClient = HttpClientService.instance;
  final SecureStorageService _storage = SecureStorageService.instance;

  // ==========================
  // Registration
  // ==========================

  /// Register a new user with optional profile image
  Future<AuthResponse> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    XFile? profileImage,
  }) async {
    try {
      // Debug logging
      print('AUTH SERVICE - Register called with:');
      print('  name: "$name"');
      print('  email: "$email"');
      print('  phone: "$phone"');
      print('  password length: ${password.length}');

      // Prepare fields with explicit String casting
      final fields = <String, String>{
        'name': name.toString(),
        'email': email.toString(),
        'phone': phone.toString(),
        'password': password.toString(),
      };

      print('  fields map: $fields');

      // Prepare files
      List<http.MultipartFile>? files;
      if (profileImage != null) {
        final file = await http.MultipartFile.fromPath(
          'upload',
          profileImage.path,
        );
        files = [file];
      }

      // Make request
      print('Making API request to: ${ApiConstants.register}');
      final response = await _httpClient.multipart(
        ApiConstants.register,
        fields: fields,
        files: files,
        requiresAuth: false,
      );

      print('API Response received: $response');
      print('Response type: ${response.runtimeType}');
      print('Response keys: ${response.keys.toList()}');

      // Validate response structure
      if (!response.containsKey('token') || response['token'] == null) {
        print('ERROR: Missing token in response');
        throw Exception('Invalid response: missing token');
      }
      if (!response.containsKey('refreshToken') ||
          response['refreshToken'] == null) {
        print('ERROR: Missing refreshToken in response');
        throw Exception('Invalid response: missing refresh token');
      }
      if (!response.containsKey('customer') || response['customer'] == null) {
        print('ERROR: Missing customer in response');
        throw Exception('Invalid response: missing customer data');
      }

      // Parse response
      print('Attempting to parse AuthResponse...');
      final authResponse = AuthResponse.fromJson(response);
      print('AuthResponse parsed successfully!');
      print('Token: ${authResponse.token}');
      print('Customer ID: ${authResponse.customer.id}');
      print('Customer Email: ${authResponse.customer.email}');

      // Save tokens and user info
      await _storage.saveTokens(
        accessToken: authResponse.token,
        refreshToken: authResponse.refreshToken,
      );

      await _storage.saveUserInfo(
        userId: authResponse.customer.id,
        email: authResponse.customer.email,
      );

      return authResponse;
    } catch (e) {
      print('ERROR in register: $e');
      rethrow;
    }
  }

  // ==========================
  // Login
  // ==========================

  /// Login user with email and password
  Future<AuthResponse> login({
    required String email,
    required String password,
    bool rememberMe = false,
  }) async {
    try {
      final response = await _httpClient.post(
        ApiConstants.login,
        body: {
          'email': email,
          'password': password,
        },
        requiresAuth: false,
      );

      // Parse response
      final authResponse = AuthResponse.fromJson(response);

      // Save remember me preference
      await _storage.saveRememberMe(rememberMe);

      // Save credentials if remember me is enabled
      if (rememberMe) {
        await _storage.saveCredentials(
          username: email,
          password: password,
        );
      } else {
        // Clear any previously saved credentials
        await _storage.clearCredentials();
      }

      // Always save tokens for current session
      // If rememberMe is false, tokens will be cleared on logout/app restart
      await _storage.saveTokens(
        accessToken: authResponse.token,
        refreshToken: authResponse.refreshToken,
      );

      await _storage.saveUserInfo(
        userId: authResponse.customer.id,
        email: authResponse.customer.email,
      );

      return authResponse;
    } catch (e) {
      rethrow;
    }
  }

  // ==========================
  // Logout
  // ==========================

  /// Logout user and clear stored data
  Future<void> logout() async {
    try {
      // Call logout endpoint
      await _httpClient.post(
        ApiConstants.logout,
        requiresAuth: true,
      );
    } catch (e) {
      // Even if API call fails, clear local storage
    } finally {
      // Clear credentials for remember me
      await _storage.clearCredentials();
      // Clear all stored data
      await _storage.clearAll();
    }
  }

  // ==========================
  // Password Reset
  // ==========================

  /// Request password reset email
  Future<String> forgotPassword(String email) async {
    try {
      final response = await _httpClient.post(
        ApiConstants.forgotPassword,
        body: {'email': email},
        requiresAuth: false,
      );

      return response['message'] as String;
    } catch (e) {
      rethrow;
    }
  }

  /// Reset password with token
  Future<String> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    try {
      final response = await _httpClient.post(
        ApiConstants.resetPassword,
        body: {
          'token': token,
          'newPassword': newPassword,
        },
        requiresAuth: false,
      );

      return response['message'] as String;
    } catch (e) {
      rethrow;
    }
  }

  // ==========================
  // Email Verification
  // ==========================

  /// Verify email with token
  Future<String> verifyEmail(String token) async {
    try {
      final response = await _httpClient.post(
        ApiConstants.verifyEmail,
        body: {'token': token},
        requiresAuth: false,
      );

      return response['message'] as String;
    } catch (e) {
      rethrow;
    }
  }

  // ==========================
  // Profile Management
  // ==========================

  /// Get current user profile
  Future<UserModel> getProfile() async {
    try {
      final response = await _httpClient.get(
        ApiConstants.profile,
        requiresAuth: true,
      );

      return UserModel.fromJson(response['customer'] as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  /// Update user profile
  Future<UserModel> updateProfile({
    String? name,
    String? phone,
    String? language,
  }) async {
    try {
      final body = <String, dynamic>{};
      if (name != null) body['name'] = name;
      if (phone != null) body['phone'] = phone;
      if (language != null) body['language'] = language;

      final response = await _httpClient.put(
        ApiConstants.profile,
        body: body,
        requiresAuth: true,
      );

      return UserModel.fromJson(response['customer'] as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  /// Upload profile photo
  Future<String> uploadProfilePhoto(XFile image) async {
    try {
      final file = await http.MultipartFile.fromPath(
        'upload',
        image.path,
      );

      final response = await _httpClient.multipart(
        ApiConstants.uploadPhoto,
        fields: {},
        files: [file],
        requiresAuth: true,
      );

      return response['profileImage'] as String;
    } catch (e) {
      rethrow;
    }
  }

  // ==========================
  // Authentication Check
  // ==========================

  /// Check if user is authenticated
  /// Only returns true if user has tokens AND remember me is enabled
  Future<bool> isAuthenticated() async {
    final hasToken = await _storage.isAuthenticated();
    if (!hasToken) return false;

    // Check if remember me was enabled
    final rememberMe = await _storage.getRememberMe();
    return rememberMe;
  }

  /// Get stored user ID
  Future<String?> getUserId() async {
    return await _storage.getUserId();
  }

  /// Manually refresh access token
  /// Returns true if refresh was successful
  Future<bool> refreshAccessToken() async {
    try {
      final refreshToken = await _storage.getRefreshToken();
      if (refreshToken == null) return false;

      final response = await _httpClient.post(
        ApiConstants.refreshToken,
        body: {'refreshToken': refreshToken},
        requiresAuth: false,
      );

      // Save new tokens
      await _storage.saveTokens(
        accessToken: response['token'] as String,
        refreshToken: response['refreshToken'] as String,
      );

      return true;
    } catch (e) {
      return false;
    }
  }
}

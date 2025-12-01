/// API endpoints and configuration constants for the Food Delivery App
class ApiConstants {
  ApiConstants._();

  // Base URLs
  static const String baseUrl = 'https://backend-delivery-app-ynzy.onrender.com/api';

  // Authentication Endpoints
  static const String register = '$baseUrl/auth/register';
  static const String login = '$baseUrl/auth/login';
  static const String verifyEmail = '$baseUrl/auth/verify-email';
  static const String forgotPassword = '$baseUrl/auth/forgot-password';
  static const String resetPassword = '$baseUrl/auth/reset-password';
  static const String refreshToken = '$baseUrl/auth/refresh-token';
  static const String logout = '$baseUrl/auth/logout';

  // Customer Endpoints
  static const String profile = '$baseUrl/customers/profile';
  static const String uploadPhoto = '$baseUrl/customers/profile/upload-photo';
  static const String addresses = '$baseUrl/customers/addresses';
  static const String deactivateAccount = '$baseUrl/customers/deactivate';
  static const String deleteAccount = '$baseUrl/customers/delete';

  // Timeouts (increased for Render free tier cold starts)
  static const Duration connectionTimeout = Duration(seconds: 120);
  static const Duration receiveTimeout = Duration(seconds: 120);

  // Headers
  static Map<String, String> get defaultHeaders => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

  static Map<String, String> authHeaders(String token) => {
        ...defaultHeaders,
        'Authorization': 'Bearer $token',
      };
}

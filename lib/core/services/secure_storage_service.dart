import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Secure storage service for sensitive data like authentication tokens
/// Uses flutter_secure_storage to encrypt data on device
class SecureStorageService {
  SecureStorageService._();

  static final SecureStorageService instance = SecureStorageService._();

  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock,
    ),
  );

  // Storage Keys
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userIdKey = 'user_id';
  static const String _userEmailKey = 'user_email';
  static const String _rememberMeKey = 'remember_me';
  static const String _usernameKey = 'username';
  static const String _passwordKey = 'password';

  // ==========================
  // Token Management
  // ==========================

  /// Save both access and refresh tokens
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await Future.wait([
      _storage.write(key: _accessTokenKey, value: accessToken),
      _storage.write(key: _refreshTokenKey, value: refreshToken),
    ]);
  }

  /// Get access token
  Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }

  /// Get refresh token
  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }

  /// Check if user is authenticated (has valid access token)
  Future<bool> isAuthenticated() async {
    final token = await getAccessToken();
    return token != null && token.isNotEmpty;
  }

  // ==========================
  // User Data
  // ==========================

  /// Save user basic info
  Future<void> saveUserInfo({
    required String userId,
    required String email,
  }) async {
    await Future.wait([
      _storage.write(key: _userIdKey, value: userId),
      _storage.write(key: _userEmailKey, value: email),
    ]);
  }

  /// Get user ID
  Future<String?> getUserId() async {
    return await _storage.read(key: _userIdKey);
  }

  /// Get user email
  Future<String?> getUserEmail() async {
    return await _storage.read(key: _userEmailKey);
  }

  // ==========================
  // Remember Me Preference
  // ==========================

  /// Save remember me preference
  Future<void> saveRememberMe(bool rememberMe) async {
    await _storage.write(key: _rememberMeKey, value: rememberMe.toString());
  }

  /// Get remember me preference
  Future<bool> getRememberMe() async {
    final value = await _storage.read(key: _rememberMeKey);
    return value == 'true';
  }

  // ==========================
  // Credential Storage (for Remember Me)
  // ==========================

  /// Save username and password for remember me
  Future<void> saveCredentials({
    required String username,
    required String password,
  }) async {
    await Future.wait([
      _storage.write(key: _usernameKey, value: username),
      _storage.write(key: _passwordKey, value: password),
    ]);
  }

  /// Get saved username
  Future<String?> getSavedUsername() async {
    return await _storage.read(key: _usernameKey);
  }

  /// Get saved password
  Future<String?> getSavedPassword() async {
    return await _storage.read(key: _passwordKey);
  }

  /// Clear saved credentials (called on logout or when remember me is disabled)
  Future<void> clearCredentials() async {
    await Future.wait([
      _storage.delete(key: _usernameKey),
      _storage.delete(key: _passwordKey),
      _storage.delete(key: _rememberMeKey),
    ]);
  }

  // ==========================
  // Clear Data (Logout)
  // ==========================

  /// Clear all stored data (used on logout)
  Future<void> clearAll() async {
    await _storage.deleteAll();
  }

  /// Clear only tokens (keep user info)
  Future<void> clearTokens() async {
    await Future.wait([
      _storage.delete(key: _accessTokenKey),
      _storage.delete(key: _refreshTokenKey),
    ]);
  }
}

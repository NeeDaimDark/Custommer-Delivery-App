import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:customer_app_temp_7/core/services/http_client_service.dart';
import 'package:customer_app_temp_7/features/auth/models/user_model.dart';
import 'package:customer_app_temp_7/features/auth/services/auth_service.dart';

// ==========================
// Auth Service Provider
// ==========================

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

// ==========================
// Auth State
// ==========================

/// Authentication state
class AuthState {
  final UserModel? user;
  final bool isLoading;
  final String? error;
  final bool isAuthenticated;

  const AuthState({
    this.user,
    this.isLoading = false,
    this.error,
    this.isAuthenticated = false,
  });

  AuthState copyWith({
    UserModel? user,
    bool? isLoading,
    String? error,
    bool? isAuthenticated,
  }) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}

// ==========================
// Auth State Notifier
// ==========================

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthService _authService;

  AuthNotifier(this._authService) : super(const AuthState()) {
    _checkAuthStatus();
  }

  /// Check if user is already authenticated on app start
  Future<void> _checkAuthStatus() async {
    try {
      final isAuth = await _authService.isAuthenticated();
      if (isAuth) {
        // Load user profile
        await loadUserProfile();
      } else {
        // No user authenticated - this is normal, not an error
        state = state.copyWith(isAuthenticated: false, error: null);
      }
    } catch (e) {
      // Silently fail - user is just not authenticated
      state = state.copyWith(isAuthenticated: false, error: null);
    }
  }

  /// Load user profile
  Future<void> loadUserProfile() async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      final user = await _authService.getProfile();
      state = state.copyWith(
        user: user,
        isAuthenticated: true,
        isLoading: false,
      );
    } catch (e) {
      // Don't show error for failed profile load during initial check
      state = state.copyWith(
        isLoading: false,
        isAuthenticated: false,
        error: null,
      );
    }
  }

  /// Register new user
  Future<bool> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    XFile? profileImage,
  }) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final response = await _authService.register(
        name: name,
        email: email,
        phone: phone,
        password: password,
        profileImage: profileImage,
      );

      state = state.copyWith(
        user: response.customer,
        isAuthenticated: true,
        isLoading: false,
      );

      return true;
    } catch (e) {
      state = state.copyWith(
        error: _getErrorMessage(e),
        isLoading: false,
      );
      return false;
    }
  }

  /// Login user
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final response = await _authService.login(
        email: email,
        password: password,
      );

      state = state.copyWith(
        user: response.customer,
        isAuthenticated: true,
        isLoading: false,
      );

      return true;
    } catch (e) {
      state = state.copyWith(
        error: _getErrorMessage(e),
        isLoading: false,
      );
      return false;
    }
  }

  /// Logout user
  Future<void> logout() async {
    try {
      state = state.copyWith(isLoading: true);
      await _authService.logout();
      state = const AuthState();
    } catch (e) {
      state = const AuthState();
    }
  }

  /// Update profile
  Future<bool> updateProfile({
    String? name,
    String? phone,
    String? language,
  }) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final user = await _authService.updateProfile(
        name: name,
        phone: phone,
        language: language,
      );

      state = state.copyWith(
        user: user,
        isLoading: false,
      );

      return true;
    } catch (e) {
      state = state.copyWith(
        error: _getErrorMessage(e),
        isLoading: false,
      );
      return false;
    }
  }

  /// Upload profile photo
  Future<bool> uploadProfilePhoto(XFile image) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final imageUrl = await _authService.uploadProfilePhoto(image);

      // Update user with new image
      if (state.user != null) {
        state = state.copyWith(
          user: state.user!.copyWith(profileImage: imageUrl),
          isLoading: false,
        );
      }

      return true;
    } catch (e) {
      state = state.copyWith(
        error: _getErrorMessage(e),
        isLoading: false,
      );
      return false;
    }
  }

  /// Forgot password
  Future<String?> forgotPassword(String email) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      final message = await _authService.forgotPassword(email);
      state = state.copyWith(isLoading: false);
      return message;
    } catch (e) {
      state = state.copyWith(
        error: _getErrorMessage(e),
        isLoading: false,
      );
      return null;
    }
  }

  /// Reset password
  Future<bool> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      await _authService.resetPassword(
        token: token,
        newPassword: newPassword,
      );
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        error: _getErrorMessage(e),
        isLoading: false,
      );
      return false;
    }
  }

  /// Clear error
  void clearError() {
    state = state.copyWith(error: null);
  }

  /// Set error message
  void setError(String message) {
    state = state.copyWith(error: message);
  }

  /// Get error message from exception
  String _getErrorMessage(dynamic error) {
    if (error is ApiException) {
      return error.message;
    }
    return error.toString();
  }
}

// ==========================
// Auth Provider
// ==========================

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authService = ref.watch(authServiceProvider);
  return AuthNotifier(authService);
});

// ==========================
// Convenience Providers
// ==========================

/// Check if user is authenticated
final isAuthenticatedProvider = Provider<bool>((ref) {
  return ref.watch(authProvider).isAuthenticated;
});

/// Get current user
final currentUserProvider = Provider<UserModel?>((ref) {
  return ref.watch(authProvider).user;
});

/// Check if auth is loading
final isAuthLoadingProvider = Provider<bool>((ref) {
  return ref.watch(authProvider).isLoading;
});

/// Get auth error
final authErrorProvider = Provider<String?>((ref) {
  return ref.watch(authProvider).error;
});

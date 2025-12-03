import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:customer_app_temp_7/features/auth/services/auth_service.dart';
import 'package:customer_app_temp_7/features/auth/providers/auth_provider.dart';

// ==========================
// Forgot Password State
// ==========================

/// State for the forgot password process (3 steps: email → OTP → new password)
class ForgotPasswordState {
  final String? email;
  final String? resetToken;
  final bool isLoading;
  final String? error;
  final int otpTimeRemaining; // Seconds remaining for OTP validity

  const ForgotPasswordState({
    this.email,
    this.resetToken,
    this.isLoading = false,
    this.error,
    this.otpTimeRemaining = 600, // 10 minutes = 600 seconds
  });

  ForgotPasswordState copyWith({
    String? email,
    String? resetToken,
    bool? isLoading,
    String? error,
    int? otpTimeRemaining,
  }) {
    return ForgotPasswordState(
      email: email ?? this.email,
      resetToken: resetToken ?? this.resetToken,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      otpTimeRemaining: otpTimeRemaining ?? this.otpTimeRemaining,
    );
  }

  /// Check if OTP has expired (0 seconds = expired)
  bool get isOTPExpired => otpTimeRemaining <= 0;

  /// Format remaining time as MM:SS
  String get formattedTimeRemaining {
    final minutes = otpTimeRemaining ~/ 60;
    final seconds = otpTimeRemaining % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}

// ==========================
// Forgot Password Notifier
// ==========================

class ForgotPasswordNotifier extends StateNotifier<ForgotPasswordState> {
  final AuthService _authService;

  ForgotPasswordNotifier(this._authService)
      : super(const ForgotPasswordState());

  /// Step 1: Request OTP by sending email
  Future<bool> requestPasswordReset(String email) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      await _authService.forgotPassword(email);

      state = state.copyWith(
        email: email,
        isLoading: false,
        error: null,
        otpTimeRemaining: 600, // Reset timer to 10 minutes
      );

      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString().replaceAll('Exception: ', ''),
      );
      return false;
    }
  }

  /// Step 2: Verify OTP and get reset token
  Future<bool> verifyOTP(String otpCode) async {
    if (state.email == null) {
      state = state.copyWith(error: 'Email not found. Please start over.');
      return false;
    }

    if (state.isOTPExpired) {
      state =
          state.copyWith(error: 'OTP has expired. Please request a new one.');
      return false;
    }

    try {
      state = state.copyWith(isLoading: true, error: null);
      final resetToken = await _authService.verifyOTPForPasswordReset(
        email: state.email!,
        otpCode: otpCode,
      );

      state = state.copyWith(
        resetToken: resetToken,
        isLoading: false,
        error: null,
      );

      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString().replaceAll('Exception: ', ''),
      );
      return false;
    }
  }

  /// Step 3: Reset password with token
  Future<bool> resetPassword(String newPassword) async {
    if (state.resetToken == null) {
      state = state.copyWith(
          error: 'Reset token not found. Please verify OTP again.');
      return false;
    }

    try {
      state = state.copyWith(isLoading: true, error: null);
      await _authService.resetPassword(
        token: state.resetToken!,
        newPassword: newPassword,
      );

      state = state.copyWith(
        isLoading: false,
        error: null,
      );

      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString().replaceAll('Exception: ', ''),
      );
      return false;
    }
  }

  /// Decrement OTP timer (call every second)
  void decrementTimer() {
    if (state.otpTimeRemaining > 0) {
      state = state.copyWith(otpTimeRemaining: state.otpTimeRemaining - 1);
    }
  }

  /// Reset the forgot password state (when user starts over)
  void reset() {
    state = const ForgotPasswordState();
  }

  /// Clear error message
  void clearError() {
    state = state.copyWith(error: null);
  }
}

// ==========================
// Providers
// ==========================

final forgotPasswordProvider =
    StateNotifierProvider<ForgotPasswordNotifier, ForgotPasswordState>((ref) {
  final authService = ref.watch(authServiceProvider);
  return ForgotPasswordNotifier(authService);
});

// Timer provider to decrement OTP counter every second
final otpTimerProvider = StreamProvider<int>((ref) async* {
  final state = ref.watch(forgotPasswordProvider);

  // Only create timer if OTP is active (has email but no reset token yet)
  if (state.email != null && state.resetToken == null && !state.isOTPExpired) {
    for (int i = state.otpTimeRemaining; i > 0; i--) {
      await Future.delayed(const Duration(seconds: 1));
      ref.read(forgotPasswordProvider.notifier).decrementTimer();
      yield i;
    }
  }
});

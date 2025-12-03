import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:customer_app_temp_7/features/auth/providers/forgot_password_provider.dart';
import 'package:customer_app_temp_7/features/auth/validators/forgot_password_validators.dart';
import 'otp_model.dart';
export 'otp_model.dart';

class OtpWidget extends ConsumerStatefulWidget {
  const OtpWidget({super.key});

  static String routeName = 'OTP';
  static String routePath = '/otp';

  @override
  ConsumerState<OtpWidget> createState() => _OtpWidgetState();
}

class _OtpWidgetState extends ConsumerState<OtpWidget> {
  late OtpModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OtpModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textController5 ??= TextEditingController();
    _model.textController6 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();
    _model.textFieldFocusNode5 ??= FocusNode();
    _model.textFieldFocusNode6 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  String _getOTPCode() {
    return (_model.textController1?.text ?? '') +
        (_model.textController2?.text ?? '') +
        (_model.textController3?.text ?? '') +
        (_model.textController4?.text ?? '') +
        (_model.textController5?.text ?? '') +
        (_model.textController6?.text ?? '');
  }

  void _moveToNextField(String value, FocusNode currentFocus, FocusNode? nextFocus) {
    if (value.length == 1) {
      currentFocus.unfocus();
      if (nextFocus != null) {
        FocusScope.of(context).requestFocus(nextFocus);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final forgotPasswordState = ref.watch(forgotPasswordProvider);
    final email = forgotPasswordState.email ?? 'your email';

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'We have sent a code to your Email',
                      textAlign: TextAlign.center,
                      style:
                          FlutterFlowTheme.of(context).headlineLarge.override(
                                font: GoogleFonts.merriweather(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primary,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .fontStyle,
                              ),
                    ),
                    Text(
                      'Please check your email $email to reset your password',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.ubuntu(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    // Error message
                    if (forgotPasswordState.error != null)
                      Container(
                        margin: const EdgeInsets.only(top: 16.0),
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFEE2E2),
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: const Color(0xFFFCA5A5),
                            width: 1.0,
                          ),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.error_outline,
                              color: Color(0xFFDC2626),
                              size: 20.0,
                            ),
                            const SizedBox(width: 12.0),
                            Expanded(
                              child: Text(
                                forgotPasswordState.error!,
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      color: const Color(0xFFDC2626),
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    Container(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildOTPField(
                          _model.textController1!,
                          _model.textFieldFocusNode1!,
                          _model.textFieldFocusNode2,
                          context,
                        ),
                        Container(width: 12.0),
                        _buildOTPField(
                          _model.textController2!,
                          _model.textFieldFocusNode2!,
                          _model.textFieldFocusNode3,
                          context,
                        ),
                        Container(width: 12.0),
                        _buildOTPField(
                          _model.textController3!,
                          _model.textFieldFocusNode3!,
                          _model.textFieldFocusNode4,
                          context,
                        ),
                        Container(width: 12.0),
                        _buildOTPField(
                          _model.textController4!,
                          _model.textFieldFocusNode4!,
                          _model.textFieldFocusNode5,
                          context,
                        ),
                        Container(width: 12.0),
                        _buildOTPField(
                          _model.textController5!,
                          _model.textFieldFocusNode5!,
                          _model.textFieldFocusNode6,
                          context,
                        ),
                        Container(width: 12.0),
                        _buildOTPField(
                          _model.textController6!,
                          _model.textFieldFocusNode6!,
                          null,
                          context,
                        ),
                      ],
                    ),
                    Container(height: 30.0),
                    // Timer display
                    if (!forgotPasswordState.isOTPExpired)
                      Text(
                        'OTP expires in: ${forgotPasswordState.formattedTimeRemaining}',
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              color: forgotPasswordState.otpTimeRemaining < 120
                                  ? const Color(0xFFDC2626)
                                  : FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                    if (forgotPasswordState.isOTPExpired)
                      Text(
                        'OTP has expired',
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              color: const Color(0xFFDC2626),
                              letterSpacing: 0.0,
                            ),
                      ),
                    Container(height: 16.0),
                    FFButtonWidget(
                      onPressed:
                          forgotPasswordState.isLoading || forgotPasswordState.isOTPExpired
                              ? null
                              : () async {
                                  final otpCode = _getOTPCode();

                                  if (!ForgotPasswordValidators.isValidOTP(
                                      otpCode)) {
                                    ref
                                        .read(forgotPasswordProvider.notifier)
                                        .clearError();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                          SnackBar(
                                            content: const Text(
                                                'Please enter a valid 6-digit code'),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                            duration:
                                                const Duration(seconds: 2),
                                          ),
                                        );
                                    return;
                                  }

                                  final success = await ref
                                      .read(forgotPasswordProvider.notifier)
                                      .verifyOTP(otpCode);

                                  if (success && mounted) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                          SnackBar(
                                            content: const Text(
                                                'OTP verified successfully'),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .success,
                                            duration:
                                                const Duration(seconds: 2),
                                          ),
                                        );

                                    Future.delayed(
                                        const Duration(milliseconds: 500),
                                        () {
                                          if (mounted) {
                                            context.pushNamed(
                                                NewPasswordWidget.routeName);
                                          }
                                        });
                                  }
                                },
                      text: forgotPasswordState.isLoading
                          ? 'Verifying...'
                          : 'Next',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding: const EdgeInsets.all(8.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: forgotPasswordState.isLoading ||
                                forgotPasswordState.isOTPExpired
                            ? FlutterFlowTheme.of(context).accent1
                            : FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.merriweather(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    Container(height: 20.0),
                    InkWell(
                      onTap: () {
                        ref.read(forgotPasswordProvider.notifier).reset();
                        context.pushNamed(ResetPasswordWidget.routeName);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Didn\'t Receive? ',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.ubuntu(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: const Color(0xFF6B7280),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          Text(
                            'Click Here',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.ubuntu(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color:
                                      FlutterFlowTheme.of(context).tertiary,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOTPField(
    TextEditingController controller,
    FocusNode currentFocus,
    FocusNode? nextFocus,
    BuildContext context,
  ) {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: const Color(0xFFE5E7EB),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: currentFocus.hasFocus
              ? FlutterFlowTheme.of(context).primary
              : const Color(0xFFE5E7EB),
          width: 2.0,
        ),
      ),
      child: TextField(
        controller: controller,
        focusNode: currentFocus,
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: FlutterFlowTheme.of(context).headlineMedium.override(
              font: GoogleFonts.merriweather(
                fontWeight: FlutterFlowTheme.of(context)
                    .headlineMedium
                    .fontWeight,
              ),
              fontSize: 20.0,
              letterSpacing: 0.0,
            ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          counterText: '',
        ),
        onChanged: (value) {
          _moveToNextField(value, currentFocus, nextFocus);
        },
      ),
    );
  }
}

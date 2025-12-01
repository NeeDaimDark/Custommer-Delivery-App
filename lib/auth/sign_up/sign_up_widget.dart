import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:customer_app_temp_7/features/auth/providers/auth_provider.dart';
import 'sign_up_model.dart';
export 'sign_up_model.dart';

class SignUpWidget extends ConsumerStatefulWidget {
  const SignUpWidget({super.key});

  static String routeName = 'Sign_Up';
  static String routePath = '/signUp';

  @override
  ConsumerState<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends ConsumerState<SignUpWidget> {
  late SignUpModel _model;
  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignUpModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textController5 ??= TextEditingController();
    _model.textFieldFocusNode5 ??= FocusNode();

    // Clear any existing errors when page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(authProvider.notifier).clearError();
    });

    // Add listeners to clear error when user starts typing
    _model.textController1?.addListener(() {
      if (mounted) {
        ref.read(authProvider.notifier).clearError();
      }
    });
    _model.textController2?.addListener(() {
      if (mounted) {
        ref.read(authProvider.notifier).clearError();
      }
    });
    _model.textController4?.addListener(() {
      if (mounted) {
        ref.read(authProvider.notifier).clearError();
      }
    });
    _model.textController5?.addListener(() {
      if (mounted) {
        ref.read(authProvider.notifier).clearError();
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondary,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 739.93,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondary,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Sign Up',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  font: GoogleFonts.merriweather(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 26.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Text(
                              'Add your information to sign up',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.ubuntu(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                              ),
                              child: TextFormField(
                                controller: _model.textController1,
                                focusNode: _model.textFieldFocusNode1,
                                autofocus: false,
                                textCapitalization: TextCapitalization.words,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'User Name',
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 14.0, 16.0, 14.0),
                                  prefixIcon: Icon(
                                    Icons.person_outline,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 20.0,
                                  ),
                                ),
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
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Name is required';
                                  }
                                  return null;
                                },
                                inputFormatters: [
                                  if (!isAndroid && !isiOS)
                                    TextInputFormatter.withFunction(
                                        (oldValue, newValue) {
                                      return TextEditingValue(
                                        selection: newValue.selection,
                                        text: newValue.text.toCapitalization(
                                            TextCapitalization.words),
                                      );
                                    }),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                              ),
                              child: TextFormField(
                                controller: _model.textController2,
                                focusNode: _model.textFieldFocusNode2,
                                autofocus: false,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 14.0, 16.0, 14.0),
                                  prefixIcon: Icon(
                                    Icons.mail_outline,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 20.0,
                                  ),
                                ),
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
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Email is required';
                                  }
                                  if (!RegExp(
                                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                      .hasMatch(value)) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            // Phone Number with Country Code Picker
                            IntlPhoneField(
                              focusNode: _model.textFieldFocusNode3,
                              decoration: InputDecoration(
                                labelText: 'Mobile Number',
                                hintText: 'Enter phone number',
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                    color: Colors.red,
                                    width: 1.0,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                    color: Colors.red,
                                    width: 2.0,
                                  ),
                                ),
                                contentPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 14.0, 16.0, 14.0),
                                counterText: '',
                              ),
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
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                  ),
                              initialCountryCode: 'TN', // Tunisia default
                              showDropdownIcon: true,
                              dropdownIconPosition: IconPosition.trailing,
                              dropdownIcon: Icon(
                                Icons.arrow_drop_down,
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                              flagsButtonPadding:
                                  const EdgeInsets.only(left: 12, right: 8),
                              onChanged: (phone) {
                                // Store complete phone number with country code
                                print('Phone changed: ${phone.completeNumber}');
                                _model.completePhoneNumber =
                                    phone.completeNumber;
                              },
                              onSaved: (phone) {
                                // Also save on form save
                                if (phone != null) {
                                  print('Phone saved: ${phone.completeNumber}');
                                  _model.completePhoneNumber =
                                      phone.completeNumber;
                                }
                              },
                              validator: (phone) {
                                if (phone == null || phone.number.isEmpty) {
                                  return 'Phone number is required';
                                }
                                // Also store the value during validation
                                _model.completePhoneNumber =
                                    phone.completeNumber;
                                print(
                                    'Phone validated: ${phone.completeNumber}');
                                return null;
                              },
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                              ),
                              child: TextFormField(
                                controller: _model.textController4,
                                focusNode: _model.textFieldFocusNode4,
                                autofocus: false,
                                textInputAction: TextInputAction.next,
                                obscureText: !_model.passwordVisibility1,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 14.0, 16.0, 14.0),
                                  prefixIcon: Icon(
                                    Icons.lock_outline,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 20.0,
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: () => safeSetState(
                                      () => _model.passwordVisibility1 =
                                          !_model.passwordVisibility1,
                                    ),
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      _model.passwordVisibility1
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      size: 22,
                                    ),
                                  ),
                                ),
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
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                keyboardType: TextInputType.visiblePassword,
                                validator: _model.validatePassword,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                              ),
                              child: TextFormField(
                                controller: _model.textController5,
                                focusNode: _model.textFieldFocusNode5,
                                autofocus: false,
                                textInputAction: TextInputAction.done,
                                obscureText: !_model.passwordVisibility2,
                                decoration: InputDecoration(
                                  hintText: 'Confirm Password',
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 14.0, 16.0, 14.0),
                                  prefixIcon: Icon(
                                    Icons.lock_outline,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 20.0,
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: () => safeSetState(
                                      () => _model.passwordVisibility2 =
                                          !_model.passwordVisibility2,
                                    ),
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      _model.passwordVisibility2
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      size: 22,
                                    ),
                                  ),
                                ),
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
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please confirm your password';
                                  }
                                  if (value != _model.textController4.text) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            // Error Message Display
                            Consumer(
                              builder: (context, ref, child) {
                                final error = ref.watch(authErrorProvider);
                                if (error == null || error.isEmpty) {
                                  return const SizedBox.shrink();
                                }
                                return Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.red.shade50,
                                    borderRadius: BorderRadius.circular(8),
                                    border:
                                        Border.all(color: Colors.red.shade300),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.error_outline,
                                          color: Colors.red.shade700),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          error,
                                          style: TextStyle(
                                            color: Colors.red.shade700,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),

                            FFButtonWidget(
                              onPressed: ref.watch(isAuthLoadingProvider)
                                  ? null
                                  : () async {
                                      // Clear previous errors
                                      ref
                                          .read(authProvider.notifier)
                                          .clearError();

                                      // DEBUG: Print all field values
                                      print('=== SIGN UP FORM DEBUG ===');
                                      print(
                                          'textController1 (name): ${_model.textController1}');
                                      print(
                                          'textController1.text: ${_model.textController1?.text}');
                                      print(
                                          'textController2 (email): ${_model.textController2}');
                                      print(
                                          'textController2.text: ${_model.textController2?.text}');
                                      print(
                                          'completePhoneNumber: ${_model.completePhoneNumber}');
                                      print(
                                          'textController4 (password): ${_model.textController4}');
                                      print(
                                          'textController4.text: ${_model.textController4?.text}');
                                      print(
                                          'textController5 (confirm): ${_model.textController5}');
                                      print(
                                          'textController5.text: ${_model.textController5?.text}');
                                      print('=========================');

                                      // Validate form
                                      if (!_formKey.currentState!.validate()) {
                                        print('ERROR: Form validation failed');
                                        return;
                                      }

                                      // Get form values with null safety
                                      final name =
                                          _model.textController1?.text.trim() ??
                                              '';
                                      final email =
                                          _model.textController2?.text.trim() ??
                                              '';
                                      final phone =
                                          _model.completePhoneNumber.trim();
                                      final password =
                                          _model.textController4?.text ?? '';

                                      print(
                                          'After trim - name: "$name", email: "$email", phone: "$phone", password length: ${password.length}');

                                      // Validate all fields are not empty
                                      if (name.isEmpty ||
                                          email.isEmpty ||
                                          phone.isEmpty ||
                                          password.isEmpty) {
                                        print(
                                            'ERROR: One or more fields are empty');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content:
                                                Text('Please fill all fields'),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                        return;
                                      }

                                      // Register user
                                      final success = await ref
                                          .read(authProvider.notifier)
                                          .register(
                                            name: name,
                                            email: email,
                                            phone: phone,
                                            password: password,
                                          );

                                      if (!mounted) return;

                                      if (success) {
                                        // Show success message
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Registration successful! Please login to continue.'),
                                            backgroundColor: Colors.green,
                                            duration: Duration(seconds: 3),
                                          ),
                                        );
                                        // Navigate to login screen (replace entire stack)
                                        context.goNamed(LoginWidget.routeName);
                                      }
                                    },
                              text: ref.watch(isAuthLoadingProvider)
                                  ? 'Creating Account...'
                                  : 'Sign Up',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 50.0,
                                padding: const EdgeInsets.all(8.0),
                                iconPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.merriweather(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      letterSpacing: 1.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ].divide(const SizedBox(height: 20.0)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 24.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
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
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 4.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(LoginWidget.routeName);
                              },
                              child: Text(
                                'Login',
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
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

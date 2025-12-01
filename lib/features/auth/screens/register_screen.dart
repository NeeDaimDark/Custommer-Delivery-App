import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:customer_app_temp_7/features/auth/providers/auth_provider.dart';
import 'package:customer_app_temp_7/flutter_flow/flutter_flow_theme.dart';
import 'package:customer_app_temp_7/flutter_flow/flutter_flow_util.dart';
import 'package:customer_app_temp_7/flutter_flow/flutter_flow_widgets.dart';
import 'package:customer_app_temp_7/index.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  static const String routeName = 'Register';
  static const String routePath = '/register';

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  XFile? _profileImage;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );
    if (image != null) {
      setState(() => _profileImage = image);
    }
  }

  Future<void> _register() async {
    // Clear previous errors
    ref.read(authProvider.notifier).clearError();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Register
    final success = await ref.read(authProvider.notifier).register(
          name: _nameController.text.trim(),
          email: _emailController.text.trim(),
          phone: _phoneController.text.trim(),
          password: _passwordController.text,
          profileImage: _profileImage,
        );

    if (!mounted) return;

    if (success) {
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registration successful! Welcome!'),
          backgroundColor: Colors.green,
        ),
      );

      // Navigate to home
      context.pushNamed(HomePageWidget.routeName);
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (value.length < 8) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final isLoading = authState.isLoading;
    final error = authState.error;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).secondary,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),

                  // Title
                  Text(
                    'Create Account',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          font: GoogleFonts.merriweather(
                            fontWeight: FontWeight.bold,
                          ),
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 32.0,
                        ),
                  ),
                  const SizedBox(height: 8),

                  Text(
                    'Sign up to get started',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.ubuntu(),
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                  ),
                  const SizedBox(height: 32),

                  // Profile Image Picker
                  Center(
                    child: GestureDetector(
                      onTap: isLoading ? null : _pickImage,
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).accent4,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 3,
                          ),
                        ),
                        child: _profileImage != null
                            ? ClipOval(
                                child: Image.file(
                                  File(_profileImage!.path),
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Icon(
                                Icons.add_a_photo,
                                size: 40,
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tap to add profile photo (optional)',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          font: GoogleFonts.ubuntu(),
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                  ),
                  const SizedBox(height: 24),

                  // Name Field
                  TextFormField(
                    controller: _nameController,
                    enabled: !isLoading,
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      hintText: 'Enter your full name',
                      prefixIcon: const Icon(Icons.person_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Email Field
                  TextFormField(
                    controller: _emailController,
                    enabled: !isLoading,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'your@email.com',
                      prefixIcon: const Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    validator: _validateEmail,
                  ),
                  const SizedBox(height: 16),

                  // Phone Field
                  TextFormField(
                    controller: _phoneController,
                    enabled: !isLoading,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      hintText: '+1234567890',
                      prefixIcon: const Icon(Icons.phone_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    validator: _validatePhone,
                  ),
                  const SizedBox(height: 16),

                  // Password Field
                  TextFormField(
                    controller: _passwordController,
                    enabled: !isLoading,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'At least 6 characters',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() => _obscurePassword = !_obscurePassword);
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    validator: _validatePassword,
                  ),
                  const SizedBox(height: 16),

                  // Confirm Password Field
                  TextFormField(
                    controller: _confirmPasswordController,
                    enabled: !isLoading,
                    obscureText: _obscureConfirmPassword,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      hintText: 'Re-enter password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureConfirmPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() =>
                              _obscureConfirmPassword = !_obscureConfirmPassword);
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    validator: _validateConfirmPassword,
                  ),
                  const SizedBox(height: 24),

                  // Error Message
                  if (error != null)
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.red.shade300),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.error_outline, color: Colors.red.shade700),
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
                    ),
                  if (error != null) const SizedBox(height: 16),

                  // Register Button
                  FFButtonWidget(
                    onPressed: isLoading ? null : _register,
                    text: isLoading ? 'Creating Account...' : 'Sign Up',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 56,
                      padding: const EdgeInsets.all(0),
                      iconPadding: EdgeInsets.zero,
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.ubuntu(
                                  fontWeight: FontWeight.w600,
                                ),
                                color: Colors.white,
                                fontSize: 18,
                              ),
                      elevation: 3,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Login Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.ubuntu(),
                            ),
                      ),
                      InkWell(
                        onTap: isLoading
                            ? null
                            : () {
                                context.pushNamed(LoginWidget.routeName);
                              },
                        child: Text(
                          'Sign In',
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.ubuntu(
                                  fontWeight: FontWeight.w600,
                                ),
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

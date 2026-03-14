import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:real_estate_app/src/utils/extensions.dart';
import 'package:real_estate_app/src/features/authentication/application/auth_service.dart';
import '../widgets/auth_container.dart';
import '../widgets/loading_overlay.dart';
import 'signup_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  final String? storedEmail;

  const LoginScreen({this.storedEmail, super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late final TextEditingController _emailController = TextEditingController(
    text: widget.storedEmail,
  );
  final TextEditingController _passwordController = TextEditingController();
  bool _obscure = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _Body(
            emailController: _emailController,
            passwordController: _passwordController,
            obscure: _obscure,
            onToggleObscure: () => setState(() => _obscure = !_obscure),
            onLogin: () => _handleLogin(),
          ),
          if (isLoading) const LoadingOverlay(),
        ],
      ),
    );
  }

  void _handleLogin() async {
    setState(() => isLoading = true);

    try {
      final notifier = ref.read(authServiceProvider.notifier);
      await notifier.login(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
    } catch (e) {
      if (mounted) {
        context.showErrorSnackBar('فشل تسجيل الدخول: $e');
      }
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.emailController,
    required this.passwordController,
    required this.obscure,
    required this.onToggleObscure,
    required this.onLogin,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool obscure;
  final VoidCallback onToggleObscure;
  final VoidCallback onLogin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AuthContainer(
      children: [
        Text('تسجيل الدخول', style: theme.textTheme.bodyMedium),
        const SizedBox(height: 32),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Column(
            children: [
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
                decoration: const InputDecoration(
                  labelText: 'البريد الإلكتروني',
                  prefixIcon: Icon(LucideIcons.mail),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                obscureText: obscure,
                decoration: InputDecoration(
                  labelText: 'كلمة المرور',
                  prefixIcon: const Icon(LucideIcons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(obscure ? LucideIcons.eye : LucideIcons.eyeOff),
                    onPressed: onToggleObscure,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            icon: const Icon(LucideIcons.logIn),
            label: const Text('تسجيل الدخول'),
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: onLogin,
          ),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SignupScreen()),
            );
          },
          child: const Text('ليس لديك حساب؟ قم بالتسجيل الآن'),
        ),
      ],
    );
  }
}

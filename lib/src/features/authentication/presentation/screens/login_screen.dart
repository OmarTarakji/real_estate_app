import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/src/utils/extensions.dart';
import 'package:real_estate_app/src/features/authentication/application/auth_provider.dart';

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
          _buildBody(context, ref),
          if (isLoading) const LoadingOverlay(),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final notifier = ref.watch(authProvider.notifier);

    return AuthContainer(
      children: [
        Text('تسجيل الدخول', style: theme.textTheme.bodyMedium),
        const SizedBox(height: 32),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Column(
            children: [
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'البريد الإلكتروني',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: _obscure,
                decoration: InputDecoration(
                  labelText: 'كلمة المرور',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () => setState(() => _obscure = !_obscure),
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
            icon: const Icon(Icons.login),
            label: const Text('تسجيل الدخول'),
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () async {
              setState(() => isLoading = true);
              final error = await notifier.login(
                _emailController.text,
                _passwordController.text,
              );
              setState(() => isLoading = false);
              if (error != null && context.mounted) {
                context.showErrorSnackBar(error);
              }
            },
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

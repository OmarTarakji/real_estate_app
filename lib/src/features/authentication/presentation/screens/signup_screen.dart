import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:real_estate_app/src/utils/extensions.dart';
import 'package:real_estate_app/src/features/authentication/application/auth_service.dart';
import 'package:real_estate_app/src/features/authentication/presentation/widgets/auth_container.dart';
import '../widgets/loading_overlay.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();
  bool _obscure = true;
  bool _obscure2 = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _Body(
            usernameController: _usernameController,
            phoneController: _phoneController,
            emailController: _emailController,
            passwordController: _passwordController,
            password2Controller: _password2Controller,
            obscure: _obscure,
            obscure2: _obscure2,
            onToggleObscure: () => setState(() => _obscure = !_obscure),
            onToggleObscure2: () => setState(() => _obscure2 = !_obscure2),
            onSignup: () => _handleSignup(),
          ),
          if (isLoading) const LoadingOverlay(),
        ],
      ),
    );
  }

  void _handleSignup() async {
    setState(() => isLoading = true);

    try {
      final notifier = ref.read(authServiceProvider.notifier);
      await notifier.signup(
        email: _emailController.text.trim(),
        password: _passwordController.text,
        passwordConfirm: _password2Controller.text,
        username: _usernameController.text.trim(),
        phone: _phoneController.text.trim(),
      );

      if (mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        context.showErrorSnackBar('فشل إنشاء الحساب: $e');
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
    required this.usernameController,
    required this.phoneController,
    required this.emailController,
    required this.passwordController,
    required this.password2Controller,
    required this.obscure,
    required this.obscure2,
    required this.onToggleObscure,
    required this.onToggleObscure2,
    required this.onSignup,
  });

  final TextEditingController usernameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController password2Controller;
  final bool obscure;
  final bool obscure2;
  final VoidCallback onToggleObscure;
  final VoidCallback onToggleObscure2;
  final VoidCallback onSignup;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AuthContainer(
      children: [
        Text(
          'إنشاء حساب',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'انضم إلينا للعثور على منزل أحلامك',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 32),
        TextField(
          controller: usernameController,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            labelText: 'اسم المستخدم',
            prefixIcon: Icon(LucideIcons.user),
          ),
        ),
        const SizedBox(height: 16),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'رقم الهاتف',
                  prefixIcon: Icon(LucideIcons.phone),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'عنوان البريد الإلكتروني',
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
              const SizedBox(height: 16),
              TextField(
                controller: password2Controller,
                obscureText: obscure2,
                decoration: InputDecoration(
                  labelText: 'تأكيد كلمة المرور',
                  prefixIcon: const Icon(LucideIcons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(obscure2 ? LucideIcons.eye : LucideIcons.eyeOff),
                    onPressed: onToggleObscure2,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
            onPressed: onSignup,
            child: const Text('إنشاء حساب'),
          ),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('هل لديك حساب بالفعل؟ تسجيل الدخول'),
        ),
      ],
    );
  }
}

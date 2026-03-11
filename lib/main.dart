import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/src/widgets/main_navigation_shell.dart';
import 'package:real_estate_app/src/features/authentication/application/auth_provider.dart';
import 'package:real_estate_app/src/features/authentication/presentation/screens/login_screen.dart';

import 'src/widgets/splash_screen.dart';
import 'src/theme/app_theme.dart';
import 'src/theme/text_theme.dart';

void main() {
  runApp(const ProviderScope(child: RealEstateApp()));
}

class RealEstateApp extends ConsumerWidget {
  const RealEstateApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextTheme textTheme = createTextTheme(context, 'Cairo', 'Cairo');
    AppTheme theme = AppTheme(textTheme);

    final initialScreen = ref
        .watch(authProvider)
        .when(
          data: (user) =>
              user != null ? const MainNavigationShell() : const LoginScreen(),
          loading: () => const SplashScreen(),
          error: (_, _) => const LoginScreen(),
        );

    return MaterialApp(
      title: 'دلّال',
      debugShowCheckedModeBanner: false,
      theme: theme.lightTheme,
      home: initialScreen,
    );
  }
}

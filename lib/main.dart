import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'src/features/authentication/application/auth_service.dart';
import 'src/features/authentication/domain/auth_state.dart';
import 'src/features/authentication/presentation/screens/login_screen.dart';
import 'src/widgets/main_navigation_shell.dart';
import 'src/widgets/splash_screen.dart';
import 'src/theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: RealEstateApp()));
}

class RealEstateApp extends ConsumerWidget {
  const RealEstateApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialScreen = ref
        .watch(authServiceProvider)
        .when(
          data: (AuthState state) => switch (state) {
            Authenticated() => const MainNavigationShell(),
            _ => const LoginScreen(),
          },
          loading: () => const SplashScreen(),
          error: (_, _) => const LoginScreen(),
        );

    return MaterialApp(
      title: 'دلّاّل',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: initialScreen,
      supportedLocales: const [Locale('ar')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/src/widgets/error_screen.dart';
import 'package:real_estate_app/src/widgets/loading_body.dart';
import 'package:real_estate_app/src/features/authentication/application/auth_provider.dart';
import 'package:real_estate_app/src/features/profile/application/user_provider.dart';
import 'package:real_estate_app/src/features/profile/presentation/user_info.dart';

import '../domain/user.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('الملف الشخصي')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: userAsync.when(
          data: (user) => _buildData(user, ref),
          error: (e, st) {
            return Center(
              child: StyledError(
                onRetry: ref.watch(userProvider.notifier).reload,
                error: e,
                stackTrace: st,
              ),
            );
          },
          loading: () => const LoadingBody('جاري تحميل معلومات المستخدم...'),
        ),
      ),
    );
  }

  Widget _buildData(User user, WidgetRef ref) {
    return Center(
      child: Column(
        children: [
          UserInfo(user),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: ref.read(authProvider.notifier).logout,
            child: const Text('تسجيل الخروج'),
          ),
        ],
      ),
    );
  }
}

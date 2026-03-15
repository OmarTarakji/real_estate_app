import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:real_estate_app/src/widgets/error_screen.dart';
import 'package:real_estate_app/src/widgets/loading_body.dart';
import 'package:real_estate_app/src/features/profile/data/user_repository.dart';
import 'package:real_estate_app/src/features/profile/presentation/user_info.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final userAsync = ref.watch(currentUserProvider);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface.withAlpha(13),
      appBar: AppBar(
        title: const Text('الملف الشخصي'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.pencil),
            onPressed: () => _showEditProfileDialog(context, ref),
          ),
        ],
      ),
      body: userAsync.when(
        data: (user) => UserInfo(user),
        error: (e, st) {
          return Center(
            child: StyledError(
              onRetry: () => ref.invalidate(currentUserProvider),
              error: e,
              stackTrace: st,
            ),
          );
        },
        loading: () => const LoadingBody('جاري تحميل معلومات المستخدم...'),
      ),
    );
  }

  void _showEditProfileDialog(BuildContext context, WidgetRef ref) {
    final userAsync = ref.read(currentUserProvider);
    final user = userAsync.value;

    if (user == null) return;

    final usernameController = TextEditingController(text: user.username);
    final phoneController = TextEditingController(text: user.phone ?? '');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تعديل الملف الشخصي'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'اسم المستخدم',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'رقم الهاتف',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('إلغاء'),
          ),
          FilledButton(
            onPressed: () async {
              try {
                await ref
                    .read(userRepositoryProvider)
                    .updateProfile(
                      username: usernameController.text.trim(),
                      phone: phoneController.text.trim().isEmpty
                          ? null
                          : phoneController.text.trim(),
                    );

                // Refresh the user data
                ref.invalidate(currentUserProvider);

                if (context.mounted) {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('تم تحديث الملف الشخصي بنجاح'),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('فشل في تحديث الملف الشخصي: $e'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }
            },
            child: const Text('حفظ'),
          ),
        ],
      ),
    );
  }
}

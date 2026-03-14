import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:real_estate_app/src/features/authentication/application/auth_service.dart';

import 'package:real_estate_app/src/features/profile/domain/user_model.dart';
import 'package:real_estate_app/src/widgets/decorated_container.dart';

class UserInfo extends StatelessWidget {
  const UserInfo(this.user, {super.key});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('ar');
    return SingleChildScrollView(
      child: Column(
        children: [
          // Header Section with Avatar
          _UserAvatarSection(user: user),

          // Information Cards
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              spacing: 16,
              children: [
                _InfoCard(
                  title: 'معلومات الاتصال',
                  children: [
                    _InfoItem(
                      icon: LucideIcons.mail,
                      label: 'البريد الإلكتروني',
                      value: user.email,
                    ),
                    if (user.phone != null)
                      _InfoItem(
                        icon: LucideIcons.phone,
                        label: 'رقم الهاتف',
                        value: user.phone!,
                      ),
                  ],
                ),
                _InfoCard(
                  title: 'معلومات الحساب',
                  children: [
                    _InfoItem(
                      icon: LucideIcons.user,
                      label: 'الرقم التسلسلي',
                      value: user.id,
                    ),
                    _InfoItem(
                      icon: LucideIcons.calendar,
                      label: user.lastLogin != null
                          ? 'آخر دخول'
                          : 'لم يسجل دخول بعد',
                      value: user.lastLogin != null
                          ? _formatDate(user.lastLogin!)
                          : 'غير متوفر',
                    ),
                    _InfoItem(
                      icon: LucideIcons.calendarDays,
                      label: 'تاريخ الانضمام',
                      value: _formatDate(user.dateJoined),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const LogoutButton(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  String _formatDate(String dateString) {
    try {
      final dateTime = DateTime.parse(dateString);
      return DateFormat.yMMMd('ar').format(dateTime);
    } catch (e) {
      return dateString;
    }
  }
}

class _UserAvatarSection extends StatelessWidget {
  const _UserAvatarSection({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.primary.withAlpha(204),
          ],
        ),
        borderRadius: .all(.circular(12)),
      ),
      child: Column(
        spacing: 16,
        children: [
          // Avatar Section
          Stack(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: theme.colorScheme.onPrimary.withAlpha(51),
                    width: 3,
                  ),
                ),
                child: user.avatar != null
                    ? ClipOval(
                        child: Image.network(
                          user.avatar!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: Text(
                                _initials,
                                style: theme.textTheme.headlineMedium?.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : Center(
                        child: Text(
                          _initials,
                          style: theme.textTheme.headlineMedium?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: user.isActive == '1' ? Colors.green : Colors.red,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: theme.colorScheme.surface,
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    user.isActive == '1' ? LucideIcons.check : LucideIcons.x,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
          // User Name and Role
          Column(
            spacing: 8,
            children: [
              Text(
                user.username,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: theme.colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.onPrimary.withAlpha(26),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: theme.colorScheme.onPrimary.withAlpha(51),
                    width: 1,
                  ),
                ),
                child: Text(
                  _getRoleDisplayName(user.role),
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                user.email,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onPrimary.withAlpha(204),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String get _initials {
    final parts = user.username.split(' ');
    final namesLength = parts.length;
    if (namesLength > 1) return parts[0][0] + parts[1][0];
    return parts[0][0];
  }

  String _getRoleDisplayName(String role) {
    switch (role.toLowerCase()) {
      case 'admin':
        return 'مدير';
      case 'owner':
        return 'مالك';
      default:
        return 'مستخدم';
    }
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({super.key, required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DecoratedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
          const Divider(height: 1),
          ...children,
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  const _InfoItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: theme.colorScheme.primary, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withAlpha(153),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LogoutButton extends ConsumerWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: .only(top: 16, right: 16, left: 16),
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: ref.read(authServiceProvider.notifier).logout,
        icon: const Icon(LucideIcons.logOut),
        label: const Text('تسجيل الخروج'),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Theme.of(context).colorScheme.error,
          foregroundColor: Theme.of(context).colorScheme.onError,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

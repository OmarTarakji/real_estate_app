import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:real_estate_app/src/widgets/decorated_container.dart';
import 'package:real_estate_app/src/widgets/info_tile.dart';
import 'package:real_estate_app/src/widgets/tag.dart';

import '../domain/user.dart';

class UserInfo extends StatelessWidget {
  const UserInfo(this.user, {super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('ar');
    final theme = Theme.of(context);
    return DecoratedContainer(
      child: Column(
        spacing: 12,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 16,
            children: [
              CircleAvatar(
                radius: 40,
                child: Text(_initials, style: const TextStyle(fontSize: 35)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 6,
                children: [
                  Text(
                    user.username,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Tag(
                    text: user.role,
                    backgroundColor: theme.colorScheme.secondaryContainer,
                    foregroundColor: theme.colorScheme.secondary,
                  ),
                ],
              ),
            ],
          ),
          GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 4,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              ExpandedInfoTile(icon: Icons.email_outlined, text: user.email),
              ExpandedInfoTile(
                icon: Icons.phone_outlined,
                text: user.phone ?? 'لا يوجد',
              ),
              ExpandedInfoTile(
                icon: Icons.person_2_outlined,
                text:
                    'الرقم التسلسلي: '
                    '${user.id}',
              ),
              ExpandedInfoTile(
                icon: Icons.calendar_today_outlined,
                text:
                    'عضو منذ ${DateFormat.yMMMd('ar').format(user.dateJoined)}',
              ),
            ],
          ),
          Text(
            'الرصيد: \$'
            '${NumberFormat.currency(symbol: '', decimalDigits: 2).format(user.balance)}',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onPrimaryContainer,
            ),
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
}

import 'dart:convert';

import 'package:real_estate_app/src/features/authentication/application/auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../api/api_service.dart';
import '../utils/exceptions.dart';

part 'api_service_provider.g.dart';

@riverpod
class ApiNotifier extends _$ApiNotifier {
  @override
  ApiService build() => ApiService();

  Future<Map<String, dynamic>> authGet(String endpoint) async {
    final response = await state.authGet(endpoint);
    final json = jsonDecode(response.body);
    if (response.statusCode != 200) {
      if (json['message'] == 'الرمز المميز غير صحيح أو منتهي الصلاحية' ||
          json['message'] == 'المستخدم غير موجود') {
        ref.read(authProvider.notifier).logout();
      }

      throw ApiException('${json['message']}');
    }
    return json['data'];
  }
}

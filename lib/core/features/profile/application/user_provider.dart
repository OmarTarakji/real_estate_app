import 'package:real_estate_app/src/features/profile/domain/user.dart';
import 'package:real_estate_app/src/providers/api_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@riverpod
class UserNotifier extends _$UserNotifier {
  late final notifier = ref.watch(apiProvider.notifier);
  @override
  Future<User> build() async => getUser();

  Future<User> getUser() async {
    final Map<String, dynamic> data = await notifier.authGet('/auth/me');
    return User.fromJson(data);
  }

  void reload() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => getUser());
  }
}

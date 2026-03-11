import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../providers/api_service_provider.dart';
import '../domain/user.dart';

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

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class User with _$User {
  const User._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory User({
    required String id,
    required String username,
    required String email,
    @JsonKey(name: 'password_hash') required String passwordHash,
    required String phone,
    String? description,
    @JsonKey(name: 'is_active') required String isActive,
    @JsonKey(name: 'last_login') required String lastLogin,
    String? deletedAt,
    @JsonKey(name: 'date_joined') required String dateJoined,
    String? location,
    String? avatar,
    required String balance,
    required String role,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

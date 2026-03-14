import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String username,
    required String email,
    String? phone,
    String? description,
    @JsonKey(name: 'is_active') required String isActive,
    @JsonKey(name: 'last_login') String? lastLogin,
    @JsonKey(name: 'deleted_at') String? deletedAt,
    @JsonKey(name: 'date_joined') required String dateJoined,
    String? location,
    String? avatar,
    required String balance,
    required String role,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
abstract class UserResponse with _$UserResponse {
  const factory UserResponse({
    required bool success,
    required String message,
    required UserModel data,
    required String timestamp,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}

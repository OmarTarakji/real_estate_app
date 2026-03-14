import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_token.g.dart';
part 'auth_token.freezed.dart';

@freezed
abstract class AuthToken with _$AuthToken {
  const AuthToken._();

  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory AuthToken({
    required String token,
    required DateTime expirationDate,
  }) = _AuthToken;

  factory AuthToken.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenFromJson(json);

  // bool get isValid => DateTime.now().isBefore(expirationDate);
}

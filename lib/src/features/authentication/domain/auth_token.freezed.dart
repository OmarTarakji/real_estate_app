// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthToken {

 String get token; DateTime get expirationDate;
/// Create a copy of AuthToken
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthTokenCopyWith<AuthToken> get copyWith => _$AuthTokenCopyWithImpl<AuthToken>(this as AuthToken, _$identity);

  /// Serializes this AuthToken to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthToken&&(identical(other.token, token) || other.token == token)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,expirationDate);

@override
String toString() {
  return 'AuthToken(token: $token, expirationDate: $expirationDate)';
}


}

/// @nodoc
abstract mixin class $AuthTokenCopyWith<$Res>  {
  factory $AuthTokenCopyWith(AuthToken value, $Res Function(AuthToken) _then) = _$AuthTokenCopyWithImpl;
@useResult
$Res call({
 String token, DateTime expirationDate
});




}
/// @nodoc
class _$AuthTokenCopyWithImpl<$Res>
    implements $AuthTokenCopyWith<$Res> {
  _$AuthTokenCopyWithImpl(this._self, this._then);

  final AuthToken _self;
  final $Res Function(AuthToken) _then;

/// Create a copy of AuthToken
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? expirationDate = null,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,expirationDate: null == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthToken].
extension AuthTokenPatterns on AuthToken {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthToken value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthToken() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthToken value)  $default,){
final _that = this;
switch (_that) {
case _AuthToken():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthToken value)?  $default,){
final _that = this;
switch (_that) {
case _AuthToken() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token,  DateTime expirationDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthToken() when $default != null:
return $default(_that.token,_that.expirationDate);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token,  DateTime expirationDate)  $default,) {final _that = this;
switch (_that) {
case _AuthToken():
return $default(_that.token,_that.expirationDate);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token,  DateTime expirationDate)?  $default,) {final _that = this;
switch (_that) {
case _AuthToken() when $default != null:
return $default(_that.token,_that.expirationDate);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _AuthToken extends AuthToken {
  const _AuthToken({required this.token, required this.expirationDate}): super._();
  factory _AuthToken.fromJson(Map<String, dynamic> json) => _$AuthTokenFromJson(json);

@override final  String token;
@override final  DateTime expirationDate;

/// Create a copy of AuthToken
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthTokenCopyWith<_AuthToken> get copyWith => __$AuthTokenCopyWithImpl<_AuthToken>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthTokenToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthToken&&(identical(other.token, token) || other.token == token)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,expirationDate);

@override
String toString() {
  return 'AuthToken(token: $token, expirationDate: $expirationDate)';
}


}

/// @nodoc
abstract mixin class _$AuthTokenCopyWith<$Res> implements $AuthTokenCopyWith<$Res> {
  factory _$AuthTokenCopyWith(_AuthToken value, $Res Function(_AuthToken) _then) = __$AuthTokenCopyWithImpl;
@override @useResult
$Res call({
 String token, DateTime expirationDate
});




}
/// @nodoc
class __$AuthTokenCopyWithImpl<$Res>
    implements _$AuthTokenCopyWith<$Res> {
  __$AuthTokenCopyWithImpl(this._self, this._then);

  final _AuthToken _self;
  final $Res Function(_AuthToken) _then;

/// Create a copy of AuthToken
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? expirationDate = null,}) {
  return _then(_AuthToken(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,expirationDate: null == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on

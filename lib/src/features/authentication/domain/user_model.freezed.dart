// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {

 String get id; String get username; String get email;@JsonKey(name: 'password_hash') String get passwordHash; String get phone; String? get description;@JsonKey(name: 'is_active') String get isActive;@JsonKey(name: 'last_login') String get lastLogin; String? get deletedAt;@JsonKey(name: 'date_joined') String get dateJoined; String? get location; String? get avatar; String get balance; String get role;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.passwordHash, passwordHash) || other.passwordHash == passwordHash)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.description, description) || other.description == description)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.lastLogin, lastLogin) || other.lastLogin == lastLogin)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.dateJoined, dateJoined) || other.dateJoined == dateJoined)&&(identical(other.location, location) || other.location == location)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,email,passwordHash,phone,description,isActive,lastLogin,deletedAt,dateJoined,location,avatar,balance,role);

@override
String toString() {
  return 'User(id: $id, username: $username, email: $email, passwordHash: $passwordHash, phone: $phone, description: $description, isActive: $isActive, lastLogin: $lastLogin, deletedAt: $deletedAt, dateJoined: $dateJoined, location: $location, avatar: $avatar, balance: $balance, role: $role)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 String id, String username, String email,@JsonKey(name: 'password_hash') String passwordHash, String phone, String? description,@JsonKey(name: 'is_active') String isActive,@JsonKey(name: 'last_login') String lastLogin, String? deletedAt,@JsonKey(name: 'date_joined') String dateJoined, String? location, String? avatar, String balance, String role
});




}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? email = null,Object? passwordHash = null,Object? phone = null,Object? description = freezed,Object? isActive = null,Object? lastLogin = null,Object? deletedAt = freezed,Object? dateJoined = null,Object? location = freezed,Object? avatar = freezed,Object? balance = null,Object? role = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,passwordHash: null == passwordHash ? _self.passwordHash : passwordHash // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as String,lastLogin: null == lastLogin ? _self.lastLogin : lastLogin // ignore: cast_nullable_to_non_nullable
as String,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,dateJoined: null == dateJoined ? _self.dateJoined : dateJoined // ignore: cast_nullable_to_non_nullable
as String,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String username,  String email, @JsonKey(name: 'password_hash')  String passwordHash,  String phone,  String? description, @JsonKey(name: 'is_active')  String isActive, @JsonKey(name: 'last_login')  String lastLogin,  String? deletedAt, @JsonKey(name: 'date_joined')  String dateJoined,  String? location,  String? avatar,  String balance,  String role)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.username,_that.email,_that.passwordHash,_that.phone,_that.description,_that.isActive,_that.lastLogin,_that.deletedAt,_that.dateJoined,_that.location,_that.avatar,_that.balance,_that.role);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String username,  String email, @JsonKey(name: 'password_hash')  String passwordHash,  String phone,  String? description, @JsonKey(name: 'is_active')  String isActive, @JsonKey(name: 'last_login')  String lastLogin,  String? deletedAt, @JsonKey(name: 'date_joined')  String dateJoined,  String? location,  String? avatar,  String balance,  String role)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.id,_that.username,_that.email,_that.passwordHash,_that.phone,_that.description,_that.isActive,_that.lastLogin,_that.deletedAt,_that.dateJoined,_that.location,_that.avatar,_that.balance,_that.role);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String username,  String email, @JsonKey(name: 'password_hash')  String passwordHash,  String phone,  String? description, @JsonKey(name: 'is_active')  String isActive, @JsonKey(name: 'last_login')  String lastLogin,  String? deletedAt, @JsonKey(name: 'date_joined')  String dateJoined,  String? location,  String? avatar,  String balance,  String role)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.username,_that.email,_that.passwordHash,_that.phone,_that.description,_that.isActive,_that.lastLogin,_that.deletedAt,_that.dateJoined,_that.location,_that.avatar,_that.balance,_that.role);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _User extends User {
  const _User({required this.id, required this.username, required this.email, @JsonKey(name: 'password_hash') required this.passwordHash, required this.phone, this.description, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'last_login') required this.lastLogin, this.deletedAt, @JsonKey(name: 'date_joined') required this.dateJoined, this.location, this.avatar, required this.balance, required this.role}): super._();
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  String id;
@override final  String username;
@override final  String email;
@override@JsonKey(name: 'password_hash') final  String passwordHash;
@override final  String phone;
@override final  String? description;
@override@JsonKey(name: 'is_active') final  String isActive;
@override@JsonKey(name: 'last_login') final  String lastLogin;
@override final  String? deletedAt;
@override@JsonKey(name: 'date_joined') final  String dateJoined;
@override final  String? location;
@override final  String? avatar;
@override final  String balance;
@override final  String role;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.passwordHash, passwordHash) || other.passwordHash == passwordHash)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.description, description) || other.description == description)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.lastLogin, lastLogin) || other.lastLogin == lastLogin)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.dateJoined, dateJoined) || other.dateJoined == dateJoined)&&(identical(other.location, location) || other.location == location)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,email,passwordHash,phone,description,isActive,lastLogin,deletedAt,dateJoined,location,avatar,balance,role);

@override
String toString() {
  return 'User(id: $id, username: $username, email: $email, passwordHash: $passwordHash, phone: $phone, description: $description, isActive: $isActive, lastLogin: $lastLogin, deletedAt: $deletedAt, dateJoined: $dateJoined, location: $location, avatar: $avatar, balance: $balance, role: $role)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 String id, String username, String email,@JsonKey(name: 'password_hash') String passwordHash, String phone, String? description,@JsonKey(name: 'is_active') String isActive,@JsonKey(name: 'last_login') String lastLogin, String? deletedAt,@JsonKey(name: 'date_joined') String dateJoined, String? location, String? avatar, String balance, String role
});




}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? email = null,Object? passwordHash = null,Object? phone = null,Object? description = freezed,Object? isActive = null,Object? lastLogin = null,Object? deletedAt = freezed,Object? dateJoined = null,Object? location = freezed,Object? avatar = freezed,Object? balance = null,Object? role = null,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,passwordHash: null == passwordHash ? _self.passwordHash : passwordHash // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as String,lastLogin: null == lastLogin ? _self.lastLogin : lastLogin // ignore: cast_nullable_to_non_nullable
as String,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,dateJoined: null == dateJoined ? _self.dateJoined : dateJoined // ignore: cast_nullable_to_non_nullable
as String,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

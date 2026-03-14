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
mixin _$UserModel {

 String get id; String get username; String get email; String? get phone; String? get description;@JsonKey(name: 'is_active') String get isActive;@JsonKey(name: 'last_login') String? get lastLogin;@JsonKey(name: 'deleted_at') String? get deletedAt;@JsonKey(name: 'date_joined') String get dateJoined; String? get location; String? get avatar; String get balance; String get role;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.description, description) || other.description == description)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.lastLogin, lastLogin) || other.lastLogin == lastLogin)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.dateJoined, dateJoined) || other.dateJoined == dateJoined)&&(identical(other.location, location) || other.location == location)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,email,phone,description,isActive,lastLogin,deletedAt,dateJoined,location,avatar,balance,role);

@override
String toString() {
  return 'UserModel(id: $id, username: $username, email: $email, phone: $phone, description: $description, isActive: $isActive, lastLogin: $lastLogin, deletedAt: $deletedAt, dateJoined: $dateJoined, location: $location, avatar: $avatar, balance: $balance, role: $role)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 String id, String username, String email, String? phone, String? description,@JsonKey(name: 'is_active') String isActive,@JsonKey(name: 'last_login') String? lastLogin,@JsonKey(name: 'deleted_at') String? deletedAt,@JsonKey(name: 'date_joined') String dateJoined, String? location, String? avatar, String balance, String role
});




}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? email = null,Object? phone = freezed,Object? description = freezed,Object? isActive = null,Object? lastLogin = freezed,Object? deletedAt = freezed,Object? dateJoined = null,Object? location = freezed,Object? avatar = freezed,Object? balance = null,Object? role = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as String,lastLogin: freezed == lastLogin ? _self.lastLogin : lastLogin // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,dateJoined: null == dateJoined ? _self.dateJoined : dateJoined // ignore: cast_nullable_to_non_nullable
as String,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserModel value)  $default,){
final _that = this;
switch (_that) {
case _UserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String username,  String email,  String? phone,  String? description, @JsonKey(name: 'is_active')  String isActive, @JsonKey(name: 'last_login')  String? lastLogin, @JsonKey(name: 'deleted_at')  String? deletedAt, @JsonKey(name: 'date_joined')  String dateJoined,  String? location,  String? avatar,  String balance,  String role)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.username,_that.email,_that.phone,_that.description,_that.isActive,_that.lastLogin,_that.deletedAt,_that.dateJoined,_that.location,_that.avatar,_that.balance,_that.role);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String username,  String email,  String? phone,  String? description, @JsonKey(name: 'is_active')  String isActive, @JsonKey(name: 'last_login')  String? lastLogin, @JsonKey(name: 'deleted_at')  String? deletedAt, @JsonKey(name: 'date_joined')  String dateJoined,  String? location,  String? avatar,  String balance,  String role)  $default,) {final _that = this;
switch (_that) {
case _UserModel():
return $default(_that.id,_that.username,_that.email,_that.phone,_that.description,_that.isActive,_that.lastLogin,_that.deletedAt,_that.dateJoined,_that.location,_that.avatar,_that.balance,_that.role);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String username,  String email,  String? phone,  String? description, @JsonKey(name: 'is_active')  String isActive, @JsonKey(name: 'last_login')  String? lastLogin, @JsonKey(name: 'deleted_at')  String? deletedAt, @JsonKey(name: 'date_joined')  String dateJoined,  String? location,  String? avatar,  String balance,  String role)?  $default,) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.username,_that.email,_that.phone,_that.description,_that.isActive,_that.lastLogin,_that.deletedAt,_that.dateJoined,_that.location,_that.avatar,_that.balance,_that.role);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserModel implements UserModel {
  const _UserModel({required this.id, required this.username, required this.email, this.phone, this.description, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'last_login') this.lastLogin, @JsonKey(name: 'deleted_at') this.deletedAt, @JsonKey(name: 'date_joined') required this.dateJoined, this.location, this.avatar, required this.balance, required this.role});
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override final  String id;
@override final  String username;
@override final  String email;
@override final  String? phone;
@override final  String? description;
@override@JsonKey(name: 'is_active') final  String isActive;
@override@JsonKey(name: 'last_login') final  String? lastLogin;
@override@JsonKey(name: 'deleted_at') final  String? deletedAt;
@override@JsonKey(name: 'date_joined') final  String dateJoined;
@override final  String? location;
@override final  String? avatar;
@override final  String balance;
@override final  String role;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.description, description) || other.description == description)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.lastLogin, lastLogin) || other.lastLogin == lastLogin)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.dateJoined, dateJoined) || other.dateJoined == dateJoined)&&(identical(other.location, location) || other.location == location)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,email,phone,description,isActive,lastLogin,deletedAt,dateJoined,location,avatar,balance,role);

@override
String toString() {
  return 'UserModel(id: $id, username: $username, email: $email, phone: $phone, description: $description, isActive: $isActive, lastLogin: $lastLogin, deletedAt: $deletedAt, dateJoined: $dateJoined, location: $location, avatar: $avatar, balance: $balance, role: $role)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String username, String email, String? phone, String? description,@JsonKey(name: 'is_active') String isActive,@JsonKey(name: 'last_login') String? lastLogin,@JsonKey(name: 'deleted_at') String? deletedAt,@JsonKey(name: 'date_joined') String dateJoined, String? location, String? avatar, String balance, String role
});




}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? email = null,Object? phone = freezed,Object? description = freezed,Object? isActive = null,Object? lastLogin = freezed,Object? deletedAt = freezed,Object? dateJoined = null,Object? location = freezed,Object? avatar = freezed,Object? balance = null,Object? role = null,}) {
  return _then(_UserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as String,lastLogin: freezed == lastLogin ? _self.lastLogin : lastLogin // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,dateJoined: null == dateJoined ? _self.dateJoined : dateJoined // ignore: cast_nullable_to_non_nullable
as String,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$UserResponse {

 bool get success; String get message; UserModel get data; String get timestamp;
/// Create a copy of UserResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserResponseCopyWith<UserResponse> get copyWith => _$UserResponseCopyWithImpl<UserResponse>(this as UserResponse, _$identity);

  /// Serializes this UserResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data,timestamp);

@override
String toString() {
  return 'UserResponse(success: $success, message: $message, data: $data, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $UserResponseCopyWith<$Res>  {
  factory $UserResponseCopyWith(UserResponse value, $Res Function(UserResponse) _then) = _$UserResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, UserModel data, String timestamp
});


$UserModelCopyWith<$Res> get data;

}
/// @nodoc
class _$UserResponseCopyWithImpl<$Res>
    implements $UserResponseCopyWith<$Res> {
  _$UserResponseCopyWithImpl(this._self, this._then);

  final UserResponse _self;
  final $Res Function(UserResponse) _then;

/// Create a copy of UserResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = null,Object? timestamp = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UserModel,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of UserResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get data {
  
  return $UserModelCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserResponse].
extension UserResponsePatterns on UserResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserResponse value)  $default,){
final _that = this;
switch (_that) {
case _UserResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UserResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  UserModel data,  String timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  UserModel data,  String timestamp)  $default,) {final _that = this;
switch (_that) {
case _UserResponse():
return $default(_that.success,_that.message,_that.data,_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  UserModel data,  String timestamp)?  $default,) {final _that = this;
switch (_that) {
case _UserResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserResponse implements UserResponse {
  const _UserResponse({required this.success, required this.message, required this.data, required this.timestamp});
  factory _UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

@override final  bool success;
@override final  String message;
@override final  UserModel data;
@override final  String timestamp;

/// Create a copy of UserResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserResponseCopyWith<_UserResponse> get copyWith => __$UserResponseCopyWithImpl<_UserResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data,timestamp);

@override
String toString() {
  return 'UserResponse(success: $success, message: $message, data: $data, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$UserResponseCopyWith<$Res> implements $UserResponseCopyWith<$Res> {
  factory _$UserResponseCopyWith(_UserResponse value, $Res Function(_UserResponse) _then) = __$UserResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, UserModel data, String timestamp
});


@override $UserModelCopyWith<$Res> get data;

}
/// @nodoc
class __$UserResponseCopyWithImpl<$Res>
    implements _$UserResponseCopyWith<$Res> {
  __$UserResponseCopyWithImpl(this._self, this._then);

  final _UserResponse _self;
  final $Res Function(_UserResponse) _then;

/// Create a copy of UserResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = null,Object? timestamp = null,}) {
  return _then(_UserResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UserModel,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of UserResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get data {
  
  return $UserModelCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on

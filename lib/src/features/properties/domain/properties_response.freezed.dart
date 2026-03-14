// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'properties_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PropertiesResponse {

 bool get success; String get message; List<Property> get data; String get timestamp;
/// Create a copy of PropertiesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PropertiesResponseCopyWith<PropertiesResponse> get copyWith => _$PropertiesResponseCopyWithImpl<PropertiesResponse>(this as PropertiesResponse, _$identity);

  /// Serializes this PropertiesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PropertiesResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data),timestamp);

@override
String toString() {
  return 'PropertiesResponse(success: $success, message: $message, data: $data, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $PropertiesResponseCopyWith<$Res>  {
  factory $PropertiesResponseCopyWith(PropertiesResponse value, $Res Function(PropertiesResponse) _then) = _$PropertiesResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, List<Property> data, String timestamp
});




}
/// @nodoc
class _$PropertiesResponseCopyWithImpl<$Res>
    implements $PropertiesResponseCopyWith<$Res> {
  _$PropertiesResponseCopyWithImpl(this._self, this._then);

  final PropertiesResponse _self;
  final $Res Function(PropertiesResponse) _then;

/// Create a copy of PropertiesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = null,Object? timestamp = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<Property>,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PropertiesResponse].
extension PropertiesResponsePatterns on PropertiesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PropertiesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PropertiesResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PropertiesResponse value)  $default,){
final _that = this;
switch (_that) {
case _PropertiesResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PropertiesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PropertiesResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  List<Property> data,  String timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PropertiesResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  List<Property> data,  String timestamp)  $default,) {final _that = this;
switch (_that) {
case _PropertiesResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  List<Property> data,  String timestamp)?  $default,) {final _that = this;
switch (_that) {
case _PropertiesResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PropertiesResponse implements PropertiesResponse {
  const _PropertiesResponse({required this.success, required this.message, required final  List<Property> data, required this.timestamp}): _data = data;
  factory _PropertiesResponse.fromJson(Map<String, dynamic> json) => _$PropertiesResponseFromJson(json);

@override final  bool success;
@override final  String message;
 final  List<Property> _data;
@override List<Property> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  String timestamp;

/// Create a copy of PropertiesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PropertiesResponseCopyWith<_PropertiesResponse> get copyWith => __$PropertiesResponseCopyWithImpl<_PropertiesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PropertiesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PropertiesResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data),timestamp);

@override
String toString() {
  return 'PropertiesResponse(success: $success, message: $message, data: $data, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$PropertiesResponseCopyWith<$Res> implements $PropertiesResponseCopyWith<$Res> {
  factory _$PropertiesResponseCopyWith(_PropertiesResponse value, $Res Function(_PropertiesResponse) _then) = __$PropertiesResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, List<Property> data, String timestamp
});




}
/// @nodoc
class __$PropertiesResponseCopyWithImpl<$Res>
    implements _$PropertiesResponseCopyWith<$Res> {
  __$PropertiesResponseCopyWithImpl(this._self, this._then);

  final _PropertiesResponse _self;
  final $Res Function(_PropertiesResponse) _then;

/// Create a copy of PropertiesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = null,Object? timestamp = null,}) {
  return _then(_PropertiesResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Property>,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

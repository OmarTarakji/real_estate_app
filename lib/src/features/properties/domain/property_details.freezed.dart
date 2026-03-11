// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'property_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PropertyDetails {

 String get id; String get title; String get description; int get pricePerNight; String get imageUrl; int get bedrooms; int get bathrooms; int get guests; Landlord get landlord;
/// Create a copy of PropertyDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PropertyDetailsCopyWith<PropertyDetails> get copyWith => _$PropertyDetailsCopyWithImpl<PropertyDetails>(this as PropertyDetails, _$identity);

  /// Serializes this PropertyDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PropertyDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.pricePerNight, pricePerNight) || other.pricePerNight == pricePerNight)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.bedrooms, bedrooms) || other.bedrooms == bedrooms)&&(identical(other.bathrooms, bathrooms) || other.bathrooms == bathrooms)&&(identical(other.guests, guests) || other.guests == guests)&&(identical(other.landlord, landlord) || other.landlord == landlord));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,pricePerNight,imageUrl,bedrooms,bathrooms,guests,landlord);

@override
String toString() {
  return 'PropertyDetails(id: $id, title: $title, description: $description, pricePerNight: $pricePerNight, imageUrl: $imageUrl, bedrooms: $bedrooms, bathrooms: $bathrooms, guests: $guests, landlord: $landlord)';
}


}

/// @nodoc
abstract mixin class $PropertyDetailsCopyWith<$Res>  {
  factory $PropertyDetailsCopyWith(PropertyDetails value, $Res Function(PropertyDetails) _then) = _$PropertyDetailsCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, int pricePerNight, String imageUrl, int bedrooms, int bathrooms, int guests, Landlord landlord
});


$LandlordCopyWith<$Res> get landlord;

}
/// @nodoc
class _$PropertyDetailsCopyWithImpl<$Res>
    implements $PropertyDetailsCopyWith<$Res> {
  _$PropertyDetailsCopyWithImpl(this._self, this._then);

  final PropertyDetails _self;
  final $Res Function(PropertyDetails) _then;

/// Create a copy of PropertyDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? pricePerNight = null,Object? imageUrl = null,Object? bedrooms = null,Object? bathrooms = null,Object? guests = null,Object? landlord = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,pricePerNight: null == pricePerNight ? _self.pricePerNight : pricePerNight // ignore: cast_nullable_to_non_nullable
as int,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,bedrooms: null == bedrooms ? _self.bedrooms : bedrooms // ignore: cast_nullable_to_non_nullable
as int,bathrooms: null == bathrooms ? _self.bathrooms : bathrooms // ignore: cast_nullable_to_non_nullable
as int,guests: null == guests ? _self.guests : guests // ignore: cast_nullable_to_non_nullable
as int,landlord: null == landlord ? _self.landlord : landlord // ignore: cast_nullable_to_non_nullable
as Landlord,
  ));
}
/// Create a copy of PropertyDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LandlordCopyWith<$Res> get landlord {
  
  return $LandlordCopyWith<$Res>(_self.landlord, (value) {
    return _then(_self.copyWith(landlord: value));
  });
}
}


/// Adds pattern-matching-related methods to [PropertyDetails].
extension PropertyDetailsPatterns on PropertyDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PropertyDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PropertyDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PropertyDetails value)  $default,){
final _that = this;
switch (_that) {
case _PropertyDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PropertyDetails value)?  $default,){
final _that = this;
switch (_that) {
case _PropertyDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  int pricePerNight,  String imageUrl,  int bedrooms,  int bathrooms,  int guests,  Landlord landlord)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PropertyDetails() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.pricePerNight,_that.imageUrl,_that.bedrooms,_that.bathrooms,_that.guests,_that.landlord);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  int pricePerNight,  String imageUrl,  int bedrooms,  int bathrooms,  int guests,  Landlord landlord)  $default,) {final _that = this;
switch (_that) {
case _PropertyDetails():
return $default(_that.id,_that.title,_that.description,_that.pricePerNight,_that.imageUrl,_that.bedrooms,_that.bathrooms,_that.guests,_that.landlord);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  int pricePerNight,  String imageUrl,  int bedrooms,  int bathrooms,  int guests,  Landlord landlord)?  $default,) {final _that = this;
switch (_that) {
case _PropertyDetails() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.pricePerNight,_that.imageUrl,_that.bedrooms,_that.bathrooms,_that.guests,_that.landlord);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _PropertyDetails extends PropertyDetails {
  const _PropertyDetails({required this.id, required this.title, required this.description, required this.pricePerNight, required this.imageUrl, required this.bedrooms, required this.bathrooms, required this.guests, required this.landlord}): super._();
  factory _PropertyDetails.fromJson(Map<String, dynamic> json) => _$PropertyDetailsFromJson(json);

@override final  String id;
@override final  String title;
@override final  String description;
@override final  int pricePerNight;
@override final  String imageUrl;
@override final  int bedrooms;
@override final  int bathrooms;
@override final  int guests;
@override final  Landlord landlord;

/// Create a copy of PropertyDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PropertyDetailsCopyWith<_PropertyDetails> get copyWith => __$PropertyDetailsCopyWithImpl<_PropertyDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PropertyDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PropertyDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.pricePerNight, pricePerNight) || other.pricePerNight == pricePerNight)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.bedrooms, bedrooms) || other.bedrooms == bedrooms)&&(identical(other.bathrooms, bathrooms) || other.bathrooms == bathrooms)&&(identical(other.guests, guests) || other.guests == guests)&&(identical(other.landlord, landlord) || other.landlord == landlord));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,pricePerNight,imageUrl,bedrooms,bathrooms,guests,landlord);

@override
String toString() {
  return 'PropertyDetails(id: $id, title: $title, description: $description, pricePerNight: $pricePerNight, imageUrl: $imageUrl, bedrooms: $bedrooms, bathrooms: $bathrooms, guests: $guests, landlord: $landlord)';
}


}

/// @nodoc
abstract mixin class _$PropertyDetailsCopyWith<$Res> implements $PropertyDetailsCopyWith<$Res> {
  factory _$PropertyDetailsCopyWith(_PropertyDetails value, $Res Function(_PropertyDetails) _then) = __$PropertyDetailsCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, int pricePerNight, String imageUrl, int bedrooms, int bathrooms, int guests, Landlord landlord
});


@override $LandlordCopyWith<$Res> get landlord;

}
/// @nodoc
class __$PropertyDetailsCopyWithImpl<$Res>
    implements _$PropertyDetailsCopyWith<$Res> {
  __$PropertyDetailsCopyWithImpl(this._self, this._then);

  final _PropertyDetails _self;
  final $Res Function(_PropertyDetails) _then;

/// Create a copy of PropertyDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? pricePerNight = null,Object? imageUrl = null,Object? bedrooms = null,Object? bathrooms = null,Object? guests = null,Object? landlord = null,}) {
  return _then(_PropertyDetails(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,pricePerNight: null == pricePerNight ? _self.pricePerNight : pricePerNight // ignore: cast_nullable_to_non_nullable
as int,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,bedrooms: null == bedrooms ? _self.bedrooms : bedrooms // ignore: cast_nullable_to_non_nullable
as int,bathrooms: null == bathrooms ? _self.bathrooms : bathrooms // ignore: cast_nullable_to_non_nullable
as int,guests: null == guests ? _self.guests : guests // ignore: cast_nullable_to_non_nullable
as int,landlord: null == landlord ? _self.landlord : landlord // ignore: cast_nullable_to_non_nullable
as Landlord,
  ));
}

/// Create a copy of PropertyDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LandlordCopyWith<$Res> get landlord {
  
  return $LandlordCopyWith<$Res>(_self.landlord, (value) {
    return _then(_self.copyWith(landlord: value));
  });
}
}


/// @nodoc
mixin _$Landlord {

 String get id; String? get name; String? get avatarUrl;
/// Create a copy of Landlord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LandlordCopyWith<Landlord> get copyWith => _$LandlordCopyWithImpl<Landlord>(this as Landlord, _$identity);

  /// Serializes this Landlord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Landlord&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatarUrl);

@override
String toString() {
  return 'Landlord(id: $id, name: $name, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $LandlordCopyWith<$Res>  {
  factory $LandlordCopyWith(Landlord value, $Res Function(Landlord) _then) = _$LandlordCopyWithImpl;
@useResult
$Res call({
 String id, String? name, String? avatarUrl
});




}
/// @nodoc
class _$LandlordCopyWithImpl<$Res>
    implements $LandlordCopyWith<$Res> {
  _$LandlordCopyWithImpl(this._self, this._then);

  final Landlord _self;
  final $Res Function(Landlord) _then;

/// Create a copy of Landlord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? avatarUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Landlord].
extension LandlordPatterns on Landlord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Landlord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Landlord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Landlord value)  $default,){
final _that = this;
switch (_that) {
case _Landlord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Landlord value)?  $default,){
final _that = this;
switch (_that) {
case _Landlord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? name,  String? avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Landlord() when $default != null:
return $default(_that.id,_that.name,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? name,  String? avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _Landlord():
return $default(_that.id,_that.name,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? name,  String? avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _Landlord() when $default != null:
return $default(_that.id,_that.name,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _Landlord implements Landlord {
  const _Landlord({required this.id, this.name, this.avatarUrl});
  factory _Landlord.fromJson(Map<String, dynamic> json) => _$LandlordFromJson(json);

@override final  String id;
@override final  String? name;
@override final  String? avatarUrl;

/// Create a copy of Landlord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LandlordCopyWith<_Landlord> get copyWith => __$LandlordCopyWithImpl<_Landlord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LandlordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Landlord&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatarUrl);

@override
String toString() {
  return 'Landlord(id: $id, name: $name, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$LandlordCopyWith<$Res> implements $LandlordCopyWith<$Res> {
  factory _$LandlordCopyWith(_Landlord value, $Res Function(_Landlord) _then) = __$LandlordCopyWithImpl;
@override @useResult
$Res call({
 String id, String? name, String? avatarUrl
});




}
/// @nodoc
class __$LandlordCopyWithImpl<$Res>
    implements _$LandlordCopyWith<$Res> {
  __$LandlordCopyWithImpl(this._self, this._then);

  final _Landlord _self;
  final $Res Function(_Landlord) _then;

/// Create a copy of Landlord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? avatarUrl = freezed,}) {
  return _then(_Landlord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

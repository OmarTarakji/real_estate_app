// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'property_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Property {

 String get id; String get ownerId; String get propertyTypeId; String get title; String get description; String get area; String get residents; String get bathrooms; String get bedrooms; String get isNegotiable;@JsonKey(fromJson: _transactionTypeFromJson) String get transactionType; String get price; String get views; String get status; String get createdAt; String get ownerName; String get typeName; String get streetName; String get region; List<String> get images;
/// Create a copy of Property
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PropertyCopyWith<Property> get copyWith => _$PropertyCopyWithImpl<Property>(this as Property, _$identity);

  /// Serializes this Property to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Property&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.propertyTypeId, propertyTypeId) || other.propertyTypeId == propertyTypeId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.area, area) || other.area == area)&&(identical(other.residents, residents) || other.residents == residents)&&(identical(other.bathrooms, bathrooms) || other.bathrooms == bathrooms)&&(identical(other.bedrooms, bedrooms) || other.bedrooms == bedrooms)&&(identical(other.isNegotiable, isNegotiable) || other.isNegotiable == isNegotiable)&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.price, price) || other.price == price)&&(identical(other.views, views) || other.views == views)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.ownerName, ownerName) || other.ownerName == ownerName)&&(identical(other.typeName, typeName) || other.typeName == typeName)&&(identical(other.streetName, streetName) || other.streetName == streetName)&&(identical(other.region, region) || other.region == region)&&const DeepCollectionEquality().equals(other.images, images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,ownerId,propertyTypeId,title,description,area,residents,bathrooms,bedrooms,isNegotiable,transactionType,price,views,status,createdAt,ownerName,typeName,streetName,region,const DeepCollectionEquality().hash(images)]);

@override
String toString() {
  return 'Property(id: $id, ownerId: $ownerId, propertyTypeId: $propertyTypeId, title: $title, description: $description, area: $area, residents: $residents, bathrooms: $bathrooms, bedrooms: $bedrooms, isNegotiable: $isNegotiable, transactionType: $transactionType, price: $price, views: $views, status: $status, createdAt: $createdAt, ownerName: $ownerName, typeName: $typeName, streetName: $streetName, region: $region, images: $images)';
}


}

/// @nodoc
abstract mixin class $PropertyCopyWith<$Res>  {
  factory $PropertyCopyWith(Property value, $Res Function(Property) _then) = _$PropertyCopyWithImpl;
@useResult
$Res call({
 String id, String ownerId, String propertyTypeId, String title, String description, String area, String residents, String bathrooms, String bedrooms, String isNegotiable,@JsonKey(fromJson: _transactionTypeFromJson) String transactionType, String price, String views, String status, String createdAt, String ownerName, String typeName, String streetName, String region, List<String> images
});




}
/// @nodoc
class _$PropertyCopyWithImpl<$Res>
    implements $PropertyCopyWith<$Res> {
  _$PropertyCopyWithImpl(this._self, this._then);

  final Property _self;
  final $Res Function(Property) _then;

/// Create a copy of Property
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ownerId = null,Object? propertyTypeId = null,Object? title = null,Object? description = null,Object? area = null,Object? residents = null,Object? bathrooms = null,Object? bedrooms = null,Object? isNegotiable = null,Object? transactionType = null,Object? price = null,Object? views = null,Object? status = null,Object? createdAt = null,Object? ownerName = null,Object? typeName = null,Object? streetName = null,Object? region = null,Object? images = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,propertyTypeId: null == propertyTypeId ? _self.propertyTypeId : propertyTypeId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String,residents: null == residents ? _self.residents : residents // ignore: cast_nullable_to_non_nullable
as String,bathrooms: null == bathrooms ? _self.bathrooms : bathrooms // ignore: cast_nullable_to_non_nullable
as String,bedrooms: null == bedrooms ? _self.bedrooms : bedrooms // ignore: cast_nullable_to_non_nullable
as String,isNegotiable: null == isNegotiable ? _self.isNegotiable : isNegotiable // ignore: cast_nullable_to_non_nullable
as String,transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,views: null == views ? _self.views : views // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,ownerName: null == ownerName ? _self.ownerName : ownerName // ignore: cast_nullable_to_non_nullable
as String,typeName: null == typeName ? _self.typeName : typeName // ignore: cast_nullable_to_non_nullable
as String,streetName: null == streetName ? _self.streetName : streetName // ignore: cast_nullable_to_non_nullable
as String,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Property].
extension PropertyPatterns on Property {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Property value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Property() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Property value)  $default,){
final _that = this;
switch (_that) {
case _Property():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Property value)?  $default,){
final _that = this;
switch (_that) {
case _Property() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String ownerId,  String propertyTypeId,  String title,  String description,  String area,  String residents,  String bathrooms,  String bedrooms,  String isNegotiable, @JsonKey(fromJson: _transactionTypeFromJson)  String transactionType,  String price,  String views,  String status,  String createdAt,  String ownerName,  String typeName,  String streetName,  String region,  List<String> images)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Property() when $default != null:
return $default(_that.id,_that.ownerId,_that.propertyTypeId,_that.title,_that.description,_that.area,_that.residents,_that.bathrooms,_that.bedrooms,_that.isNegotiable,_that.transactionType,_that.price,_that.views,_that.status,_that.createdAt,_that.ownerName,_that.typeName,_that.streetName,_that.region,_that.images);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String ownerId,  String propertyTypeId,  String title,  String description,  String area,  String residents,  String bathrooms,  String bedrooms,  String isNegotiable, @JsonKey(fromJson: _transactionTypeFromJson)  String transactionType,  String price,  String views,  String status,  String createdAt,  String ownerName,  String typeName,  String streetName,  String region,  List<String> images)  $default,) {final _that = this;
switch (_that) {
case _Property():
return $default(_that.id,_that.ownerId,_that.propertyTypeId,_that.title,_that.description,_that.area,_that.residents,_that.bathrooms,_that.bedrooms,_that.isNegotiable,_that.transactionType,_that.price,_that.views,_that.status,_that.createdAt,_that.ownerName,_that.typeName,_that.streetName,_that.region,_that.images);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String ownerId,  String propertyTypeId,  String title,  String description,  String area,  String residents,  String bathrooms,  String bedrooms,  String isNegotiable, @JsonKey(fromJson: _transactionTypeFromJson)  String transactionType,  String price,  String views,  String status,  String createdAt,  String ownerName,  String typeName,  String streetName,  String region,  List<String> images)?  $default,) {final _that = this;
switch (_that) {
case _Property() when $default != null:
return $default(_that.id,_that.ownerId,_that.propertyTypeId,_that.title,_that.description,_that.area,_that.residents,_that.bathrooms,_that.bedrooms,_that.isNegotiable,_that.transactionType,_that.price,_that.views,_that.status,_that.createdAt,_that.ownerName,_that.typeName,_that.streetName,_that.region,_that.images);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _Property extends Property {
  const _Property({required this.id, required this.ownerId, required this.propertyTypeId, required this.title, required this.description, required this.area, required this.residents, required this.bathrooms, required this.bedrooms, required this.isNegotiable, @JsonKey(fromJson: _transactionTypeFromJson) required this.transactionType, required this.price, required this.views, required this.status, required this.createdAt, required this.ownerName, required this.typeName, required this.streetName, required this.region, required final  List<String> images}): _images = images,super._();
  factory _Property.fromJson(Map<String, dynamic> json) => _$PropertyFromJson(json);

@override final  String id;
@override final  String ownerId;
@override final  String propertyTypeId;
@override final  String title;
@override final  String description;
@override final  String area;
@override final  String residents;
@override final  String bathrooms;
@override final  String bedrooms;
@override final  String isNegotiable;
@override@JsonKey(fromJson: _transactionTypeFromJson) final  String transactionType;
@override final  String price;
@override final  String views;
@override final  String status;
@override final  String createdAt;
@override final  String ownerName;
@override final  String typeName;
@override final  String streetName;
@override final  String region;
 final  List<String> _images;
@override List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}


/// Create a copy of Property
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PropertyCopyWith<_Property> get copyWith => __$PropertyCopyWithImpl<_Property>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PropertyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Property&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.propertyTypeId, propertyTypeId) || other.propertyTypeId == propertyTypeId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.area, area) || other.area == area)&&(identical(other.residents, residents) || other.residents == residents)&&(identical(other.bathrooms, bathrooms) || other.bathrooms == bathrooms)&&(identical(other.bedrooms, bedrooms) || other.bedrooms == bedrooms)&&(identical(other.isNegotiable, isNegotiable) || other.isNegotiable == isNegotiable)&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.price, price) || other.price == price)&&(identical(other.views, views) || other.views == views)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.ownerName, ownerName) || other.ownerName == ownerName)&&(identical(other.typeName, typeName) || other.typeName == typeName)&&(identical(other.streetName, streetName) || other.streetName == streetName)&&(identical(other.region, region) || other.region == region)&&const DeepCollectionEquality().equals(other._images, _images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,ownerId,propertyTypeId,title,description,area,residents,bathrooms,bedrooms,isNegotiable,transactionType,price,views,status,createdAt,ownerName,typeName,streetName,region,const DeepCollectionEquality().hash(_images)]);

@override
String toString() {
  return 'Property(id: $id, ownerId: $ownerId, propertyTypeId: $propertyTypeId, title: $title, description: $description, area: $area, residents: $residents, bathrooms: $bathrooms, bedrooms: $bedrooms, isNegotiable: $isNegotiable, transactionType: $transactionType, price: $price, views: $views, status: $status, createdAt: $createdAt, ownerName: $ownerName, typeName: $typeName, streetName: $streetName, region: $region, images: $images)';
}


}

/// @nodoc
abstract mixin class _$PropertyCopyWith<$Res> implements $PropertyCopyWith<$Res> {
  factory _$PropertyCopyWith(_Property value, $Res Function(_Property) _then) = __$PropertyCopyWithImpl;
@override @useResult
$Res call({
 String id, String ownerId, String propertyTypeId, String title, String description, String area, String residents, String bathrooms, String bedrooms, String isNegotiable,@JsonKey(fromJson: _transactionTypeFromJson) String transactionType, String price, String views, String status, String createdAt, String ownerName, String typeName, String streetName, String region, List<String> images
});




}
/// @nodoc
class __$PropertyCopyWithImpl<$Res>
    implements _$PropertyCopyWith<$Res> {
  __$PropertyCopyWithImpl(this._self, this._then);

  final _Property _self;
  final $Res Function(_Property) _then;

/// Create a copy of Property
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ownerId = null,Object? propertyTypeId = null,Object? title = null,Object? description = null,Object? area = null,Object? residents = null,Object? bathrooms = null,Object? bedrooms = null,Object? isNegotiable = null,Object? transactionType = null,Object? price = null,Object? views = null,Object? status = null,Object? createdAt = null,Object? ownerName = null,Object? typeName = null,Object? streetName = null,Object? region = null,Object? images = null,}) {
  return _then(_Property(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,propertyTypeId: null == propertyTypeId ? _self.propertyTypeId : propertyTypeId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String,residents: null == residents ? _self.residents : residents // ignore: cast_nullable_to_non_nullable
as String,bathrooms: null == bathrooms ? _self.bathrooms : bathrooms // ignore: cast_nullable_to_non_nullable
as String,bedrooms: null == bedrooms ? _self.bedrooms : bedrooms // ignore: cast_nullable_to_non_nullable
as String,isNegotiable: null == isNegotiable ? _self.isNegotiable : isNegotiable // ignore: cast_nullable_to_non_nullable
as String,transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,views: null == views ? _self.views : views // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,ownerName: null == ownerName ? _self.ownerName : ownerName // ignore: cast_nullable_to_non_nullable
as String,typeName: null == typeName ? _self.typeName : typeName // ignore: cast_nullable_to_non_nullable
as String,streetName: null == streetName ? _self.streetName : streetName // ignore: cast_nullable_to_non_nullable
as String,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) {
  return _AddressModel.fromJson(json);
}

/// @nodoc
mixin _$AddressModel {
  String get id => throw _privateConstructorUsedError;
  String get customerId => throw _privateConstructorUsedError;
  AddressType get type => throw _privateConstructorUsedError;
  String get streetAddress => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get zipCode => throw _privateConstructorUsedError;
  String? get building => throw _privateConstructorUsedError;
  String? get floor => throw _privateConstructorUsedError;
  String? get doorNumber => throw _privateConstructorUsedError;
  String? get label =>
      throw _privateConstructorUsedError; // Custom label for 'other' type
  bool get isDefault => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this AddressModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressModelCopyWith<AddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressModelCopyWith<$Res> {
  factory $AddressModelCopyWith(
          AddressModel value, $Res Function(AddressModel) then) =
      _$AddressModelCopyWithImpl<$Res, AddressModel>;
  @useResult
  $Res call(
      {String id,
      String customerId,
      AddressType type,
      String streetAddress,
      String city,
      String state,
      String zipCode,
      String? building,
      String? floor,
      String? doorNumber,
      String? label,
      bool isDefault,
      double? latitude,
      double? longitude,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$AddressModelCopyWithImpl<$Res, $Val extends AddressModel>
    implements $AddressModelCopyWith<$Res> {
  _$AddressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? type = null,
    Object? streetAddress = null,
    Object? city = null,
    Object? state = null,
    Object? zipCode = null,
    Object? building = freezed,
    Object? floor = freezed,
    Object? doorNumber = freezed,
    Object? label = freezed,
    Object? isDefault = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AddressType,
      streetAddress: null == streetAddress
          ? _value.streetAddress
          : streetAddress // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      building: freezed == building
          ? _value.building
          : building // ignore: cast_nullable_to_non_nullable
              as String?,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as String?,
      doorNumber: freezed == doorNumber
          ? _value.doorNumber
          : doorNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressModelImplCopyWith<$Res>
    implements $AddressModelCopyWith<$Res> {
  factory _$$AddressModelImplCopyWith(
          _$AddressModelImpl value, $Res Function(_$AddressModelImpl) then) =
      __$$AddressModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String customerId,
      AddressType type,
      String streetAddress,
      String city,
      String state,
      String zipCode,
      String? building,
      String? floor,
      String? doorNumber,
      String? label,
      bool isDefault,
      double? latitude,
      double? longitude,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$AddressModelImplCopyWithImpl<$Res>
    extends _$AddressModelCopyWithImpl<$Res, _$AddressModelImpl>
    implements _$$AddressModelImplCopyWith<$Res> {
  __$$AddressModelImplCopyWithImpl(
      _$AddressModelImpl _value, $Res Function(_$AddressModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? type = null,
    Object? streetAddress = null,
    Object? city = null,
    Object? state = null,
    Object? zipCode = null,
    Object? building = freezed,
    Object? floor = freezed,
    Object? doorNumber = freezed,
    Object? label = freezed,
    Object? isDefault = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$AddressModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AddressType,
      streetAddress: null == streetAddress
          ? _value.streetAddress
          : streetAddress // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      building: freezed == building
          ? _value.building
          : building // ignore: cast_nullable_to_non_nullable
              as String?,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as String?,
      doorNumber: freezed == doorNumber
          ? _value.doorNumber
          : doorNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressModelImpl implements _AddressModel {
  const _$AddressModelImpl(
      {required this.id,
      required this.customerId,
      required this.type,
      required this.streetAddress,
      required this.city,
      required this.state,
      required this.zipCode,
      this.building,
      this.floor,
      this.doorNumber,
      this.label,
      this.isDefault = false,
      this.latitude,
      this.longitude,
      this.createdAt,
      this.updatedAt});

  factory _$AddressModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressModelImplFromJson(json);

  @override
  final String id;
  @override
  final String customerId;
  @override
  final AddressType type;
  @override
  final String streetAddress;
  @override
  final String city;
  @override
  final String state;
  @override
  final String zipCode;
  @override
  final String? building;
  @override
  final String? floor;
  @override
  final String? doorNumber;
  @override
  final String? label;
// Custom label for 'other' type
  @override
  @JsonKey()
  final bool isDefault;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'AddressModel(id: $id, customerId: $customerId, type: $type, streetAddress: $streetAddress, city: $city, state: $state, zipCode: $zipCode, building: $building, floor: $floor, doorNumber: $doorNumber, label: $label, isDefault: $isDefault, latitude: $latitude, longitude: $longitude, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.streetAddress, streetAddress) ||
                other.streetAddress == streetAddress) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode) &&
            (identical(other.building, building) ||
                other.building == building) &&
            (identical(other.floor, floor) || other.floor == floor) &&
            (identical(other.doorNumber, doorNumber) ||
                other.doorNumber == doorNumber) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      customerId,
      type,
      streetAddress,
      city,
      state,
      zipCode,
      building,
      floor,
      doorNumber,
      label,
      isDefault,
      latitude,
      longitude,
      createdAt,
      updatedAt);

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressModelImplCopyWith<_$AddressModelImpl> get copyWith =>
      __$$AddressModelImplCopyWithImpl<_$AddressModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressModelImplToJson(
      this,
    );
  }
}

abstract class _AddressModel implements AddressModel {
  const factory _AddressModel(
      {required final String id,
      required final String customerId,
      required final AddressType type,
      required final String streetAddress,
      required final String city,
      required final String state,
      required final String zipCode,
      final String? building,
      final String? floor,
      final String? doorNumber,
      final String? label,
      final bool isDefault,
      final double? latitude,
      final double? longitude,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$AddressModelImpl;

  factory _AddressModel.fromJson(Map<String, dynamic> json) =
      _$AddressModelImpl.fromJson;

  @override
  String get id;
  @override
  String get customerId;
  @override
  AddressType get type;
  @override
  String get streetAddress;
  @override
  String get city;
  @override
  String get state;
  @override
  String get zipCode;
  @override
  String? get building;
  @override
  String? get floor;
  @override
  String? get doorNumber;
  @override
  String? get label; // Custom label for 'other' type
  @override
  bool get isDefault;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressModelImplCopyWith<_$AddressModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AddressRequest _$AddressRequestFromJson(Map<String, dynamic> json) {
  return _AddressRequest.fromJson(json);
}

/// @nodoc
mixin _$AddressRequest {
  AddressType get type => throw _privateConstructorUsedError;
  String get streetAddress => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get zipCode => throw _privateConstructorUsedError;
  String get building =>
      throw _privateConstructorUsedError; // Building is now required
  String? get floor => throw _privateConstructorUsedError;
  String? get doorNumber => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;

  /// Serializes this AddressRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddressRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressRequestCopyWith<AddressRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressRequestCopyWith<$Res> {
  factory $AddressRequestCopyWith(
          AddressRequest value, $Res Function(AddressRequest) then) =
      _$AddressRequestCopyWithImpl<$Res, AddressRequest>;
  @useResult
  $Res call(
      {AddressType type,
      String streetAddress,
      String city,
      String state,
      String zipCode,
      String building,
      String? floor,
      String? doorNumber,
      String? label,
      bool isDefault,
      double? latitude,
      double? longitude});
}

/// @nodoc
class _$AddressRequestCopyWithImpl<$Res, $Val extends AddressRequest>
    implements $AddressRequestCopyWith<$Res> {
  _$AddressRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddressRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? streetAddress = null,
    Object? city = null,
    Object? state = null,
    Object? zipCode = null,
    Object? building = null,
    Object? floor = freezed,
    Object? doorNumber = freezed,
    Object? label = freezed,
    Object? isDefault = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AddressType,
      streetAddress: null == streetAddress
          ? _value.streetAddress
          : streetAddress // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      building: null == building
          ? _value.building
          : building // ignore: cast_nullable_to_non_nullable
              as String,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as String?,
      doorNumber: freezed == doorNumber
          ? _value.doorNumber
          : doorNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressRequestImplCopyWith<$Res>
    implements $AddressRequestCopyWith<$Res> {
  factory _$$AddressRequestImplCopyWith(_$AddressRequestImpl value,
          $Res Function(_$AddressRequestImpl) then) =
      __$$AddressRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AddressType type,
      String streetAddress,
      String city,
      String state,
      String zipCode,
      String building,
      String? floor,
      String? doorNumber,
      String? label,
      bool isDefault,
      double? latitude,
      double? longitude});
}

/// @nodoc
class __$$AddressRequestImplCopyWithImpl<$Res>
    extends _$AddressRequestCopyWithImpl<$Res, _$AddressRequestImpl>
    implements _$$AddressRequestImplCopyWith<$Res> {
  __$$AddressRequestImplCopyWithImpl(
      _$AddressRequestImpl _value, $Res Function(_$AddressRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddressRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? streetAddress = null,
    Object? city = null,
    Object? state = null,
    Object? zipCode = null,
    Object? building = null,
    Object? floor = freezed,
    Object? doorNumber = freezed,
    Object? label = freezed,
    Object? isDefault = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_$AddressRequestImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AddressType,
      streetAddress: null == streetAddress
          ? _value.streetAddress
          : streetAddress // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      building: null == building
          ? _value.building
          : building // ignore: cast_nullable_to_non_nullable
              as String,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as String?,
      doorNumber: freezed == doorNumber
          ? _value.doorNumber
          : doorNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressRequestImpl extends _AddressRequest {
  const _$AddressRequestImpl(
      {required this.type,
      required this.streetAddress,
      required this.city,
      required this.state,
      required this.zipCode,
      required this.building,
      this.floor,
      this.doorNumber,
      this.label,
      this.isDefault = false,
      this.latitude,
      this.longitude})
      : super._();

  factory _$AddressRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressRequestImplFromJson(json);

  @override
  final AddressType type;
  @override
  final String streetAddress;
  @override
  final String city;
  @override
  final String state;
  @override
  final String zipCode;
  @override
  final String building;
// Building is now required
  @override
  final String? floor;
  @override
  final String? doorNumber;
  @override
  final String? label;
  @override
  @JsonKey()
  final bool isDefault;
  @override
  final double? latitude;
  @override
  final double? longitude;

  @override
  String toString() {
    return 'AddressRequest(type: $type, streetAddress: $streetAddress, city: $city, state: $state, zipCode: $zipCode, building: $building, floor: $floor, doorNumber: $doorNumber, label: $label, isDefault: $isDefault, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressRequestImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.streetAddress, streetAddress) ||
                other.streetAddress == streetAddress) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode) &&
            (identical(other.building, building) ||
                other.building == building) &&
            (identical(other.floor, floor) || other.floor == floor) &&
            (identical(other.doorNumber, doorNumber) ||
                other.doorNumber == doorNumber) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      streetAddress,
      city,
      state,
      zipCode,
      building,
      floor,
      doorNumber,
      label,
      isDefault,
      latitude,
      longitude);

  /// Create a copy of AddressRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressRequestImplCopyWith<_$AddressRequestImpl> get copyWith =>
      __$$AddressRequestImplCopyWithImpl<_$AddressRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressRequestImplToJson(
      this,
    );
  }
}

abstract class _AddressRequest extends AddressRequest {
  const factory _AddressRequest(
      {required final AddressType type,
      required final String streetAddress,
      required final String city,
      required final String state,
      required final String zipCode,
      required final String building,
      final String? floor,
      final String? doorNumber,
      final String? label,
      final bool isDefault,
      final double? latitude,
      final double? longitude}) = _$AddressRequestImpl;
  const _AddressRequest._() : super._();

  factory _AddressRequest.fromJson(Map<String, dynamic> json) =
      _$AddressRequestImpl.fromJson;

  @override
  AddressType get type;
  @override
  String get streetAddress;
  @override
  String get city;
  @override
  String get state;
  @override
  String get zipCode;
  @override
  String get building; // Building is now required
  @override
  String? get floor;
  @override
  String? get doorNumber;
  @override
  String? get label;
  @override
  bool get isDefault;
  @override
  double? get latitude;
  @override
  double? get longitude;

  /// Create a copy of AddressRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressRequestImplCopyWith<_$AddressRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

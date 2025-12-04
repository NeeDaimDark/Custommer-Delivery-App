// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressModelImpl _$$AddressModelImplFromJson(Map<String, dynamic> json) =>
    _$AddressModelImpl(
      id: json['id'] as String,
      customerId: json['customerId'] as String,
      type: $enumDecode(_$AddressTypeEnumMap, json['type']),
      streetAddress: json['streetAddress'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      zipCode: json['zipCode'] as String,
      building: json['building'] as String?,
      floor: json['floor'] as String?,
      doorNumber: json['doorNumber'] as String?,
      label: json['label'] as String?,
      isDefault: json['isDefault'] as bool? ?? false,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$AddressModelImplToJson(_$AddressModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'type': _$AddressTypeEnumMap[instance.type]!,
      'streetAddress': instance.streetAddress,
      'city': instance.city,
      'state': instance.state,
      'zipCode': instance.zipCode,
      'building': instance.building,
      'floor': instance.floor,
      'doorNumber': instance.doorNumber,
      'label': instance.label,
      'isDefault': instance.isDefault,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$AddressTypeEnumMap = {
  AddressType.home: 'home',
  AddressType.office: 'office',
  AddressType.apartment: 'apartment',
  AddressType.other: 'other',
};

_$AddressRequestImpl _$$AddressRequestImplFromJson(Map<String, dynamic> json) =>
    _$AddressRequestImpl(
      type: $enumDecode(_$AddressTypeEnumMap, json['type']),
      streetAddress: json['streetAddress'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      zipCode: json['zipCode'] as String,
      building: json['building'] as String,
      floor: json['floor'] as String?,
      doorNumber: json['doorNumber'] as String?,
      label: json['label'] as String?,
      isDefault: json['isDefault'] as bool? ?? false,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$AddressRequestImplToJson(
        _$AddressRequestImpl instance) =>
    <String, dynamic>{
      'type': _$AddressTypeEnumMap[instance.type]!,
      'streetAddress': instance.streetAddress,
      'city': instance.city,
      'state': instance.state,
      'zipCode': instance.zipCode,
      'building': instance.building,
      'floor': instance.floor,
      'doorNumber': instance.doorNumber,
      'label': instance.label,
      'isDefault': instance.isDefault,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

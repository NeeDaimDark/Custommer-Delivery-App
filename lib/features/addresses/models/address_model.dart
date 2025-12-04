import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

/// Address types enum
enum AddressType {
  @JsonValue('home')
  home,
  @JsonValue('office')
  office,
  @JsonValue('apartment')
  apartment,
  @JsonValue('other')
  other,
}

/// Address model representing a delivery address
@freezed
class AddressModel with _$AddressModel {
  const factory AddressModel({
    required String id,
    required String customerId,
    required AddressType type,
    required String streetAddress,
    required String city,
    required String state,
    required String zipCode,
    String? building,
    String? floor,
    String? doorNumber,
    String? label, // Custom label for 'other' type
    @Default(false) bool isDefault,
    double? latitude,
    double? longitude,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}

/// Request model for creating/updating an address
@freezed
class AddressRequest with _$AddressRequest {
  const AddressRequest._(); // Add private constructor for custom methods

  const factory AddressRequest({
    required AddressType type,
    required String streetAddress,
    required String city,
    required String state,
    required String zipCode,
    required String building, // Building is now required
    String? floor,
    String? doorNumber,
    String? label,
    @Default(false) bool isDefault,
    double? latitude,
    double? longitude,
  }) = _AddressRequest;

  factory AddressRequest.fromJson(Map<String, dynamic> json) =>
      _$AddressRequestFromJson(json);

  /// Convert to backend API format
  Map<String, dynamic> toBackendJson() {
    // Backend expects specific field names based on Postman example
    final json = <String, dynamic>{
      'type': type.name,
      'street': streetAddress,
      'city': city,
      'isDefault': isDefault,
      // Label must always be a string, never null
      'label': (label != null && label!.isNotEmpty) ? label! : type.label,
      // Building field is required
      'building': building,
    };

    // Floor and apartment (doorNumber) - only add if not empty
    if (floor != null && floor!.isNotEmpty) {
      json['floor'] = floor;
    }
    if (doorNumber != null && doorNumber!.isNotEmpty) {
      json['apartment'] = doorNumber;
    }

    // Coordinates
    if (latitude != null) {
      json['latitude'] = latitude;
    }
    if (longitude != null) {
      json['longitude'] = longitude;
    }

    return json;
  }
}

/// Extension for AddressType to get display labels
extension AddressTypeExtension on AddressType {
  String get label {
    switch (this) {
      case AddressType.home:
        return 'Home';
      case AddressType.office:
        return 'Office';
      case AddressType.apartment:
        return 'Apartment';
      case AddressType.other:
        return 'Other';
    }
  }

  String get icon {
    switch (this) {
      case AddressType.home:
        return 'home_rounded';
      case AddressType.office:
        return 'business_rounded';
      case AddressType.apartment:
        return 'apartment_rounded';
      case AddressType.other:
        return 'place_rounded';
    }
  }
}

/// Extension for AddressModel to get formatted address
extension AddressModelExtension on AddressModel {
  String get formattedAddress {
    final parts = <String>[streetAddress];

    if (floor != null || doorNumber != null) {
      final apartment = [
        if (floor != null) 'Floor $floor',
        if (doorNumber != null) 'Door $doorNumber',
      ].join(', ');
      parts.add(apartment);
    }

    parts.add('$city, $state $zipCode');

    return parts.join(', ');
  }

  String get displayLabel {
    if (type == AddressType.other && label != null && label!.isNotEmpty) {
      return label!;
    }
    return type.label;
  }
}

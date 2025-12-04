import 'package:customer_app_temp_7/core/constants/api_constants.dart';
import 'package:customer_app_temp_7/core/services/http_client_service.dart';
import 'package:customer_app_temp_7/features/addresses/models/address_model.dart';

/// Address Service
/// Handles all address-related API calls
class AddressService {
  final HttpClientService _httpClient = HttpClientService.instance;

  // ==========================
  // Get Addresses
  // ==========================

  /// Get all addresses for the current user
  Future<List<AddressModel>> getAddresses() async {
    try {
      final response = await _httpClient.get(
        ApiConstants.addresses,
        requiresAuth: true,
      );

      // Response should be { addresses: [...] }
      final List<dynamic> addressesJson = response['addresses'] as List<dynamic>;
      return addressesJson
          .map((json) => AddressModel.fromJson(_normalizeAddressJson(json as Map<String, dynamic>)))
          .toList();
    } catch (e) {
      print('ERROR in getAddresses: $e');
      rethrow;
    }
  }

  // ==========================
  // Create Address
  // ==========================

  /// Create a new address
  Future<AddressModel> createAddress(AddressRequest request) async {
    try {
      final response = await _httpClient.post(
        ApiConstants.addresses,
        body: request.toBackendJson(),
        requiresAuth: true,
      );

      // Response should be { address: {...} }
      final addressJson = response['address'] as Map<String, dynamic>;
      return AddressModel.fromJson(_normalizeAddressJson(addressJson));
    } catch (e) {
      rethrow;
    }
  }

  // ==========================
  // Update Address
  // ==========================

  /// Update an existing address
  Future<AddressModel> updateAddress(String addressId, AddressRequest request) async {
    try {
      final response = await _httpClient.put(
        '${ApiConstants.addresses}/$addressId',
        body: request.toBackendJson(),
        requiresAuth: true,
      );

      // Response should be { address: {...} }
      final addressJson = response['address'] as Map<String, dynamic>;
      return AddressModel.fromJson(_normalizeAddressJson(addressJson));
    } catch (e) {
      rethrow;
    }
  }

  // ==========================
  // Delete Address
  // ==========================

  /// Delete an address
  Future<void> deleteAddress(String addressId) async {
    try {
      await _httpClient.delete(
        '${ApiConstants.addresses}/$addressId',
        requiresAuth: true,
      );
    } catch (e) {
      rethrow;
    }
  }

  // ==========================
  // Set Default Address
  // ==========================

  /// Set an address as default
  Future<AddressModel> setDefaultAddress(String addressId) async {
    try {
      final response = await _httpClient.put(
        '${ApiConstants.addresses}/$addressId/default',
        requiresAuth: true,
      );

      // Response should be { address: {...} }
      final addressJson = response['address'] as Map<String, dynamic>;
      return AddressModel.fromJson(_normalizeAddressJson(addressJson));
    } catch (e) {
      rethrow;
    }
  }

  // ==========================
  // Helper Methods
  // ==========================

  /// Normalize MongoDB response - maps backend fields to model fields
  Map<String, dynamic> _normalizeAddressJson(Map<String, dynamic> addressJson) {
    final normalized = {...addressJson};

    // MongoDB returns _id, but our model expects id
    if (normalized['id'] == null && normalized['_id'] != null) {
      normalized['id'] = normalized['_id'];
    }

    // Map backend field names to model field names
    if (normalized.containsKey('street')) {
      normalized['streetAddress'] = normalized['street'];
    }

    if (normalized.containsKey('apartment')) {
      normalized['doorNumber'] = normalized['apartment'];
    }

    // Add missing fields with defaults if not present
    if (!normalized.containsKey('customerId')) {
      normalized['customerId'] = ''; // Backend doesn't return customerId
    }
    if (!normalized.containsKey('state')) {
      normalized['state'] = '';
    }
    if (!normalized.containsKey('zipCode')) {
      normalized['zipCode'] = '';
    }

    return normalized;
  }
}

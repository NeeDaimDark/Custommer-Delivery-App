import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:customer_app_temp_7/features/addresses/models/address_model.dart';
import 'package:customer_app_temp_7/features/addresses/services/address_service.dart';

/// Address Service Provider
final addressServiceProvider = Provider<AddressService>((ref) {
  return AddressService();
});

/// Address List State
class AddressListState {
  final List<AddressModel> addresses;
  final bool isLoading;
  final String? error;

  AddressListState({
    this.addresses = const [],
    this.isLoading = false,
    this.error,
  });

  AddressListState copyWith({
    List<AddressModel>? addresses,
    bool? isLoading,
    String? error,
  }) {
    return AddressListState(
      addresses: addresses ?? this.addresses,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

/// Address List Notifier
class AddressListNotifier extends StateNotifier<AddressListState> {
  final AddressService _addressService;

  AddressListNotifier(this._addressService) : super(AddressListState());

  /// Load all addresses
  Future<void> loadAddresses() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final addresses = await _addressService.getAddresses();
      state = state.copyWith(
        addresses: addresses,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  /// Create a new address
  Future<AddressModel?> createAddress(AddressRequest request) async {
    try {
      final newAddress = await _addressService.createAddress(request);

      // Add to list
      final updatedAddresses = [...state.addresses, newAddress];
      state = state.copyWith(addresses: updatedAddresses);

      return newAddress;
    } catch (e) {
      state = state.copyWith(error: e.toString());
      return null;
    }
  }

  /// Update an existing address
  Future<AddressModel?> updateAddress(String addressId, AddressRequest request) async {
    try {
      final updatedAddress = await _addressService.updateAddress(addressId, request);

      // Update in list
      final updatedAddresses = state.addresses.map((addr) {
        return addr.id == addressId ? updatedAddress : addr;
      }).toList();

      state = state.copyWith(addresses: updatedAddresses);

      return updatedAddress;
    } catch (e) {
      state = state.copyWith(error: e.toString());
      return null;
    }
  }

  /// Delete an address
  Future<bool> deleteAddress(String addressId) async {
    try {
      await _addressService.deleteAddress(addressId);

      // Remove from list
      final updatedAddresses = state.addresses.where((addr) => addr.id != addressId).toList();
      state = state.copyWith(addresses: updatedAddresses);

      return true;
    } catch (e) {
      state = state.copyWith(error: e.toString());
      return false;
    }
  }

  /// Set an address as default
  Future<AddressModel?> setDefaultAddress(String addressId) async {
    try {
      final updatedAddress = await _addressService.setDefaultAddress(addressId);

      // Update all addresses: set the selected one as default, others as non-default
      final updatedAddresses = state.addresses.map((addr) {
        if (addr.id == addressId) {
          return updatedAddress;
        } else if (addr.isDefault) {
          // Remove default flag from other addresses
          return addr.copyWith(isDefault: false);
        }
        return addr;
      }).toList();

      state = state.copyWith(addresses: updatedAddresses);

      return updatedAddress;
    } catch (e) {
      state = state.copyWith(error: e.toString());
      return null;
    }
  }

  /// Clear error
  void clearError() {
    state = state.copyWith(error: null);
  }
}

/// Address List Provider
final addressListProvider = StateNotifierProvider<AddressListNotifier, AddressListState>((ref) {
  final addressService = ref.watch(addressServiceProvider);
  return AddressListNotifier(addressService);
});

/// Get default address
final defaultAddressProvider = Provider<AddressModel?>((ref) {
  final addressState = ref.watch(addressListProvider);
  try {
    return addressState.addresses.firstWhere((addr) => addr.isDefault);
  } catch (e) {
    return null;
  }
});

/// Get addresses by type
final addressesByTypeProvider = Provider.family<List<AddressModel>, AddressType>((ref, type) {
  final addressState = ref.watch(addressListProvider);
  return addressState.addresses.where((addr) => addr.type == type).toList();
});

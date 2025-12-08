import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:customer_app_temp_7/flutter_flow/flutter_flow_theme.dart';
import 'package:customer_app_temp_7/flutter_flow/flutter_flow_icon_button.dart';
import 'package:customer_app_temp_7/flutter_flow/flutter_flow_widgets.dart';
import 'package:customer_app_temp_7/features/addresses/models/address_model.dart';
import 'package:customer_app_temp_7/features/addresses/providers/address_provider.dart';
import 'package:customer_app_temp_7/features/addresses/services/location_service.dart';
import 'package:customer_app_temp_7/features/addresses/screens/map_picker_screen.dart';

class AddAddressScreen extends ConsumerStatefulWidget {
  const AddAddressScreen({
    super.key,
    required this.addressType,
    this.existingAddress, // Optional: for edit mode
  });

  final AddressType addressType;
  final AddressModel? existingAddress; // If provided, screen is in edit mode

  static String routeName = 'AddAddressScreen';
  static String routePath = '/addAddress';

  @override
  ConsumerState<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends ConsumerState<AddAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipCodeController = TextEditingController();
  final _buildingController = TextEditingController();
  final _floorController = TextEditingController();
  final _doorNumberController = TextEditingController();
  final _labelController = TextEditingController();

  final LocationService _locationService = LocationService();
  double? _latitude;
  double? _longitude;

  bool _isDefault = false;
  bool _isSaving = false;
  bool _isLoadingLocation = false;

  @override
  void initState() {
    super.initState();
    // If editing existing address, populate form fields
    if (widget.existingAddress != null) {
      final address = widget.existingAddress!;
      _streetController.text = address.streetAddress;
      _cityController.text = address.city;
      _stateController.text = address.state;
      _zipCodeController.text = address.zipCode;
      _buildingController.text = address.building ?? '';
      _floorController.text = address.floor ?? '';
      _doorNumberController.text = address.doorNumber ?? '';
      _labelController.text = address.label ?? '';
      _latitude = address.latitude;
      _longitude = address.longitude;
      _isDefault = address.isDefault;
    }
  }

  @override
  void dispose() {
    _streetController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipCodeController.dispose();
    _buildingController.dispose();
    _floorController.dispose();
    _doorNumberController.dispose();
    _labelController.dispose();
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    setState(() => _isLoadingLocation = true);
    try {
      final locationData = await _locationService.getCurrentLocation();
      if (locationData != null) {
        setState(() {
          _streetController.text = locationData.street;
          _cityController.text = locationData.city;
          _stateController.text = locationData.state;
          _zipCodeController.text = locationData.zipCode;
          _latitude = locationData.latitude;
          _longitude = locationData.longitude;
        });
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location detected successfully')),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to get location')),
          );
        }
      }
    } finally {
      setState(() => _isLoadingLocation = false);
    }
  }

  Future<void> _selectOnMap() async {
    final LatLng? result = await Navigator.push<LatLng>(
      context,
      MaterialPageRoute(
        builder: (context) => MapPickerScreen(
          initialLocation: _latitude != null && _longitude != null
              ? LatLng(_latitude!, _longitude!)
              : null,
        ),
      ),
    );

    if (result != null) {
      setState(() => _isLoadingLocation = true);
      final locationData = await _locationService.getAddressFromLatLng(result);
      setState(() => _isLoadingLocation = false);

      if (locationData != null) {
        setState(() {
          _streetController.text = locationData.street;
          _cityController.text = locationData.city;
          _stateController.text = locationData.state;
          _zipCodeController.text = locationData.zipCode;
          _latitude = locationData.latitude;
          _longitude = locationData.longitude;
        });
      }
    }
  }

  Future<void> _saveAddress() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isSaving = true);

    final request = AddressRequest(
      type: widget.addressType,
      streetAddress: _streetController.text.trim(),
      city: _cityController.text.trim(),
      state: _stateController.text.trim(),
      zipCode: _zipCodeController.text.trim(),
      building: _buildingController.text.trim(),
      floor: _floorController.text.trim().isEmpty ? null : _floorController.text.trim(),
      doorNumber: _doorNumberController.text.trim().isEmpty ? null : _doorNumberController.text.trim(),
      label: _labelController.text.trim().isEmpty ? null : _labelController.text.trim(),
      isDefault: _isDefault,
      latitude: _latitude,
      longitude: _longitude,
    );

    // Check if we're in edit mode (updating) or create mode
    final isEditMode = widget.existingAddress != null;
    final dynamic result;

    if (isEditMode) {
      // Update existing address
      result = await ref
          .read(addressListProvider.notifier)
          .updateAddress(widget.existingAddress!.id, request);
    } else {
      // Create new address
      result = await ref.read(addressListProvider.notifier).createAddress(request);
    }

    setState(() => _isSaving = false);

    if (result != null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(isEditMode ? 'Address updated successfully' : 'Address added successfully'),
          ),
        );
        Navigator.of(context).pop(true);
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(isEditMode ? 'Failed to update address' : 'Failed to add address'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 8.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              size: 24.0,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            widget.existingAddress != null ? 'Update Address' : 'Add Address',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.merriweather(
                    fontWeight: FontWeight.w600,
                  ),
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  letterSpacing: 0.0,
                ),
          ),
          centerTitle: true,
          elevation: 4.0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Material(
                    color: Colors.transparent,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: FlutterFlowTheme.of(context).primary,
                            offset: const Offset(0.0, 2.0),
                            spreadRadius: 4.0,
                          )
                        ],
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _streetController,
                            decoration: InputDecoration(
                              labelText: 'Street Address',
                              hintText: 'Enter your street address',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter street address';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16.0),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _cityController,
                                  decoration: InputDecoration(
                                    labelText: 'City',
                                    hintText: 'City',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'Required';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 12.0),
                              Expanded(
                                child: TextFormField(
                                  controller: _stateController,
                                  decoration: InputDecoration(
                                    labelText: 'State',
                                    hintText: 'State',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'Required';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            controller: _zipCodeController,
                            decoration: InputDecoration(
                              labelText: 'Zip Code',
                              hintText: 'Enter zip code',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter zip code';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            controller: _buildingController,
                            decoration: InputDecoration(
                              labelText: 'Building',
                              hintText: 'Enter building name/number',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter building';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 24.0),
                          // Map preview (if location selected)
                          if (_latitude != null && _longitude != null)
                            Container(
                              height: 200,
                              margin: const EdgeInsets.only(bottom: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: GoogleMap(
                                  initialCameraPosition: CameraPosition(
                                    target: LatLng(_latitude!, _longitude!),
                                    zoom: 15,
                                  ),
                                  markers: {
                                    Marker(
                                      markerId: const MarkerId('selected'),
                                      position: LatLng(_latitude!, _longitude!),
                                    ),
                                  },
                                  zoomControlsEnabled: false,
                                  scrollGesturesEnabled: false,
                                  zoomGesturesEnabled: false,
                                  tiltGesturesEnabled: false,
                                  rotateGesturesEnabled: false,
                                  myLocationButtonEnabled: false,
                                  mapToolbarEnabled: false,
                                ),
                              ),
                            ),
                          // Location buttons
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed: _isLoadingLocation ? null : _getCurrentLocation,
                                  icon: _isLoadingLocation
                                      ? const SizedBox(
                                          width: 16,
                                          height: 16,
                                          child: CircularProgressIndicator(strokeWidth: 2),
                                        )
                                      : Icon(
                                          Icons.my_location,
                                          color: FlutterFlowTheme.of(context).primary,
                                        ),
                                  label: Text(
                                    'Get Current Location',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    side: BorderSide(
                                      color: FlutterFlowTheme.of(context).primary,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed: _isLoadingLocation ? null : _selectOnMap,
                                  icon: Icon(
                                    Icons.map,
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                  label: Text(
                                    'Select on Map',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    side: BorderSide(
                                      color: FlutterFlowTheme.of(context).primary,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24.0),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _floorController,
                                  decoration: InputDecoration(
                                    labelText: 'Floor (Optional)',
                                    hintText: 'Floor',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12.0),
                              Expanded(
                                child: TextFormField(
                                  controller: _doorNumberController,
                                  decoration: InputDecoration(
                                    labelText: 'Door Number (Optional)',
                                    hintText: 'Door',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (widget.addressType == AddressType.other) ...[
                            const SizedBox(height: 16.0),
                            TextFormField(
                              controller: _labelController,
                              decoration: InputDecoration(
                                labelText: 'Label',
                                hintText: 'e.g., Gym, Friend\'s House',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                          ],
                          const SizedBox(height: 16.0),
                          CheckboxListTile(
                            title: Text(
                              'Set as default address',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.ubuntu(),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            value: _isDefault,
                            onChanged: (value) {
                              setState(() => _isDefault = value ?? false);
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32.0),
                  FFButtonWidget(
                    onPressed: _isSaving ? null : _saveAddress,
                    text: _isSaving
                        ? (widget.existingAddress != null ? 'Updating...' : 'Saving...')
                        : (widget.existingAddress != null ? 'Update Address' : 'Save Address'),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 56.0,
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                            font: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.w600,
                            ),
                            color: FlutterFlowTheme.of(context).info,
                            letterSpacing: 0.0,
                          ),
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(28.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

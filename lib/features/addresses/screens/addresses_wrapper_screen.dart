/// This wrapper replaces the hardcoded Change Address screen with dynamic content
///
/// Use this screen instead of ChangeAdressWidget for dynamic address management

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:customer_app_temp_7/flutter_flow/flutter_flow_theme.dart';
import 'package:customer_app_temp_7/flutter_flow/flutter_flow_icon_button.dart';
import 'package:customer_app_temp_7/features/addresses/providers/address_provider.dart';
import 'package:customer_app_temp_7/features/addresses/models/address_model.dart';
import 'package:customer_app_temp_7/features/addresses/screens/add_address_screen.dart';

class AddressesWrapperScreen extends ConsumerStatefulWidget {
  const AddressesWrapperScreen({super.key});

  static String routeName = 'AddressesWrapper';
  static String routePath = '/addressesWrapper';

  @override
  ConsumerState<AddressesWrapperScreen> createState() => _AddressesWrapperScreenState();
}

class _AddressesWrapperScreenState extends ConsumerState<AddressesWrapperScreen> {
  @override
  void initState() {
    super.initState();
    // Load addresses when page opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(addressListProvider.notifier).loadAddresses();
    });
  }

  Future<void> _navigateToAddAddress(AddressType type) async {
    final result = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (context) => AddAddressScreen(addressType: type),
      ),
    );

    if (result == true) {
      // Reload addresses after adding
      ref.read(addressListProvider.notifier).loadAddresses();
    }
  }

  @override
  Widget build(BuildContext context) {
    final addressState = ref.watch(addressListProvider);

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
            'Change Address',
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Address Type Selection
                Text(
                  'Select Address Type',
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        font: GoogleFonts.merriweather(fontWeight: FontWeight.w600),
                        letterSpacing: 0.0,
                      ),
                ),
                const SizedBox(height: 16.0),

                // Row 1: Home & Office
                Row(
                  children: [
                    Expanded(
                      child: _AddressTypeCard(
                        icon: Icons.home_rounded,
                        label: 'Home',
                        color: FlutterFlowTheme.of(context).primary,
                        onTap: () => _navigateToAddAddress(AddressType.home),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: _AddressTypeCard(
                        icon: Icons.business_rounded,
                        label: 'Office',
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        onTap: () => _navigateToAddAddress(AddressType.office),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),

                // Row 2: Apartment & Other
                Row(
                  children: [
                    Expanded(
                      child: _AddressTypeCard(
                        icon: Icons.apartment_rounded,
                        label: 'Apartment',
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        onTap: () => _navigateToAddAddress(AddressType.apartment),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: _AddressTypeCard(
                        icon: Icons.place_rounded,
                        label: 'Other',
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        onTap: () => _navigateToAddAddress(AddressType.other),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 32.0),

                // Saved Addresses Section
                Text(
                  'Saved Addresses',
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        font: GoogleFonts.merriweather(fontWeight: FontWeight.w600),
                        letterSpacing: 0.0,
                      ),
                ),
                const SizedBox(height: 16.0),

                // Loading State
                if (addressState.isLoading)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: CircularProgressIndicator(),
                    ),
                  ),

                // Error State
                if (addressState.error != null)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Error: ${addressState.error}',
                      style: TextStyle(color: FlutterFlowTheme.of(context).error),
                    ),
                  ),

                // Empty State
                if (!addressState.isLoading &&
                    addressState.error == null &&
                    addressState.addresses.isEmpty)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.location_off_rounded,
                            size: 64.0,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            'No addresses yet',
                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                  font: GoogleFonts.merriweather(fontWeight: FontWeight.w600),
                                  letterSpacing: 0.0,
                                ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Please add an address above to proceed',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.ubuntu(),
                                  color: FlutterFlowTheme.of(context).secondaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),

                // Address List
                if (!addressState.isLoading &&
                    addressState.error == null &&
                    addressState.addresses.isNotEmpty)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: addressState.addresses.length,
                    itemBuilder: (context, index) {
                      final address = addressState.addresses[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: FlutterFlowTheme.of(context).primary,
                                offset: const Offset(0.0, 2.0),
                                spreadRadius: 1.0,
                              ),
                            ],
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 12.0,
                            ),
                            title: Row(
                              children: [
                                Text(
                                  address.displayLabel,
                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                        font: GoogleFonts.merriweather(fontWeight: FontWeight.w600),
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                if (address.isDefault)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                        vertical: 4.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).primary,
                                        borderRadius: BorderRadius.circular(4.0),
                                      ),
                                      child: Text(
                                        'Default',
                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                              font: GoogleFonts.ubuntu(),
                                              color: FlutterFlowTheme.of(context).info,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                address.formattedAddress,
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      font: GoogleFonts.ubuntu(),
                                      color: FlutterFlowTheme.of(context).secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.delete_outline_rounded,
                                color: FlutterFlowTheme.of(context).error,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                final confirmed = await showDialog<bool>(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Delete Address'),
                                    content: const Text('Are you sure you want to delete this address?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context, false),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(context, true),
                                        child: const Text('Delete'),
                                      ),
                                    ],
                                  ),
                                );
                                if (confirmed == true) {
                                  await ref
                                      .read(addressListProvider.notifier)
                                      .deleteAddress(address.id);
                                }
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AddressTypeCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _AddressTypeCard({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isPrimary = color == FlutterFlowTheme.of(context).primary;

    return InkWell(
      onTap: onTap,
      child: Container(
        height: 80.0,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: FlutterFlowTheme.of(context).primary,
              offset: const Offset(0.0, 2.0),
              spreadRadius: isPrimary ? 4.0 : 1.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isPrimary
                  ? FlutterFlowTheme.of(context).secondaryBackground
                  : FlutterFlowTheme.of(context).primaryText,
              size: 32.0,
            ),
            const SizedBox(height: 8.0),
            Text(
              label,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.ubuntu(),
                    color: isPrimary
                        ? FlutterFlowTheme.of(context).secondaryBackground
                        : FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0.0,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

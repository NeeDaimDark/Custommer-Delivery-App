import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlong2;
import 'package:google_fonts/google_fonts.dart';
import 'track_order_model.dart';
export 'track_order_model.dart';

class TrackOrderWidget extends StatefulWidget {
  const TrackOrderWidget({super.key});

  static String routeName = 'Track_Order';
  static String routePath = '/trackOrder';

  @override
  State<TrackOrderWidget> createState() => _TrackOrderWidgetState();
}

class _TrackOrderWidgetState extends State<TrackOrderWidget> {
  late TrackOrderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrackOrderModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
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
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Track Order',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
              font: GoogleFonts.merriweather(
                fontWeight: FontWeight.w600,
                fontStyle:
                FlutterFlowTheme.of(context).headlineMedium.fontStyle,
              ),
              color: FlutterFlowTheme.of(context).secondaryBackground,
              letterSpacing: 0.0,
            ),
          ),
          centerTitle: true,
          elevation: 4.0,
        ),
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: FlutterMap(
                    mapController: _model.mapController,
                    options: MapOptions(
                      center: _model.mapCenter ?? const latlong2.LatLng(36.212, 9.871),
                      zoom: 13.0,
                      onTap: (tapPosition, point) {
                        // Optional: handle map taps
                      },
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.yourdomain.app', // Replace with your app package name
                        maxZoom: 19,
                      ),
                      // Current location marker
                      MarkerLayer(
                        markers: [
                          if (_model.currentPosition != null)
                            Marker(
                              point: latlong2.LatLng(
                                _model.currentPosition!.latitude,
                                _model.currentPosition!.longitude,
                              ),
                              width: 40,
                              height: 40,
                              builder: (context) => Icon(
                                Icons.location_on,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 40,
                              ),
                            ),
                          // Restaurant marker (example position)
                          Marker(
                            point: const latlong2.LatLng(36.22, 9.88), // Change to actual restaurant location
                            width: 40,
                            height: 40,
                            builder: (context) => const Icon(
                              Icons.restaurant,
                              color: Colors.red,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Map controls - Zoom in, Zoom out, My location
            Align(
              alignment: const AlignmentDirectional(1.0, 0.3),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Zoom in button
                    InkWell(
                      onTap: () {
                        if (_model.mapController.zoom < 19) {
                          _model.mapController.move(
                            _model.mapCenter ?? const latlong2.LatLng(36.212, 9.871),
                            _model.mapController.zoom + 1,
                          );
                        }
                      },
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x19000000),
                              offset: Offset(0.0, 2.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            Icons.add,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),

                    // Zoom out button
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: InkWell(
                        onTap: () {
                          if (_model.mapController.zoom > 3) {
                            _model.mapController.move(
                              _model.mapCenter ?? const latlong2.LatLng(36.212, 9.871),
                              _model.mapController.zoom - 1,
                            );
                          }
                        },
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primaryBackground,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x19000000),
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Icon(
                              Icons.remove,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // My location button
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: InkWell(
                        onTap: () async {
                          await _model.getCurrentLocation();
                        },
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primaryBackground,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x19000000),
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Icon(
                              Icons.my_location,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Keep your existing bottom order card
            // [... rest of your bottom card code remains unchanged ...]
          ],
        ),
      ),
    );
  }
}
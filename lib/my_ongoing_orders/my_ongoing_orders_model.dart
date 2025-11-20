import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_ongoing_orders_widget.dart' show MyOngoingOrdersWidget;
import 'package:flutter/material.dart';

class MyOngoingOrdersModel extends FlutterFlowModel<MyOngoingOrdersWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    navbarModel.dispose();
  }
}

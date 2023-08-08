import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditTaskModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for taskTitle widget.
  TextEditingController? taskTitleController;
  String? Function(BuildContext, String?)? taskTitleControllerValidator;
  // State field(s) for taskDetails widget.
  TextEditingController? taskDetailsController;
  String? Function(BuildContext, String?)? taskDetailsControllerValidator;
  // State field(s) for category widget.
  String? categoryValue;
  FormFieldController<String>? categoryValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    taskTitleController?.dispose();
    taskDetailsController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

import 'package:adviqo_challenge/other/navigator_service.dart';
import 'package:flutter/material.dart';

class ViewUtil {
  static showSnackBar(String msg, [int duration = 2]) {
    final context = NavigatorService.currentContext;
    if (context != null) {
      ScaffoldMessenger.of(NavigatorService.currentContext!)
          .showSnackBar(SnackBar(content: Text(msg)));
    }
  }

  static hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }


}

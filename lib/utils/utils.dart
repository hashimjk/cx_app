import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class Utils {
  static void flushbarError(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        forwardAnimationCurve: Curves.easeInOut,
        duration: Duration(seconds: 2),
        flushbarPosition: FlushbarPosition.BOTTOM,
      )..show(context),
    );
  }

  static String getFlagCode(String currencyCode) {
    return currencyCode.substring(0, 2);
  }
}

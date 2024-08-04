import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class HFunction {
  static Future<void> showFlushBar(
      {required BuildContext context,
      required String message,
      required bool isError}) async {
    await Flushbar(
      backgroundColor: isError ? Colors.red : Colors.green,
      messageColor: Colors.white,
      message: message,
      duration: const Duration(seconds: 2),
    ).show(context);
  }

  static void showFlushBarError(
      {required BuildContext context,
      required String message,
      Function? afterPop}) async {
    await showFlushBar(context: context, message: message, isError: true)
        .then((value) {
      if (afterPop != null) {
        afterPop();
      }
    });
  }

  static void showFlushBarSuccess(
      {required BuildContext context,
      required String message,
      Function? afterPop}) async {
    await showFlushBar(context: context, message: message, isError: false)
        .then((value) {
      if (afterPop != null) {
        afterPop();
      }
    });
  }
}

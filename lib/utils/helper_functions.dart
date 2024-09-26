import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:hisab/main.dart';

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

  static dynamic getFromUser({
    required String entityType,
    required int entityId,
  }) async {
    try {
      if (entityId <= 0) {
        throw Exception("Invalid entity ID");
      }

      switch (entityType) {
        case "User":
          final user = await database.getUserById(entityId);
          return user;

        case "Firm":
          final firm = await database.getFirm(entityId);
          return firm;

        case "Site":
          final site = await database.getSite(entityId);
          return site;

        default:
          throw Exception("Invalid entity type: $entityType");
      }
    } catch (e) {
      debugPrint("Error in getFromUser: $e");
      return null; // or handle the error accordingly
    }
  }
}

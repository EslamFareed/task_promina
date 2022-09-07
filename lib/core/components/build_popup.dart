import 'package:flutter/material.dart';

Future<dynamic> buildPopUpMessage({
  required BuildContext context,
  required Widget title,
  required Widget content,
  required List<Widget> actions,
  bool barrierDismissible = false,
}) async {
  return await showDialog(
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: title,
        content: content,
        actions: actions,
      );
    },
  );
}

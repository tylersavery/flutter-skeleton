import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/app.dart';

class InfoDialog {
  static show({
    required String title,
    String? body,
    Widget? content,
    String? closeText,
  }) async {
    final context = rootNavigatorKey.currentContext!;

    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: body != null ? Text(body) : content,
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(closeText ?? "Close"),
            )
          ],
        );
      },
    );
  }
}

class ConfirmDialog {
  static show({
    required String title,
    Widget? content,
    String? body,
    String? cancelText,
    String? confirmText,
    bool destructive = false,
  }) async {
    final context = rootNavigatorKey.currentContext!;

    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: body != null ? Text(body) : content,
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(cancelText ?? "No"),
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: destructive
                    ? Theme.of(context).colorScheme.error
                    : Theme.of(context).colorScheme.primary,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(confirmText ?? "Yes"),
            )
          ],
        );
      },
    );
  }
}

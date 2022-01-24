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

class PromptModal {
  static Future<String?> show({
    required String title,
    required String? Function(String?) validator,
    required labelText,
    bool obscureText = false,
    String? cancelText,
    String? confirmText,
    String initialValue = "",
    bool destructive = false,
  }) async {
    final context = rootNavigatorKey.currentContext!;

    final GlobalKey<FormState> _formKey = GlobalKey();

    final TextEditingController _controller =
        TextEditingController(text: initialValue);

    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Form(
            key: _formKey,
            child: TextFormField(
              controller: _controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                label: Text(labelText),
              ),
              validator: validator,
            ),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop(null);
              },
              child: Text(cancelText ?? "Cancel"),
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: destructive
                    ? Theme.of(context).colorScheme.error
                    : Theme.of(context).colorScheme.primary,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                if (!_formKey.currentState!.validate()) return;
                final value = _controller.value.text;
                Navigator.of(context).pop(value.isNotEmpty ? value : null);
              },
              child: Text(confirmText ?? "Okay"),
            )
          ],
        );
      },
    );
  }
}

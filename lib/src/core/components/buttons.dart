// ignore_for_file: constant_identifier_names

import 'package:flutter_skeleton/src/feature/theme/app_theme.dart';

import 'package:flutter/material.dart';

enum AppButtonType { Elevated, Outlined, Text }

class AppButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  final AppButtonType type;
  final AppColorVariant variant;
  final bool processing;
  final IconData? icon;
  final bool iconTrails;

  const AppButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.type = AppButtonType.Elevated,
    this.variant = AppColorVariant.Primary,
    this.processing = false,
    this.icon,
    this.iconTrails = false,
  }) : super(key: key);

  ButtonStyle _styleElevated(BuildContext context) {
    switch (variant) {
      case AppColorVariant.Primary:
        return ElevatedButton.styleFrom(
          primary: Theme.of(context).colorScheme.primaryButtonBg,
          onPrimary: Theme.of(context).colorScheme.primaryButtonFg,
        );
      case AppColorVariant.Secondary:
        return ElevatedButton.styleFrom(
          primary: Theme.of(context).colorScheme.secondaryButtonBg,
          onPrimary: Theme.of(context).colorScheme.secondaryButtonFg,
        );
      case AppColorVariant.Danger:
        return ElevatedButton.styleFrom(
          primary: Theme.of(context).colorScheme.dangerButtonBg,
          onPrimary: Theme.of(context).colorScheme.dangerButtonFg,
        );
    }
  }

  ButtonStyle _styleOutlined(BuildContext context) {
    final _colorScheme = Theme.of(context).colorScheme;

    switch (variant) {
      case AppColorVariant.Primary:
        return OutlinedButton.styleFrom(
          primary: _colorScheme.primaryButtonBg,
        );
      case AppColorVariant.Secondary:
        return OutlinedButton.styleFrom(
          primary: _colorScheme.secondaryButtonBg,
        );
      case AppColorVariant.Danger:
        return OutlinedButton.styleFrom(
          primary: _colorScheme.dangerButtonBg,
        );
    }
  }

  ButtonStyle _styleText(BuildContext context) {
    final _colorScheme = Theme.of(context).colorScheme;
    switch (variant) {
      case AppColorVariant.Primary:
        return OutlinedButton.styleFrom(
          primary: _colorScheme.primaryButtonBg,
        );
      case AppColorVariant.Secondary:
        return OutlinedButton.styleFrom(
          primary: _colorScheme.secondaryButtonBg,
        );
      case AppColorVariant.Danger:
        return OutlinedButton.styleFrom(
          primary: _colorScheme.dangerButtonBg,
        );
    }
  }

  Color _iconColor(context) {
    final _colorScheme = Theme.of(context).colorScheme;

    switch (type) {
      case AppButtonType.Elevated:
        switch (variant) {
          case AppColorVariant.Primary:
            return _colorScheme.primaryButtonFg;
          case AppColorVariant.Secondary:
            return _colorScheme.secondaryButtonFg;
          case AppColorVariant.Danger:
            return _colorScheme.dangerButtonFg;
        }
      case AppButtonType.Text:
      case AppButtonType.Outlined:
        switch (variant) {
          case AppColorVariant.Primary:
            return _colorScheme.primaryButtonBg;
          case AppColorVariant.Secondary:
            return _colorScheme.secondaryButtonBg;
          case AppColorVariant.Danger:
            return _colorScheme.dangerButtonBg;
        }
    }
  }

  Widget _child(BuildContext context) {
    if (icon != null || processing) {
      return Wrap(
        textDirection: iconTrails ? TextDirection.rtl : TextDirection.ltr,
        children: [
          processing
              ? SizedBox(
                  width: 12,
                  height: 12,
                  child: CircularProgressIndicator(
                    color: _iconColor(context),
                    strokeWidth: 2.0,
                  ),
                )
              : Icon(
                  icon,
                  size: 16,
                  color: _iconColor(context),
                ),
          const SizedBox(
            width: 6,
          ),
          Text(label),
        ],
      );
    }

    return Text(label);
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AppButtonType.Elevated:
        return ElevatedButton(
          onPressed: processing ? () {} : onPressed,
          child: _child(context),
          style: _styleElevated(context),
        );
      case AppButtonType.Outlined:
        return OutlinedButton(
          onPressed: processing ? () {} : onPressed,
          child: _child(context),
          style: _styleOutlined(context),
        );
      case AppButtonType.Text:
        return TextButton(
          onPressed: processing ? () {} : onPressed,
          child: _child(context),
          style: _styleText(context),
        );
    }
  }
}

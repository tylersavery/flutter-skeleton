import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/generated/l10n.dart';
import 'package:flutter_skeleton/src/app.dart';
import 'package:flutter_skeleton/src/core/app/singletons.dart';
import 'package:flutter_skeleton/src/core/app/storage.dart';

class LocaleProvider extends StateNotifier<Locale> {
  LocaleProvider(this.read, Locale locale) : super(locale);

  final Reader read;

  void setLocale(Locale locale, [bool save = true]) {
    state = locale;
    if (save) {
      saveLocaleToStorage(locale);
    }
  }

  String get languageCode => state.languageCode;
  String? get countryCode => state.countryCode;

  static List<Locale> get supportedLocales => S.delegate.supportedLocales;

  static Locale localeFromLocaleName(String localeName) {
    final parts = localeName.split("_");
    final languageCode = parts[0];
    final countryCode = parts.length > 1 ? parts[1] : null;
    final locale = LocaleProvider.localeFromSubtags(
        languageCode: languageCode, countryCode: countryCode);
    return locale;
  }

  static Locale localeFromSubtags({
    String languageCode = 'und',
    String? countryCode,
  }) {
    return Locale.fromSubtags(
        languageCode: languageCode, countryCode: countryCode);
  }

  static Locale get deviceLanguage {
    String? localeString;
    try {
      localeString = Platform.localeName;
    } catch (e) {
      localeString = "en";
    }

    Locale? locale;
    for (final _locale in LocaleProvider.supportedLocales) {
      if (_locale.toString() == localeString) {
        locale = _locale;
        break;
      }
    }

    return locale ?? LocaleProvider.supportedLocales.first;
  }

  void saveLocaleToStorage(Locale locale) {
    singleton<Storage>().setString(Storage.LANGUAGE_KEY, locale.toString());
  }

  static String localeToLabel(Locale locale, [localize = false]) {
    final str = locale.toString();

    final context = rootNavigatorKey.currentContext!;

    switch (str) {
      case 'en':
        return localize ? S.of(context).languageEnglish : "English";
      case 'ja_JP':
        return localize ? S.of(context).languageJapanese : "日本";
      default:
        return str;
    }
  }
}

final localeProvider = StateNotifierProvider<LocaleProvider, Locale>((ref) {
  Locale locale = LocaleProvider.deviceLanguage;

  final _savedLocale = singleton<Storage>().getString(Storage.LANGUAGE_KEY);
  if (_savedLocale != null) {
    locale = LocaleProvider.localeFromLocaleName(_savedLocale);
  }

  return LocaleProvider(ref.read, locale);
});

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:circles/generated/l10n.dart'
    show S;

class AppLocalization {
  static const Locale defaultLocale = Locale('en');

  static const List<Locale> supportedLocales = [Locale('en'), Locale('ar')];

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    S.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static List<Locale> get supportedLocalesList => S.delegate.supportedLocales;
}

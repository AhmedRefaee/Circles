import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light);

  static const String _themeKey = 'themeMode';
  static const String _lightValue = 'light';
  static const String _darkValue = 'dark';
  static const String _systemValue = 'system';

  void switchTheme(ThemeMode themeMode) {
    emit(themeMode);
  }

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    final themeValue = json[_themeKey] as String?;
    
    switch (themeValue) {
      case _lightValue:
        return ThemeMode.light;
      case _darkValue:
        return ThemeMode.dark;
      case _systemValue:
        return ThemeMode.system;
      default:
        return ThemeMode.light;
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    final themeValue = switch (state) {
      ThemeMode.light => _lightValue,
      ThemeMode.dark => _darkValue,
      ThemeMode.system => _systemValue,
    };
    
    return {_themeKey: themeValue};
  }
}

import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class SwitchlocaleCubit extends HydratedCubit<Locale> {
  SwitchlocaleCubit() : super(const Locale('en'));
  
  void switchLanguage() {
    final currentLocale = state;
    final newLocale = currentLocale.languageCode == 'en' 
        ? const Locale('ar') 
        : const Locale('en');
    emit(newLocale);
  }
  
  @override
  Locale? fromJson(Map<String, dynamic> json) {
    return Locale(json['languageCode'] as String);
  }
  
  @override
  Map<String, dynamic>? toJson(Locale state) {
    return {'languageCode': state.languageCode};
  }
}
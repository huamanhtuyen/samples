import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = Locale('vi');

  Locale get locale => _locale;

  Future<void> setLocale(Locale locale) async {
    _locale = locale;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', locale.languageCode);
  }

  Future<void> loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('language') ?? 'vi';
    _locale = Locale(languageCode);
    notifyListeners();
  }
}

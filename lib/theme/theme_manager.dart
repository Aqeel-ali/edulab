//state provider for theme mode

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((_) {
  return throw UnimplementedError();
});

final appThemeProvider = ChangeNotifierProvider((ref) {
  return AppTheme(ref.watch(sharedPreferencesProvider));
});

class AppTheme extends ChangeNotifier {
  AppTheme(this._prefs);

  final SharedPreferences _prefs;

  /// Get the current value from SharedPreferences.
  bool getTheme() => _prefs.getBool('isLigthMode') ?? false;

  /// Store the current value in SharedPreferences.
  void setTheme(bool isLigthMode) {
    _prefs.setBool('isLigthMode', isLigthMode);
    notifyListeners();
  }
}

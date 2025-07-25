import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'storage.s.g.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

@riverpod
StorageService storageService(Ref ref) {
  return StorageService(ref.watch(sharedPreferencesProvider));
}

class StorageService {
  final SharedPreferences _prefs;
  
  StorageService(this._prefs);
  
  // Theme
  static const _themeKey = 'theme_mode';
  
  String? getThemeMode() => _prefs.getString(_themeKey);
  
  Future<void> setThemeMode(String mode) => _prefs.setString(_themeKey, mode);
  
  // Generic methods
  Future<bool> setBool(String key, bool value) => _prefs.setBool(key, value);
  
  bool? getBool(String key) => _prefs.getBool(key);
  
  Future<bool> setString(String key, String value) => _prefs.setString(key, value);
  
  String? getString(String key) => _prefs.getString(key);
  
  Future<bool> setInt(String key, int value) => _prefs.setInt(key, value);
  
  int? getInt(String key) => _prefs.getInt(key);
  
  Future<bool> remove(String key) => _prefs.remove(key);
  
  Future<bool> clear() => _prefs.clear();
}
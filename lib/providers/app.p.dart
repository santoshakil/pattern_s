import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../screens/home/home.v.dart';
import '../screens/settings/settings.v.dart';
import '../services/storage.s.dart';

part 'app.p.g.dart';

@riverpod
GoRouter router(Ref ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
}

@riverpod
class ThemeMode extends _$ThemeMode {
  @override
  ThemeMode build() {
    final storage = ref.watch(storageServiceProvider);
    final savedTheme = storage.getThemeMode();
    
    switch (savedTheme) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
  
  Future<void> setThemeMode(ThemeMode mode) async {
    final storage = ref.read(storageServiceProvider);
    
    final modeString = switch (mode) {
      ThemeMode.light => 'light',
      ThemeMode.dark => 'dark',
      ThemeMode.system => 'system',
    };
    
    await storage.setThemeMode(modeString);
    state = mode;
  }
}
import 'package:flutter/material.dart'
    show MaterialApp, WidgetsFlutterBinding, runApp;
import 'package:flutter/services.dart' show SystemChrome;
import 'package:hive_flutter/hive_flutter.dart';

import 'database/functions.dart' show HiveFuntions;
import 'helpers/themes/themes.dart' show theme, uiConfig;
import 'screens/wrapper.dart' show Wrapper;

Future<void> main() async {
  await _init();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: Wrapper(),
    ),
  );
}

Future<void> _init() async {
  await Hive.initFlutter();
  HiveFuntions.registerHiveAdepters();
  await HiveFuntions.openAllBoxes();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(uiConfig);
}

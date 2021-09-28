import 'package:flutter/material.dart' show Color, Colors;
import 'package:flutter/services.dart' show SystemUiOverlayStyle;

import '../../database/hive.dart' show Boxes;
import '../../models/config/config.dart' show Configs;
import '../../models/theme/theme.dart' show Themes;
import 'light/light.dart' show lightUiConfig;

const Color white = Colors.white;
const Color black = Colors.black;
const Color grey = Colors.grey;

Themes? get themeType => Boxes.configs
    .get('data', defaultValue: Configs(theme: Themes.light))!
    .theme;

SystemUiOverlayStyle get uiConfig =>
    themeType == Themes.light ? lightUiConfig : lightUiConfig;

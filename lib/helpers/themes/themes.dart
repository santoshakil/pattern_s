import 'package:flutter/material.dart' show Color, Colors, ThemeData;
import 'package:flutter/services.dart' show SystemUiOverlayStyle;

import '../../database/hive.dart' show Boxes;
import '../../models/theme/theme.dart' show Themes;
import 'light/light.dart' show lightTheme, lightUiConfig;

const Color white = Colors.white;
const Color black = Colors.black;
const Color grey = Colors.grey;

Themes get themeType => Boxes.configs.get('data')!.theme ?? Themes.light;

ThemeData get theme => themeType == Themes.light ? lightTheme : lightTheme;
SystemUiOverlayStyle get uiConfig =>
    themeType == Themes.light ? lightUiConfig : lightUiConfig;

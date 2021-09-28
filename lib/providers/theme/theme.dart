import 'package:flutter/material.dart' show ChangeNotifier, ThemeData;

import '../../database/hive.dart' show Boxes;
import '../../helpers/themes/light/light.dart' show lightTheme;
import '../../helpers/themes/themes.dart' show themeType;
import '../../models/config/config.dart' show Configs;
import '../../models/theme/theme.dart' show Themes;

class ThemeProvider with ChangeNotifier {
  ThemeData get theme => themeType == Themes.light ? lightTheme : lightTheme;

  Future<void> changeTheme(Themes data) async {
    if (Boxes.configs.containsKey('data')) {
      var _data = Boxes.configs.get('data')!;
      _data.theme = data;
      await _data.save();
    } else {
      await Boxes.configs
          .put('data', Configs(theme: Themes.light, isFirstLaunch: false));
    }
    notifyListeners();
  }
}

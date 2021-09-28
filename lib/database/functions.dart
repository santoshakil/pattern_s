import 'package:hive/hive.dart' show Hive;

import '../models/config/config.dart' show Configs, ConfigsAdapter;
import '../models/theme/theme.dart' show ThemesAdapter;
import 'hive.dart' show BoxNames, Boxes;

class HiveFuntions {
  static void registerHiveAdepters() {
    Hive.registerAdapter(ThemesAdapter());
    Hive.registerAdapter(ConfigsAdapter());
  }

  static Future<void> openAllBoxes() async {
    await Hive.openBox<Configs>(BoxNames.configs);
  }

  static Future<void> closeAllBoxes() async {
    await Boxes.configs.close();
  }

  static Future<void> clearAllBoxes() async {
    await Boxes.configs.clear();
  }

  static Future<void> deleteAllBoxes() async {
    await Hive.deleteBoxFromDisk(BoxNames.configs);
  }
}

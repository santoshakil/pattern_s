import 'package:hive/hive.dart' show Hive;

import '../models/config/config.dart' show Configs;

class Boxes {
  static var configs = Hive.box<Configs>(BoxNames.configs);
}

class BoxNames {
  static const String configs = 'configs';
}

class HiveTypes {
  static const int themes = 0;
  static const int configs = 1;
}

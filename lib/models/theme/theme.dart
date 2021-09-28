import 'package:hive/hive.dart';

import '../../database/hive.dart' show HiveTypes;

part 'theme.g.dart';

@HiveType(typeId: HiveTypes.themes)
enum Themes {
  @HiveField(0)
  light,
  @HiveField(1)
  dark,
}

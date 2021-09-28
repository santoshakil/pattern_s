// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThemesAdapter extends TypeAdapter<Themes> {
  @override
  final int typeId = 0;

  @override
  Themes read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Themes.light;
      case 1:
        return Themes.dark;
      default:
        return Themes.light;
    }
  }

  @override
  void write(BinaryWriter writer, Themes obj) {
    switch (obj) {
      case Themes.light:
        writer.writeByte(0);
        break;
      case Themes.dark:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

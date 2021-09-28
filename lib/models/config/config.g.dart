// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConfigsAdapter extends TypeAdapter<Configs> {
  @override
  final int typeId = 1;

  @override
  Configs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Configs(
      isFirstLaunch: fields[0] == null ? true : fields[0] as bool?,
      theme: fields[1] == null ? Themes.light : fields[1] as Themes?,
    );
  }

  @override
  void write(BinaryWriter writer, Configs obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.isFirstLaunch)
      ..writeByte(1)
      ..write(obj.theme);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConfigsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

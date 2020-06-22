// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brightness_provider.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BrightnessProviderAdapter extends TypeAdapter<BrightnessProvider> {
  @override
  final typeId = 0;
  
  @override
  BrightnessProvider read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BrightnessProvider()..isDark = fields[0] as bool;
  }

  @override
  void write(BinaryWriter writer, BrightnessProvider obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.isDark);
  }
}

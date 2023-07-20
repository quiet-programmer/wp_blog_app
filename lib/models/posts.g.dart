// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostsAdapter extends TypeAdapter<Posts> {
  @override
  final typeId = 0;

  @override
  Posts read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Posts(
      title: fields[1]==null?"Error":fields[1] as String,
      image: fields[2]==null?"":fields[2] as String,
      contents: fields[3]==null?"":fields[3] as String,
      time: fields[4]==null?"":fields[4] as String,
      authur: fields[5]==null?"admin":fields[5] as String,
    )..isDark = fields[0] as bool;
  }

  @override
  void write(BinaryWriter writer, Posts obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.isDark)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.contents)
      ..writeByte(4)
      ..write(obj.time)
      ..writeByte(5)
      ..write(obj.authur);
  }
}

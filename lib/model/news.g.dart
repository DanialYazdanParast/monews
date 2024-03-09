// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsAdapter extends TypeAdapter<News> {
  @override
  final int typeId = 1;

  @override
  News read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return News(
      image: fields[0] as String,
      titel: fields[1] as String,
      summary: fields[2] as String,
      description: fields[3] as String,
      type: fields[4] as String,
      newsicon: fields[5] as String,
      newsname: fields[6] as String,
      time: fields[7] as String,
      hashtag: (fields[8] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, News obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.titel)
      ..writeByte(2)
      ..write(obj.summary)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.newsicon)
      ..writeByte(6)
      ..write(obj.newsname)
      ..writeByte(7)
      ..write(obj.time)
      ..writeByte(8)
      ..write(obj.hashtag);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

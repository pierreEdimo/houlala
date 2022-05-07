// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_page.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PageAdapter extends TypeAdapter<Page> {
  @override
  final int typeId = 4;

  @override
  Page read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Page(
      name: fields[0] as String?,
      id: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Page obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_datas.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonalDataAdapter extends TypeAdapter<PersonalData> {
  @override
  final int typeId = 2;

  @override
  PersonalData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PersonalData(
      firstName: fields[0] as String?,
      lastName: fields[1] as String?,
      email: fields[2] as String?,
      telephoneNumber: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PersonalData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.telephoneNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonalDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

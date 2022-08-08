// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_order.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OfflineOrderAdapter extends TypeAdapter<OfflineOrder> {
  @override
  final int typeId = 1;

  @override
  OfflineOrder read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OfflineOrder(
      locationId: fields[0] as String?,
      locationName: fields[1] as String?,
      totalPrice: fields[3] as int?,
      totalQuantity: fields[2] as int?,
      cartItems: (fields[4] as List?)?.cast<CartItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, OfflineOrder obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.locationId)
      ..writeByte(1)
      ..write(obj.locationName)
      ..writeByte(2)
      ..write(obj.totalQuantity)
      ..writeByte(3)
      ..write(obj.totalPrice)
      ..writeByte(4)
      ..write(obj.cartItems);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OfflineOrderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

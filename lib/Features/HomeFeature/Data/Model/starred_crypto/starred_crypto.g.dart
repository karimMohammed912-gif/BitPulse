// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'starred_crypto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StarredCryptoAdapter extends TypeAdapter<StarredCrypto> {
  @override
  final int typeId = 0;

  @override
  StarredCrypto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StarredCrypto(
      id: fields[0] as String,
      name: fields[1] as String,
      symbol: fields[2] as String,
      image: fields[3] as String,
      starredAt: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, StarredCrypto obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.symbol)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.starredAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StarredCryptoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

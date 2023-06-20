// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryItemModelAdapter extends TypeAdapter<CategoryItemModel> {
  @override
  final int typeId = 1;

  @override
  CategoryItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryItemModel(
      id: fields[1] as String,
      date: fields[2] as String,
      categoryId: fields[3] as String,
      title: fields[4] as String,
      poster: fields[5] as String,
      type: fields[6] as String,
      rate: fields[7] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryItemModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.categoryId)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.poster)
      ..writeByte(6)
      ..write(obj.type)
      ..writeByte(7)
      ..write(obj.rate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

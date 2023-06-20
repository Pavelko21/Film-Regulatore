// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

part 'category_item_model.g.dart';

// for build runner
@HiveType(typeId: 1)
class CategoryItemModel {
  @HiveField(1)
  String id;
  @HiveField(2)
  String date;
  @HiveField(3)
  String categoryId;
  @HiveField(4)
  String title;
  @HiveField(5)
  String poster;
  @HiveField(6)
  String type;
  @HiveField(7)
  double rate;

  CategoryItemModel({
    required this.id,
    required this.date,
    required this.categoryId,
    required this.title,
    required this.poster,
    required this.type,
    required this.rate,
  });
}

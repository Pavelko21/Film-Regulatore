import 'package:hive_flutter/hive_flutter.dart';
part 'category_model.g.dart'; // for build runner

@HiveType(typeId: 0)
class CategoryModel {
  @HiveField(1)
  String title;

  @HiveField(2)
  int color;

  CategoryModel({
    required this.title,
    required this.color,
  });
}

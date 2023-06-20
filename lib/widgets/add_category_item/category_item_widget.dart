import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieinfo/models/category_model/category_model.dart';
import 'package:movieinfo/widgets/add_category_item/add_category_item.dart';

class CategoryItemWidget extends StatefulWidget {
  final CategoryModel categoryModel;
  final int index;

  const CategoryItemWidget({
    Key? key,
    required this.categoryModel,
    required this.index,
  }) : super(key: key);

  @override
  State<CategoryItemWidget> createState() => _CategoryItemWidgetState();
}

class _CategoryItemWidgetState extends State<CategoryItemWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.categoryModel.title,
        style: GoogleFonts.rubik(
          fontWeight: FontWeight.w600,
          fontSize: 22,
          color: Colors.amber,
        ),
      ),
      trailing: InkWell(
        child: Icon(
          Icons.done_outline,
          color: isSelected ? Colors.green : Colors.grey,
        ),
        onTap: () {
          setState(() {
            isSelected = !isSelected;
            if (isSelected) {
              categoryTitles
                  .add(widget.categoryModel.title.trim().toLowerCase());
            } else {
              categoryTitles.removeAt(widget.index);
            }
          });
        },
      ),
    );
  }
}

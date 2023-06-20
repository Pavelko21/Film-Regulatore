// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieinfo/models/category_item_model/category_item_model.dart';
import 'package:movieinfo/widgets/add_category_item/category_item_widget.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:movieinfo/models/category_model/category_model.dart';
import 'package:movieinfo/widgets/category_button/cubit/category_button_cubit.dart';

List<String> categoryTitles = [];

Future<void> showAddCategoryDialog({
  required BuildContext context,
  required String id,
  required String date,
  required String title,
  required String poster,
  required String type,
  required double rate,
}) async {
  final categoryBox = Hive.box<CategoryModel>('Category');
  final categoryItemsBox = Hive.box<CategoryItemModel>('CategoryItems');

  Future<void> addCategory() async {
    if (categoryTitles.isNotEmpty) {
      for (var i = 0; i < categoryTitles.length; i++) {
        await categoryItemsBox.add(
          CategoryItemModel(
            id: id,
            date: date,
            categoryId: categoryTitles[i].trim().toLowerCase(),
            title: title,
            poster: poster,
            type: type,
            rate: rate,
          ),
        );
      }

      BlocProvider.of<CategoryButtonCubit>(context).like(
        date: date,
        id: id,
        poster: poster,
        rating: rate,
        title: title,
        type: type,
      );
      categoryTitles.clear();
    }
  }

  await showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        content: SizedBox(
          height: 400,
          width: 200,
          child: StatefulBuilder(
            builder: (_, setState) => Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ValueListenableBuilder<Box<CategoryModel>>(
                  valueListenable: categoryBox.listenable(),
                  builder: (context, myBox, child) => ListView.builder(
                    itemCount: myBox.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: CategoryItemWidget(
                          categoryModel: myBox.getAt(index)!,
                          index: index,
                        ),
                      );
                    },
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        await addCategory();
                        Navigator.pop(context);
                      },
                      child: Text(
                          'Add',
                          style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movieinfo/models/category_item_model/category_item_model.dart';
import 'package:movieinfo/models/category_model/category_model.dart';
import 'package:movieinfo/screens/my_list_screen/widgets/add_dialog.dart';
import 'package:movieinfo/screens/my_list_screen/widgets/detailed_category_items.dart';

import '../../constants.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({Key? key}) : super(key: key);

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  final categoryBox = Hive.box<CategoryModel>('Category');
  final categoryItemBox = Hive.box<CategoryItemModel>('CategoryItems');
  Future<void> remoteItem(int index) async {
    await categoryBox.deleteAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        onPressed: () async => await showAddDialog(context: context),
        child: const Icon(Icons.add,
        size: 40,),
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(height: 29),
            Padding(
              padding: const EdgeInsets.fromLTRB(23, 15, 0, 0),
              child: Text(
                "My Lists",
                style: GoogleFonts.rubik(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  color: Colors.amber.shade600,
                  fontSize: 38,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 22, 8, 8),
              child: ValueListenableBuilder<Box<CategoryModel>>(
                  valueListenable: categoryBox.listenable(),
                  builder: (context, myBox, child) {
                    return myBox.isEmpty
                        ? const Center(
                            child: Text(
                              'No categories',
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 25,
                              ),
                            ),
                          )
                        : GridView.builder(
                            itemCount: myBox.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: GestureDetector(
                                  onDoubleTap: () async =>
                                      await remoteItem(index),
                                  onTap: () async => await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailedCategoryItems(
                                              categoryId:
                                                  myBox.getAt(index)!.title),
                                    ),
                                  ),
                                  child: CategoryTitle(
                                    categoryModel: myBox.getAt(index)!,
                                  ),
                                ),
                              );
                            },
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 28 / 12,
                            ),
                          );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTitle extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryTitle({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 120,
          color: Color(categoryModel.color),
          child: Stack(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(2, 1, 0, 0),
                      child: Text(
                        categoryModel.title,
                        style: normalText.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      categoryModel.title,
                      style: normalText.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

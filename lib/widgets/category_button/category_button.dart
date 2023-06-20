import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movieinfo/message_service/message_service.dart';
import 'package:movieinfo/models/category_model/category_model.dart';
import 'package:movieinfo/widgets/add_category_item/add_category_item.dart';
import 'package:movieinfo/widgets/category_button/cubit/category_button_cubit.dart';

class CategoryButton extends StatelessWidget {
  final String id;
  final String date;
  final String title;
  final String poster;
  final String type;
  final double rate;

  const CategoryButton({
    Key? key,
    required this.id,
    required this.date,
    required this.title,
    required this.poster,
    required this.type,
    required this.rate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryButtonCubit()..init(id),
      child: BlocBuilder<CategoryButtonCubit, CategoryButtonState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: ClipRRect(
              child: Container(
                padding: const EdgeInsets.all(0),
                decoration: const BoxDecoration(),
                child: InkWell(
                  onTap: () async {
                    if (!state.isLiked) {
                      if (Hive.box<CategoryModel>('Category').isEmpty) {
                        MessageService.displaySnackbar(
                            context: context, message: 'No categories');
                      } else {
                        await showAddCategoryDialog(
                          context: context,
                          date: date,
                          id: id,
                          poster: poster,
                          rate: rate,
                          title: title,
                          type: type,
                        );
                      }
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        !state.isLiked
                            ? const Icon(
                                Icons.add_box_outlined,
                                color: Colors.white,
                                size: 20,
                              )
                            : const Icon(
                                Icons.add_box,
                                color: Colors.amber,
                                size: 20,
                              ),
                        const SizedBox(width: 10),
                        Text(
                          !state.isLiked ? "Add to My Lists" : "Added to Lists",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

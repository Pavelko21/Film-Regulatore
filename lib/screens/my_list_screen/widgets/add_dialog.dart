import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movieinfo/message_service/message_service.dart';
import 'package:movieinfo/models/category_model/category_model.dart';
import 'package:movieinfo/screens/my_list_screen/widgets/category_colors.dart';

Future<void> showAddDialog({required BuildContext context}) async {
  final box = Hive.box<CategoryModel>('Category');
  final textController = TextEditingController();
  int selectedIndex = 0;

  Future<void> addCategory() async {
    await box
        .add(
          CategoryModel(
              title: textController.text, color: colors[selectedIndex].value),
        )
        .then((value) => Navigator.pop(context));
  }

  Future<void> validateData() async {
    if (textController.text.isNotEmpty) {
      if (box.isEmpty) {
        await addCategory();
      } else {
        bool isExistsDublicates = false;
        for (var i = 0; i < box.length; i++) {
          if (box.getAt(i)!.title.toLowerCase().trim() ==
              textController.text.toLowerCase().trim()) {
            isExistsDublicates = true;
            break;
          }
        }

        if (isExistsDublicates == false) {
          await addCategory();
        } else {
          MessageService.displaySnackbar(
            context: context,
            message: 'Title already exists',
          );
        }
      }
    } else {
      MessageService.displaySnackbar(
        context: context,
        message: 'Add title',
      );
    }
  }

  await showDialog(
    barrierColor: Colors.black26,
    context: context,
    builder: (_) {
      return AlertDialog(
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              validateData();
            },
            child: const Text('Add'),
          ),
        ],
        contentPadding: const EdgeInsets.all(4.0),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                maxLength: 25,
                controller: textController,
                decoration: const InputDecoration(
                  hintText: 'Category title',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            StatefulBuilder(
              builder: (context, setState) => SizedBox(
                height: 55,
                width: 268,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: colors.length,
                  shrinkWrap: true,
                  itemBuilder: ((_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () async {
                          setState(
                            () => selectedIndex = index,
                          );
                          print('color ${colors[index].value}');
                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: colors[index],
                          ),
                          child: selectedIndex == index
                              ? const Icon(Icons.done)
                              : const SizedBox(),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

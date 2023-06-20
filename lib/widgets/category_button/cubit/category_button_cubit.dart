import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movieinfo/models/category_item_model/category_item_model.dart';

part 'category_button_state.dart';

class CategoryButtonCubit extends Cubit<CategoryButtonState> {
  CategoryButtonCubit() : super(CategoryButtonState.initial());
  var box = Hive.box<CategoryItemModel>('CategoryItems');

  void init(String id) {
    bool isExists = false;
    if (box.isNotEmpty) {
      isExists =
          box.values.where((element) => element.id == id).toList().isEmpty
              ? false
              : true;
    }
    if (isExists) {
      emit(state.copyWith(isLiked: true));
    } else {
      emit(state.copyWith(isLiked: false));
    }
  }

  void like({
    required String id,
    required String title,
    required String poster,
    required double rating,
    required String type,
    required String date,
  }) {
    if (state.isLiked) {
      box.delete(id);
      emit(state.copyWith(isLiked: false));
    } else {
      emit(state.copyWith(isLiked: true));
    }
  }
}

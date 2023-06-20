import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'wish_button_state.dart';

class WishButtonCubit extends Cubit<WishButtonState> {
  WishButtonCubit() : super(WishButtonState.initial());

  void init(String id) {
    var box = Hive.box('Wishlist');
    var value = box.containsKey(id);

    if (value) {
      emit(state.copyWith(isWish: true));
    } else {
      emit(state.copyWith(isWish: false));
    }
  }

  void wish({
    required String id,
    required String title,
    required String poster,
    required double rating,
    required String type,
    required String date,
  }) {
    var box = Hive.box('Wishlist');
    if (state.isWish) {
      box.delete(id);
      emit(state.copyWith(isWish: false));
    } else {
      emit(state.copyWith(isWish: true));

      box.put(id, {
        'id': id,
        'title': title,
        'poster': poster,
        'rating': rating,
        'type': type,
        'date': date,
      });
    }
  }
}

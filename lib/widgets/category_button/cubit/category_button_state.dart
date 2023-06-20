part of 'category_button_cubit.dart';

class CategoryButtonState extends Equatable {
  final bool isLiked;
  const CategoryButtonState(this.isLiked);
  factory CategoryButtonState.initial() => const CategoryButtonState(false);

  CategoryButtonState copyWith({bool? isLiked}) {
    return CategoryButtonState(
      isLiked ?? this.isLiked,
    );
  }

  @override
  List<Object?> get props => [isLiked];
}

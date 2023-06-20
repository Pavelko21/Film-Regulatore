part of 'wish_button_cubit.dart';

class WishButtonState extends Equatable {
  final bool isWish;
  const WishButtonState(
    this.isWish,
  );
  factory WishButtonState.initial() => const WishButtonState(false);

  WishButtonState copyWith({
    bool? isWish,
  }) {
    return WishButtonState(
      isWish ?? this.isWish,
    );
  }

  @override
  List<Object?> get props => [isWish];
}

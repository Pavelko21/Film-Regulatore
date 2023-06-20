import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/wish_button_cubit.dart';

class WishButton extends StatelessWidget {
  final String id;
  final String date;
  final String title;
  final String poster;
  final String type;
  final double rate;

  const WishButton({
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
      create: (context) => WishButtonCubit()..init(id),
      child: BlocBuilder<WishButtonCubit, WishButtonState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Container(
              // decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     boxShadow: kElevationToShadow[2]),
              child: ClipRRect(
                child: Container(
                  padding: const EdgeInsets.all(0),
                  decoration: const BoxDecoration(
                      // color: Colors.black.withOpacity(.5),
                      ),
                  child: InkWell(
                    onTap: () {
                      BlocProvider.of<WishButtonCubit>(context).wish(
                          date: date,
                          id: id,
                          poster: poster,
                          rating: rate,
                          title: title,
                          type: type);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          !state.isWish
                              ? const Icon(
                                  CupertinoIcons.bookmark,
                                  color: Colors.white,
                                  size: 20,
                                )
                              : const Icon(
                                  CupertinoIcons.bookmark_solid,
                                  color: Colors.amber,
                                  size: 20,
                                ),
                          const SizedBox(width: 10),
                          Text(
                            !state.isWish
                                ? "Add to Wishlist"
                                : "In Wishlist",
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
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StarDisplay extends StatelessWidget {
  final double value;
  const StarDisplay({Key? key, this.value = 0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          value.round()/2-0.49 > index //|| value > 0 && value % 1 >= 0.5
              //? value % 1 >= 0.5 && value < 1
                //? CupertinoIcons.star_lefthalf_fill
                ? CupertinoIcons.star_fill
              : CupertinoIcons.star,
          color: Colors.amber.shade700.withOpacity(0.8),
          size: 16,
        );
      }),
    );
  }
}

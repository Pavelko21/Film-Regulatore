import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';

class CopyLink extends StatelessWidget {
  final String tmdbId;
  final String title;
  final String id;
  final String type;
  const CopyLink({
    Key? key,
    required this.tmdbId,
    required this.title,
    required this.id,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        CupertinoIcons.link,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(
        "Copy URL",
        style: normalText.copyWith(color: Colors.white),
      ),
      onTap: () {
        Clipboard.setData(ClipboardData(
            text: "https://www.themoviedb.org/" + tmdbId));
        Navigator.pop(context);
      },
    );
  }
}

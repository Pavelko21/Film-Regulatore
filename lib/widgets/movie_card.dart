import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../animation.dart';
import '../constants.dart';
import '../screens/movie_info_screen/movie_Info_screen.dart';
import '../screens/tvshow_info_screen/tvshow_info_screen.dart';
import 'star_icon_display.dart';

class MovieCard extends StatelessWidget {
  final String poster;
  final String name;
  final String backdrop;
  final String date;
  final String id;
  final Color color;
  final VoidCallback onTap;
  final bool isMovie;
  const MovieCard({
    Key? key,
    required this.poster,
    required this.name,
    required this.backdrop,
    required this.date,
    required this.id,
    required this.color,
    required this.onTap,
    required this.isMovie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
          constraints: const BoxConstraints(minHeight: 280),
          child: Column(
            children: [
              Container(
                height: 200,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade900,
                  boxShadow: kElevationToShadow[8],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: poster,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.rajdhani(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                    Text(
                      date,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: normalText.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        color: color.withOpacity(.8),
                      ),
                    ),
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

class HorizontalMovieCard extends StatelessWidget {
  final String poster;
  final String name;
  final String backdrop;
  final String date;
  final double rate;
  final String id;
  final Color color;
  final bool isMovie;
  const HorizontalMovieCard({
    Key? key,
    required this.poster,
    required this.name,
    required this.backdrop,
    required this.date,
    required this.id,
    required this.color,
    required this.isMovie,
    required this.rate,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    dynamic ratecolor;
    if (rate < 2) {
      ratecolor = Color(0xFFDB0900);
    } else if (rate < 3) {
      ratecolor = Color(0xFFFF3F3C);
    }else if (rate < 4) {
      ratecolor = Color(0xFFFF6E6D);
    }else if (rate < 5) {
      ratecolor = Color(0xFFC9AFAF);
    }else if (rate < 5.5) {
      ratecolor = Color(0xFF859E87);
    }else if (rate < 6) {
      ratecolor = Color(0xFF79AD82);
    }else if (rate < 7.5) {
      ratecolor = Color(0xFF72C47A);
    }else if (rate < 8.5) {
      ratecolor = Color(0xFF50C75A);
    } else {ratecolor = Color(0xFF00E116);}

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: InkWell(
        onTap: () {
          if (isMovie) {
            pushNewScreen(
              context,
              MovieDetailsScreen(
                id: id,
                backdrop: backdrop,
              ),
            );
          } else {
            pushNewScreen(
              context,
              TvShowDetailScreen(
                backdrop: backdrop,
                id: id,
              ),
            );
          }
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(boxShadow: kElevationToShadow[8]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: AspectRatio(
                    aspectRatio: 9 / 14,
                    child: CachedNetworkImage(
                      imageUrl: poster,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Container(
                        color: Colors.grey.shade900,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.rajdhani(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                    const SizedBox(height: 0),
                    Text(
                      date,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: normalText.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: color.withOpacity(.8),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        IconTheme(
                          data: const IconThemeData(
                            color: Colors.amberAccent,
                            size: 20,
                          ),
                          child: StarDisplay(
                            value: rate,
                          ),
                        ),

                        Text(
                          "  " + rate.toStringAsFixed(2),
                          style: normalText.copyWith(
                            color: ratecolor,
                            letterSpacing: 1.2,
                          ),
                        ),
                        Text(
                          "/10",
                          style: normalText.copyWith(
                            color: Colors.grey,
                            letterSpacing: 1.2,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

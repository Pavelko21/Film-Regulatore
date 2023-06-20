import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../animation.dart';
import '../../constants.dart';
import '../../models/genre_model.dart';
import 'genre/cubit/genre_results_cubit.dart';
import 'genre/genre_results.dart';
import 'results/cubit/search_results_cubit.dart';
import 'results/search_results.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final genres = GenresList.fromJson(genreslist).list;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(
              height: 34,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                style: normalText.copyWith(color: Colors.white),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {},
                  ),
                  hintText: "Search movies, serials or persons...",
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 20,
                  ),
                  hintStyle: TextStyle(
                    letterSpacing: .0,
                    color: Colors.white.withOpacity(.7),
                  ),
                  fillColor: Colors.white.withOpacity(.1),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade600,
                      width: .2,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade600,
                      width: .2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade600,
                      width: .2,
                    ),
                  ),
                ),
                onSubmitted: (query) {
                  if (query.isNotEmpty) {
                    pushNewScreen(
                        context,
                        BlocProvider(
                          create: (context) =>
                              SearchResultsCubit()..init(query),
                          child: SearchResults(query: query),
                        ));
                  }
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.fromLTRB(23, 15, 0, 0),
              child: Text(
                "Popular Genres",
                style: heading.copyWith(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 28 / 12),
                children: [
                  for (var i = 0; i < 4; i++)
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GenreTile(
                        genre: genres[i],
                      ),
                    )
                ],
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.fromLTRB(23, 15, 0, 0),
              child: Text(
                "Other Genres",
                style: heading.copyWith(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 28 / 12),
                children: [
                  for (var i = 4; i < genres.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GenreTile(
                        genre: genres[i],
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GenreTile extends StatelessWidget {
  final Genres genre;
  const GenreTile({
    Key? key,
    required this.genre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          pushNewScreen(
              context,
              BlocProvider(
                create: (context) => GenreResultsCubit()..init(genre.id),
                child: GenreResults(query: genre.name),
              ));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            color: genre.color,
            child: Stack(
              children: [
                const SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                ),
                Positioned(
                  bottom: -39,
                  right: 50,
                  child: RotationTransition(
                    turns: const AlwaysStoppedAnimation(340 / 360),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: CachedNetworkImage(
                          imageUrl: genre.image3,
                          fit: BoxFit.cover,
                          width: 55,
                          height: 65,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -20,
                  right: 25,
                  child: RotationTransition(
                    turns: const AlwaysStoppedAnimation(360 / 360),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: CachedNetworkImage(
                          imageUrl: genre.image2,
                          fit: BoxFit.cover,
                          width: 55,
                          height: 65,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -15,
                  right: -5,
                  child: RotationTransition(
                    turns: const AlwaysStoppedAnimation(380 / 360),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: CachedNetworkImage(
                          imageUrl: genre.image1,
                          fit: BoxFit.cover,
                          width: 55,
                          height: 65,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 6.0, vertical: 6.0),
                  padding: const EdgeInsets.fromLTRB(5,0,5,0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: Colors.white.withOpacity(0.5))),
                  // child: Text(
                  //   genre.name,
                  //   style: normalText.copyWith(
                  //     fontWeight: FontWeight.w700,
                  //     color: Colors.white,
                  //   ),
                  // ),

                    child: Stack(
                      children: [
                      Container(
                         padding: const EdgeInsets.fromLTRB(2, 1, 0, 0),
                            child: Text(
                        genre.name,
                        style: normalText.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                        ),
                      ),
                        Container(
                          // padding: const EdgeInsets.fromLTRB(1, 2, 0, 0),
                          child: Text(
                            genre.name,
                            style: normalText.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
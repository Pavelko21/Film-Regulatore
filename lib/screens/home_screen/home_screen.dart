import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../animation.dart';
import '../../models/movie_model.dart';
import '../../models/tv_model.dart';
import '../../widgets/header_text.dart';
import '../../widgets/horizontal_list_cards.dart';
import '../../widgets/movie_home.dart';
import '../../widgets/no_results_found.dart';
import 'bloc/fetch_home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
    _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchHomeBloc()..add(FetchHomeData()),
      child: BlocBuilder<FetchHomeBloc, FetchHomeState>(
        builder: (context, state) {
          if (state is FetchHomeLoaded) {
            return HomeScreenWidget(
              topRated: state.topRated,
              topShows: state.topShows,
              nowPlaying: state.nowPlaying,
              tvShows: state.topShows,
              tranding: state.tranding,
              upcoming: state.upcoming,
            );
          } else if (state is FetchHomeError) {
            return const ErrorPage();
          } else if (state is FetchHomeLoading) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.grey.shade700,
                  strokeWidth: 2,
                  backgroundColor: Colors.amberAccent,
                ),
              ),
            );
          }
          return const Scaffold();
        },
      ),
    );
  }
}

class HomeScreenWidget extends StatelessWidget {
  final List<MovieModel> tranding;
  final List<MovieModel> topRated;
  final List<TvModel> tvShows;
  final List<TvModel> topShows;
  final List<MovieModel> upcoming;
  final List<MovieModel> nowPlaying;
  const HomeScreenWidget({
    Key? key,
    required this.tranding,
    required this.topRated,
    required this.tvShows,
    required this.topShows,
    required this.upcoming,
    required this.nowPlaying,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Color(0xff242423),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MoviesPage(movies: tranding),
              SizedBox(height: 16),
              const DelayedDisplay(
                  delay: Duration(microseconds: 800),
                  child: HeaderText(
                      text: "Now In Cinemas",)),
              DelayedDisplay(
                delay: const Duration(microseconds: 800),
                child: HorizontalListViewMovies(
                  list: tranding,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const HeaderText(text: "Upcoming Releases"),
              HorizontalListViewMovies(
                list: upcoming,
              ),
              const SizedBox(
                height: 12,
              ),
              const HeaderText(text: "Serials Online"),
              HorizontalListViewTv(
                list: tvShows,
              ),
              const SizedBox(
                height: 12,
              ),
              const HeaderText(text: "Top Rated Movies"),
              HorizontalListViewMovies(
                list: topRated,
              ),
              const SizedBox(
                height: 12,
              ),
              const HeaderText(text: "Top Rated Serials"),
              HorizontalListViewTv(
                list: topShows,
              ),
              const SizedBox(
                height: 12,
              ),
              const HeaderText(text: "Digital Releases"),
              HorizontalListViewMovies(
                list: nowPlaying,
              )
            ],
          ),
        ),
      ),
    );
  }
}

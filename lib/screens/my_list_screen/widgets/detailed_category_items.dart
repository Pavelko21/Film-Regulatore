import 'dart:developer';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movieinfo/models/category_item_model/category_item_model.dart';
import '../../../models/formated_time_genrator.dart';
import '../../../widgets/movie_card.dart';

class DetailedCategoryItems extends StatefulWidget {
  final String categoryId;
  const DetailedCategoryItems({Key? key, required this.categoryId})
      : super(key: key);

  @override
  State<DetailedCategoryItems> createState() => _DetailedCategoryItemsState();
}

class _DetailedCategoryItemsState extends State<DetailedCategoryItems> {
  final categoryItemsBox = Hive.box<CategoryItemModel>('CategoryItems');

  @override
  void initState() {
    buildFavoriteModel();
    super.initState();
  }

  int selectedIndex = 0;
  dynamic textAZ = "A-Z";
  dynamic textRate = "Rating↘";

  final List<CategoryItemModel> models = [];

  void buildFavoriteModel() {
    final List<CategoryItemModel> tempModels = [];

    for (var i = 0; i < categoryItemsBox.length; i++) {
      tempModels.add(categoryItemsBox.getAt(i)!);
      log('id ${tempModels[i].categoryId} : title: ${tempModels[i].title}');
    }

    final sortedModels = tempModels.where((element) =>
        element.categoryId.toLowerCase() == widget.categoryId.toLowerCase());
    log('sortedModels ${sortedModels.length}');
    models.addAll(sortedModels);
    log('models ${models.length}');
  }

  void sortByDate() {
    // A-Z'
    if (selectedIndex == 0) {
      models.sort(
            (a, b) => a.title.compareTo(b.title),
      );
    } else if (selectedIndex == 3) {
      // Z-A
      models.sort(
            (a, b) => b.title.compareTo(a.title),
      );
    } else if (selectedIndex == 1) {
      // by new
      models.sort(
            (a, b) => DateTime.parse(b.date).compareTo(DateTime.parse(a.date)),
      );
    } else if (selectedIndex == 2) {
      // by new
      models.sort(
            (a, b) => DateTime.parse(a.date).compareTo(DateTime.parse(b.date)),
      );
    } else if (selectedIndex == 4) {
      // by the rating↘
      models.sort(
            (a, b) => b.rate.compareTo(a.rate),
      );
    } else {
      // by the rating↗
      models.sort(
            (a, b) => a.rate.compareTo(b.rate),
      );
    }
    setState(() {});
  }

  @Deprecated('disabled')
  void remoteItem(int index, String title) {
    // final elementsForRemove = categoryItemsBox.values
    //     .where((element) => element.categoryId == title)
    //     .toList();
    //     categoryItemsBox.values.
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    sortByDate();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            largeTitle: Container(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    widget.categoryId,
                    style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                        color: Colors.amber.shade600,
                        fontSize: 38),
                    textDirection: TextDirection.ltr,
                  ),
                ],
              ),
            ),
            border: Border(
              bottom: BorderSide(
                width: .9,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
              child: Column(
                children: [
                  Padding(padding: const EdgeInsets.fromLTRB(12, 0, 7, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if(selectedIndex == 0) {selectedIndex = 3;
                              textAZ = "Z-A";}
                              else {selectedIndex = 0; textAZ = "A-Z";}
                            });
                          },
                          child: Text(
                            textAZ.toString(),
                            style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic,
                                color: selectedIndex == 0 || selectedIndex == 3
                                    ? Colors.amber.shade600
                                    : Colors.grey,
                                fontSize: 22),
                            textDirection: TextDirection.ltr,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                          },
                          child: Text(
                            'New-Last',
                            style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic,
                                color: selectedIndex == 1
                                    ? Colors.amber.shade600
                                    : Colors.grey,
                                fontSize: 22),
                            textDirection: TextDirection.ltr,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 2;
                            });
                          },
                          child: Text(
                            'Last-New',
                            style: GoogleFonts.rubik(
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic,
                              color: selectedIndex == 2
                                  ? Colors.amber.shade600
                                  : Colors.grey,
                              fontSize: 22,
                            ),
                            textDirection: TextDirection.ltr,
                          ),
                        ),

                        SizedBox(
                          width: 90,
                          child:GestureDetector(
                            onTap: () {
                              setState(() {
                                if(selectedIndex != 4) {
                                  selectedIndex = 4;
                                  textRate = "Rating↘";
                                } else{
                                  selectedIndex = 5;
                                  textRate = "Rating↗";
                                }
                              });
                            },
                            child: Text(
                              textRate,
                              style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                  color: selectedIndex == 4 || selectedIndex == 5
                                      ? Colors.amber.shade600
                                      : Colors.grey,
                                  fontSize: 22),
                              textDirection: TextDirection.ltr,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    itemCount: models.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      if (models.isEmpty) {
                        return const Center(
                          child: Text('empty list'),
                        );
                      } else {
                        final model = models[i];
                        return HorizontalMovieCard(
                          poster: model.poster,
                          name: model.title,
                          backdrop: '',
                          date: model.date != ''
                              ? "${monthgenrater(model.date.split("-")[1])} ${model.date.split("-")[2]}, ${model.date.split("-")[0]}"
                              : "Not Available",
                          id: model.id,
                          color: Colors.white,
                          isMovie: model.type == 'MOVIE',
                          rate: model.rate,
                        );
                        //  Dismissible(
                        //   key: Key(model.id.toString()),
                        //   onDismissed: (direction) {
                        //     remoteItem(i);
                        //   },
                        //   direction: DismissDirection.endToStart,
                        //   background: Container(
                        //     alignment: Alignment.centerRight,
                        //     child: const Padding(
                        //       padding: EdgeInsets.all(20.0),
                        //       child: Icon(
                        //         CupertinoIcons.delete,
                        //         color: Colors.white,
                        //       ),
                        //     ),
                        //   ),
                        //   child: HorizontalMovieCard(
                        //     poster: model.poster,
                        //     name: model.title,
                        //     backdrop: '',
                        //     date: model.date != ''
                        //         ? "${monthgenrater(model.date.split("-")[1])} ${model.date.split("-")[2]}, ${model.date.split("-")[0]}"
                        //         : "Not Available",
                        //     id: model.id,
                        //     color: Colors.white,
                        //     isMovie: model.type == 'MOVIE',
                        //     rate: model.rate,
                        //   ),
                        // );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// final categoryBox = Hive.box<CategoryModel>('Category');
//   final categoryItemsBox = ;

//   Future<void> addCategory() async {
//     if (categoryTitles.isNotEmpty) {
//       for (var i = 0; i < categoryTitles.length; i++) {
//         log('added $i');
//         await categoryItemsBox.put(id, {
//           'id': id,
//           'categoryId': categoryTitles[i],
//           'title': title,
//           'poster': poster,
//           'rate': rate,
//           'type': type,
//           'date': date,
//         });
//       }
//       categoryTitles.clear();
//       BlocProvider.of<CategoryButtonCubit>(context).like(
//         date: date,
//         id: id,
//         poster: poster,
//         rating: rate,
//         title: title,
//         type: type,
//       );
//     }
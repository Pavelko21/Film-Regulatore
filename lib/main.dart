import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movieinfo/models/category_item_model/category_item_model.dart';
import 'package:movieinfo/models/category_model/category_model.dart';
import 'package:path_provider/path_provider.dart';

import 'screens/bottom_nav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var dir = await getApplicationDocumentsDirectory();

  await Hive.initFlutter(dir.path);
  Hive.registerAdapter(CategoryModelAdapter());
  Hive.registerAdapter(CategoryItemModelAdapter());
  await Hive.openBox('Movies');
  await Hive.openBox('Favorites');
  await Hive.openBox('Wishlist');
  await Hive.openBox('Tv');
  await Hive.openBox<CategoryModel>('Category');
  await Hive.openBox<CategoryItemModel>('CategoryItems');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // like this movie detail page?
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Film Regulator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        scaffoldBackgroundColor: Color(0xff242424),
        // scaffoldBackgroundColor: const Color(0xFF0C0303),
        primarySwatch: Colors.amber,
        splashColor: Colors.transparent,
        primaryColor: Colors.amber,
        textTheme: GoogleFonts.poppinsTextTheme(
            // TextTheme(
            //
            // )
            ),
      ),
      builder: (context, child) {
        return MediaQuery(
          // child: ScrollConfiguration(
          //   behavior: NoGlowBehavior(),
          //   child: child!,
          // ),
          child: child!,
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        );
      },
      home: const BottomNavBar(),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/popular_movies/movie_details.dart';
import 'package:movies_app/providers/AppConfigProvider.dart';
import 'package:movies_app/watch_list_tab.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/category_list/list_movies_of_category.dart';
import 'home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseFirestore.instance.disableNetwork();
  runApp(ChangeNotifierProvider(
      child: MoviesApp(),
    create: (context) => AppConfigProvider(),
  ));
}

class MoviesApp extends StatefulWidget{
  @override
  State<MoviesApp> createState() => _MoviesAppState();
}

class _MoviesAppState extends State<MoviesApp> {
  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName : (context)=>HomeScreen(),
        MovieDetails.routeName : (context)=>MovieDetails(),
        ListMoviesOfCategory.routeName : (context) => ListMoviesOfCategory(),
        WatchListTab.routeName : (context) => WatchListTab(),
      },
      initialRoute: HomeScreen.routeName,
    );


  }
  // Future<void> initsharedPref() async {
  //   final Prefs = await SharedPreferences.getInstance();
  //   // String watchedList = Prefs.getString('watchedList')!;
  //   String watchedList = Prefs.getString('watchedList') ?? '';
  //   provider.getAllMoviesFromFirebaseStore();
  //
  // }
}

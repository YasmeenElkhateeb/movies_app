import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/model/WatchedMovies.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../firebase_utils.dart';

class AppConfigProvider extends ChangeNotifier {
  List<WatchedMovies> moviesList = [];
  List<int> idsList = [];
  // bool checkBookMark = false;

  getAllMoviesFromFirebaseStore() async {
      QuerySnapshot<WatchedMovies> querySnapshot = await getMovieCollection().get(); // get all data from firebase local
      moviesList = querySnapshot.docs.map((doc) {
        return doc.data();
      }).toList();
      // final Prefs = await SharedPreferences.getInstance();
      // Prefs.setString('watchedList', moviesList);
    notifyListeners();
  }
  bool checkMovieExist(int id){
    idsList = moviesList.map((doc) {
      return doc.movie.id!;
    }).toList();
    print(idsList);
    return idsList.contains(id);
  }

  Future<void> changeIsDoneMovie(WatchedMovies movies) async {
    return editMovieIsDone(movies);
  }

  // void changeBookmark(bool newBookMark) {
  //   checkBookMark = newBookMark;
  //   notifyListeners();
  // }
}

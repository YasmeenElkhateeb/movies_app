import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/model/PopularMoviesResponse.dart';
import 'package:movies_app/providers/AppConfigProvider.dart';
import 'package:movies_app/watch_list_item.dart';
import 'package:provider/provider.dart';

import 'firebase_utils.dart';
import 'model/WatchedMovies.dart';

class WatchListTab extends StatefulWidget {
  static const String routeName = 'watch_list_tab';

  @override
  State<WatchListTab> createState() => _WatchListTabState();
}

class _WatchListTabState extends State<WatchListTab> {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    provider.getAllMoviesFromFirebaseStore();

    return Scaffold(
      backgroundColor: Color(0xFF121312),
      appBar: AppBar(
        title: Text(
          'WatchList',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          print(provider.moviesList[index].movie.id);
          print('is_done = ${provider.moviesList[index].isDone}');
          print('title = ${provider.moviesList[index].movie.title}');
          return  WatchListItem(
            watchMovie: provider.moviesList[index],
          );
        },
        itemCount: provider.moviesList.length,
      )
    );

  }
}

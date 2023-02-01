import 'package:flutter/material.dart';
import 'package:movies_app/model/LatestMoviesResponse.dart';
import 'package:movies_app/watch_list_tab.dart';

import '../api/api_manger.dart';
import '../firebase_utils.dart';
import '../model/PopularMoviesResponse.dart';
import '../model/WatchedMovies.dart';
import 'latest_movie_item.dart';

class latestMoviesContainer extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<PopularMoviesResponse>(
          future: ApiManger.getPopularMovies(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Column(
                children: [
                  Text('Someting Wrong'),
                  ElevatedButton(onPressed: () {}, child: Text('Try Again'))
                ],
              );
            }
            if (snapshot.data?.success == false) {
              return Column(
                children: [
                  Text(snapshot.data?.status_message ?? ''),
                  ElevatedButton(onPressed: () {}, child: Text('Try Again'))
                ],
              );
            }
            var latestMoviesList = snapshot.data?.results ?? [];
            // return SizedBox();
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return LatestMovieItem(
                  movie:latestMoviesList[index],
                );
              },
              itemCount: latestMoviesList.length,
            );
          }),
    );
  }

}
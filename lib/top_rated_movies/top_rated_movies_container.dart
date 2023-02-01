import 'package:flutter/material.dart';
import 'package:movies_app/model/MoviesTopRatedResponse.dart';
import 'package:movies_app/top_rated_movies/top_rated_movie_item.dart';

import '../api/api_manger.dart';

class topRatedMoviesContainer extends StatelessWidget {
  static const String url = 'https://image.tmdb.org/t/p/w500';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<MoviesTopRatedResponse>(
          future: ApiManger.getMoviesTopRated(),
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
            var topRatedMoviesList = snapshot.data?.results ?? [];
            // print('topRatedList =${topRatedMoviesList}');
            // return Text('${url}${topRatedMoviesList[0].posterPath ?? ''}');
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Expanded(
                  child: TopRatedMoveItem(
                    voteAverage:topRatedMoviesList[index].voteAverage! ,
                    posterPath:
                        '${url}${topRatedMoviesList[index].posterPath ?? ''}',
                    movieName: '${topRatedMoviesList[index].originalTitle ?? ''}',
                    date: '${topRatedMoviesList[index].releaseDate ?? ''}',
                  ),
                );
              },
              itemCount: topRatedMoviesList.length,
            );
      }),
    );
  }
}

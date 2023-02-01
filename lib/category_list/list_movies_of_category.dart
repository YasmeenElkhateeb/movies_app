import 'package:flutter/material.dart';
import 'package:movies_app/model/CateguryResponse.dart';
import 'package:movies_app/model/MovieDiscover.dart';
import 'package:movies_app/search_movie/search_movie_item_list.dart';
import 'package:movies_app/popular_movies/movie_details.dart';

import '../api/api_manger.dart';

class ListMoviesOfCategory extends StatelessWidget {
  static const String routeName = 'list_movies_of_categury';
  // Genres Category;
  // ListMoviesOfCategury({required this.Category});
  @override
  Widget build(BuildContext context) {
    final CategoryId = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
        backgroundColor: Color(0xFF121312),
        appBar: AppBar(
          title: Text(
            'Movies List Of Categury',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: FutureBuilder<MovieDiscover>(
            future: ApiManger.getMoviesListOfCategury(CategoryId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Column(
                  children: [
                    Text('Someting Wrong'),
                    ElevatedButton(onPressed: () {}, child: Text('Try Again'))
                  ],
                );
              }
              if (snapshot.data?.page == 0) {
                return Column(
                  children: [
                    Text(snapshot.data?.status_message ?? ''),
                    ElevatedButton(onPressed: () {}, child: Text('Try Again'))
                  ],
                );
              }
              var moviesList = snapshot.data?.results ?? [];
              print(moviesList.length);
              return ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context,MovieDetails.routeName,arguments: moviesList[index].id);
                      },
                      child: SearchMovieItemList(
                        // movie: moviesList[index] ,
                        posterPath: moviesList[index].posterPath ?? '',
                        movieName: moviesList[index].title ?? '',
                        date: moviesList[index].releaseDate ?? '',
                        title: moviesList[index].originalTitle ?? '',
                      ));
                },
                itemCount: moviesList.length,
              );
            })
    );

  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api/api_manger.dart';
import 'package:movies_app/model/PopularMoviesResponse.dart';
import 'package:movies_app/popular_movies/popular_move_item.dart';

import 'movie_details.dart';

class popularMoviessContainer extends StatelessWidget {
  static const String url = 'https://image.tmdb.org/t/p/w500';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PopularMoviesResponse>(
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
          var popularMoviesList = snapshot.data?.results ?? [];
          // print('${url}${popularMoviesList[0].posterPath ?? ''}');
          return CarouselSlider.builder(
            itemCount: popularMoviesList.length,
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
              return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, MovieDetails.routeName,
                              arguments: popularMoviesList[itemIndex].id);
                        },
                        child: PopularMoveItem(
                          urlbackground:
                              '${url}${popularMoviesList[itemIndex].backdropPath ?? ''}',
                          movieName: '${popularMoviesList[itemIndex].originalTitle ?? ''}',
                          posterPath:
                              '${url}${popularMoviesList[itemIndex].posterPath ?? ''}',
                          date: '${popularMoviesList[itemIndex].releaseDate ?? ''}',
                        ),
                      );
            },
            options: CarouselOptions(
              height: 400,
              aspectRatio: 16/9,
              // viewportFraction: 0.8,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              // onPageChanged: callbackFunction,
              scrollDirection: Axis.horizontal,
            ),
          );


          // return ListView.builder(
          //   scrollDirection: Axis.horizontal,
          //   itemBuilder: (context, index) {
          //     return InkWell(
          //       onTap: () {
          //         Navigator.pushNamed(context, MovieDetails.routeName,
          //             arguments: popularMoviesList[index].id);
          //       },
          //       child: PopularMoveItem(
          //         urlbackground:
          //             '${url}${popularMoviesList[index].backdropPath ?? ''}',
          //         movieName: '${popularMoviesList[index].originalTitle ?? ''}',
          //         posterPath:
          //             '${url}${popularMoviesList[index].posterPath ?? ''}',
          //         date: '${popularMoviesList[index].releaseDate ?? ''}',
          //       ),
          //     );
          //   },
          //   itemCount: popularMoviesList.length,
          // );
        });
  }
}

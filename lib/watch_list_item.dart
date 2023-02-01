import 'package:flutter/material.dart';
import 'firebase_utils.dart';
import 'model/WatchedMovies.dart';

class WatchListItem extends StatelessWidget {
  static const String url = 'https://image.tmdb.org/t/p/w500';

  WatchedMovies watchMovie;
  WatchListItem({required this.watchMovie});

  @override
  Widget build(BuildContext context) {
    print(watchMovie.isDone);
    print(watchMovie.movie?.title);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                  children: [
                Container(
                  margin: EdgeInsets.only(top: 5,left: 8),
                  child: Image.network(
                    '${url}${watchMovie.movie.posterPath}',
                    height: 100,
                  ),
                ),
                InkWell(
                    onTap: () {
                      deleteMovieFromFireStore(watchMovie);
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(Icons.bookmark,
                            color: Color(0xD8F7B539), size: 40),
                        Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ],
                    ))
              ]),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      watchMovie.movie.title ?? '',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      watchMovie.movie.releaseDate ?? '',
                      style: TextStyle(fontSize: 10, color: Color(0xFFB5B4B4)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      watchMovie.movie.originalTitle ?? '',
                      style: TextStyle(fontSize: 12, color: Color(0xFFB5B4B4)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // ElevatedButton(onPressed: (){deleteMovieFromFireStore(watchMovie);}, child: Text('Delete'))
                  ],
                ),
              )
            ],
          ),
          Divider(
            color: Color(0xFFB5B4B4),
          )
        ],
      ),
    );
  }
}

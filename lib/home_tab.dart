import 'package:flutter/material.dart';
import 'package:movies_app/latest_movies/latest_movies_container.dart';
import 'package:movies_app/popular_movies/popular_movies_container.dart';
import 'package:movies_app/top_rated_movies/top_rated_movies_container.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 2, child: popularMoviessContainer()),
        Expanded(
            flex: 1,
            child: Container(
                color: Color(0xFF282A28),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('New Releases',style: TextStyle(color: Colors.white ,fontSize: 15,fontWeight: FontWeight.bold,)),
                    SizedBox(height: 10,),
                    latestMoviesContainer(),
                  ],
                ))),
        Expanded(
            flex: 2,
            child:
            Container(
                color: Color(0xFF282A28),
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Recomended',style: TextStyle(color: Colors.white ,fontSize: 15,fontWeight: FontWeight.bold,)),
                    SizedBox(height: 10,),
                    topRatedMoviesContainer(),
                  ],
                ))
        ),
      ],
    );
  }
}

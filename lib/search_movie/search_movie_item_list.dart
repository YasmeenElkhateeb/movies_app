import 'package:flutter/material.dart';

import '../model/SearchMoviesResponse.dart';
import '../model/MovieDiscover.dart';

class SearchMovieItemList extends StatelessWidget{
  static const String url = 'https://image.tmdb.org/t/p/w500';
  String posterPath;
  String movieName;
  String date;
  String title;

  SearchMovieItemList({required this.posterPath,required this.movieName,required this.date,required this.title});

  // Results movie;
  // SearchMovieItemList({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              Image.network('${url}${posterPath}',height: 100,),
              SizedBox(width: 20,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title ?? '',style: TextStyle(fontSize: 15,fontWeight:FontWeight.bold,color: Colors.white),),
                    SizedBox(height: 10,),
                    Text(date,style: TextStyle(fontSize: 10,color: Color(0xFFB5B4B4)),),
                    SizedBox(height: 10,),
                    Text(movieName,style: TextStyle(fontSize: 12,color: Color(0xFFB5B4B4)),),
                    SizedBox(height: 10,),
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
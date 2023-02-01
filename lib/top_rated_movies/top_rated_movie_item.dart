import 'package:flutter/material.dart';

class TopRatedMoveItem extends StatelessWidget {
  String posterPath;
  num voteAverage;
  String movieName;
  String date;
  TopRatedMoveItem(
      {required this.posterPath,
      required this.voteAverage,
      required this.movieName,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(5),
        width: 110,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(posterPath),
            Container(
              color: Color(0xFF343534),
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 15,
                      ),
                      SizedBox(width: 5,),
                      Text(
                        '${voteAverage}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Text(
                    '${movieName}',
                    style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    '${date}',
                    style: TextStyle(color: Colors.white,fontSize: 8),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

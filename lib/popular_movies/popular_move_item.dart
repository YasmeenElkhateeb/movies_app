import 'package:flutter/material.dart';

class PopularMoveItem extends StatelessWidget {
  String urlbackground;
  String movieName;
  String posterPath;
  String date;
  PopularMoveItem(
      {required this.urlbackground,
      required this.movieName,
      required this.posterPath,
      required this.date});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(
        children: [
        Image.network(urlbackground),
        Container(
          margin: EdgeInsets.only(left: 25,top: 100),
          child:Image.network(posterPath,width: 100),
        ),
        Container(
          margin: EdgeInsets.only(left: 145,top: 210),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(movieName, style: TextStyle(color: Colors.white, fontSize: 15)),
              // SizedBox(height: 10,),
              Text(date, style: TextStyle(color: Colors.white, fontSize: 15)),
            ],
          ),
        ),
      ],),
    );

    // test yasmeen

    // return Stack(
    //   children: [
    //     Image.network(urlbackground),
    //     Container(
    //       margin: EdgeInsets.only(left: 20),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         crossAxisAlignment: CrossAxisAlignment.stretch,
    //         children: [
    //           Image.network(posterPath, width: 150),
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(movieName,
    //                   style: TextStyle(color: Colors.white, fontSize: 15)),
    //               SizedBox(
    //                 height: 10,
    //               ),
    //               Text(date, style: TextStyle(color: Colors.white, fontSize: 15)),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ]
    //
    // );
  }
}

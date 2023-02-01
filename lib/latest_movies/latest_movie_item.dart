import 'package:flutter/material.dart';
import 'package:movies_app/firebase_utils.dart';
import 'package:movies_app/model/PopularMoviesResponse.dart';
import 'package:movies_app/model/WatchedMovies.dart';
import 'package:movies_app/providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';

import '../watch_list_tab.dart';

class LatestMovieItem extends StatefulWidget {
  static const String url = 'https://image.tmdb.org/t/p/w500';
  Movies movie;
  LatestMovieItem({
    required this.movie,
  });

  @override
  State<LatestMovieItem> createState() => _LatestMovieItemState();
}

class _LatestMovieItemState extends State<LatestMovieItem> {

  bool? checkMovie;
  void initState() {
    super.initState();
    // Future.delayed(Duration(seconds: 10)); // مش احسن حل
    WidgetsBinding.instance.addPostFrameCallback((_) {  // call function one time after build context
      checkMovie = Provider.of<AppConfigProvider>(context,listen: false).checkMovieExist(widget.movie.id!);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(2),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Container(
              margin: EdgeInsets.only(left: 11,top: 7),
                child: Image.network('${LatestMovieItem.url}${widget.movie.posterPath ?? ''}')),
            InkWell(
                onTap: () {
                  WatchedMovies movieData = WatchedMovies(idFierbase: widget.movie.id!,movie: widget.movie);
                  print('id=${movieData.movie.id!}');
                  if(checkMovie == false){
                    addMovieToFireStore(movieData)
                        .timeout(Duration(milliseconds: 500), onTimeout: () {
                      print('movie was added');
                      Provider.of<AppConfigProvider>(context,listen: false).changeIsDoneMovie(movieData);
                      Navigator.of(context).pushNamed(WatchListTab.routeName);
                      setState(() {

                      });
                    });
                  }else{
                    return ;
                  }
                },
                child: checkMovie == true ?
                // provider.checkBookMark ?
                     Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(Icons.bookmark,
                              color: Color(0xD8F7B539), size: 50),
                          Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ],
                      )
                    : Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(Icons.bookmark,
                              color: Color(0xD8514F4F), size: 50),
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ],
                      ))
          ],
        ));
  }

}

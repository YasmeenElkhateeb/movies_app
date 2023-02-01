import 'package:movies_app/model/PopularMoviesResponse.dart';

class WatchedMovies {
  late int idFierbase;
  late Movies movie;
  late bool isDone;

  WatchedMovies({required this.idFierbase, required this.movie,this.isDone = false});

  Map<String,dynamic> toJson(){
    final map = <String, dynamic>{};
    map['idFierbase'] = idFierbase;
    map['isDone'] = isDone;
    map['movie'] = movie?.toJson();
    // if (movie != null) {
    //   map['movie'] = movie?.toJson();
    // }
    return map;
  }

  WatchedMovies.fromJson(Map<String,dynamic> json)
  {
    idFierbase = json['idFierbase'] as int;
    isDone= json['isDone'] as bool;
    movie = Movies.fromJson(json['movie']);
  }


}
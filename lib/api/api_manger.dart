import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/model/CateguryResponse.dart';
import 'package:movies_app/model/MovieDetailsResponse.dart';
import 'package:movies_app/model/MovieDiscover.dart';
import 'package:movies_app/model/SearchMoviesResponse.dart';

import '../model/LatestMoviesResponse.dart';
import '../model/MoviesTopRatedResponse.dart';
import '../model/PopularMoviesResponse.dart';
import '../model/SimilarResponse.dart';
// import '../model/SimilarResponseold.dart';

class ApiManger{
  static const String baseUrl ='api.themoviedb.org';

  // https://developers.themoviedb.org/3/movies/get-popular-movies
  // https://api.themoviedb.org/3/movie/popular?api_key=<<api_key>>&language=en-US&page=1

  static Future<PopularMoviesResponse> getPopularMovies() async {
    var url =Uri.https(baseUrl,'/3/movie/popular',
        {
          'api_key' : 'fe0c30e0f9a81ee6c849d4f7e2d54e7c'
        }
    );
    try{
      var response =await http.get(url);
      var bodyString = response.body;
      var bodyJson = jsonDecode(bodyString);
      var PopularMovie = PopularMoviesResponse.fromJson(bodyJson);
      print(PopularMovie.status_code);
      return PopularMovie;
    }catch(e){
      throw e;
    }
  }

  // https://api.themoviedb.org/3/movie/latest?api_key=fe0c30e0f9a81ee6c849d4f7e2d54e7c&language=en-US
  static Future<LatestMoviesResponse> getLatestMovies() async {
    var url =Uri.https(baseUrl,'/3/movie/latest',
        {
          'api_key' : 'fe0c30e0f9a81ee6c849d4f7e2d54e7c'
        }
    );
    try{
      var response =await http.get(url);
      var bodyString = response.body;
      var bodyJson = jsonDecode(bodyString);
      var LatestMovies = LatestMoviesResponse.fromJson(bodyJson);
      return LatestMovies;
    }catch(e){
      throw e;
    }
  }


  // https://api.themoviedb.org/3/movie/top_rated?api_key=<<api_key>>&language=en-US&page=1
  static Future<MoviesTopRatedResponse> getMoviesTopRated() async {
    var url =Uri.https(baseUrl,'/3/movie/top_rated',
        {
          'api_key' : 'fe0c30e0f9a81ee6c849d4f7e2d54e7c',
        }
    );
    try{
      var response =await http.get(url);
      var bodyString = response.body;
      var bodyJson = jsonDecode(bodyString);
      var MoviesTopRated = MoviesTopRatedResponse.fromJson(bodyJson);
      print(MoviesTopRated);
      return MoviesTopRated;
    }catch(e){
      throw e;
    }
  }


  // https://api.themoviedb.org/3/movie/{movie_id}?api_key=<<api_key>>&language=en-US
  static Future<MovieDetailsResponse> getMovieDetail({int? movieId}) async {
    var url =Uri.https(baseUrl,'/3/movie/${movieId}',
        {
          'api_key' : 'fe0c30e0f9a81ee6c849d4f7e2d54e7c',
        }
    );
    try{
      var response =await http.get(url);
      var bodyString = response.body;
      var bodyJson = jsonDecode(bodyString);
      var MovieDetails = MovieDetailsResponse.fromJson(bodyJson);
      return MovieDetails;
    }catch(e){
      throw e;
    }
  }


  //https://api.themoviedb.org/3/movie/{movie_id}/similar?api_key=<<api_key>>&language=en-US&page=1
  static Future<SimilarResponse> getSimilarMovies(int movieId) async {
    var url =Uri.https(baseUrl,'/3/movie/${movieId}/similar',
        {
          'api_key' : 'fe0c30e0f9a81ee6c849d4f7e2d54e7c',
        }
    );
    try{
      var response =await http.get(url);
      var bodyString = response.body;
      var bodyJson = jsonDecode(bodyString);
      var SimilarMovies = SimilarResponse.fromJson(bodyJson);
      return SimilarMovies;
    }catch(e){
      throw e;
    }
  }

  // https://api.themoviedb.org/3/search/movie?api_key=<<api_key>>&language=en-US&page=1&include_adult=false
  // https://api.themoviedb.org/3/search/movie?api_key=fe0c30e0f9a81ee6c849d4f7e2d54e7c&language=en-US&page=1&include_adult=false&query=avatar

  static Future<SearchMoviesResponse> getSearchMovie(String? movieName) async {
    var url =Uri.https(baseUrl,'/3/search/movie',
        {
          'api_key' : 'fe0c30e0f9a81ee6c849d4f7e2d54e7c',
          'query' : movieName,
        }
    );
    try{
      var response =await http.get(url);
      var bodyString = response.body;
      var bodyJson = jsonDecode(bodyString);
      var SearchMovies = SearchMoviesResponse.fromJson(bodyJson);
      return SearchMovies;
    }catch(e){
      throw e;
    }
  }

  // https://api.themoviedb.org/3/genre/movie/list?api_key=<<api_key>>&language=en-US
  static Future<CateguryResponse> getCateguryList() async {
    var url =Uri.https(baseUrl,'/3/genre/movie/list',
        {
          'api_key' : 'fe0c30e0f9a81ee6c849d4f7e2d54e7c',
        }
    );
    try{
      var response =await http.get(url);
      var bodyString = response.body;
      var bodyJson = jsonDecode(bodyString);
      var Categury = CateguryResponse.fromJson(bodyJson);
      return Categury;
    }catch(e){
      throw e;
    }
  }

  // https://api.themoviedb.org/3/discover/movie?api_key=<<api_key>>&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate
  static Future<MovieDiscover> getMoviesListOfCategury(int genresId) async {
    var url =Uri.https(baseUrl,'/3/discover/movie',
        {
          'api_key' : 'fe0c30e0f9a81ee6c849d4f7e2d54e7c',
          'with_genres' : '${genresId}',
        }
    );
    try{
      var response =await http.get(url);
      var bodyString = response.body;
      var bodyJson = jsonDecode(bodyString);
      var MoviesList = MovieDiscover.fromJson(bodyJson);
      return MoviesList;
    }catch(e){
      throw e;
    }
  }
}
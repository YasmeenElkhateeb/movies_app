/// adult : false
/// backdrop_path : null
/// belongs_to_collection : null
/// budget : 0
/// genres : [{"id":99,"name":"Documentary"}]
/// homepage : ""
/// id : 1075638
/// imdb_id : null
/// original_language : "en"
/// original_title : "Into Dinosaur Valley With Dan Snow"
/// overview : "The presenter travels across America retracing the very first discoveries made by fossil hunters nearly 200 years ago, from Wyoming to the foothills of the Rocky Mountains. He reveals how the very first discoveries of the most amazing dinosaurs of all time were made, including the T-Rex and Diplodocus, and learns why America's stunning wild West is such a hotspot for dinosaur remains."
/// popularity : 0.0
/// poster_path : null
/// production_companies : []
/// production_countries : []
/// release_date : ""
/// revenue : 0
/// runtime : 90
/// spoken_languages : []
/// status : "Released"
/// tagline : ""
/// title : "Into Dinosaur Valley With Dan Snow"
/// video : false
/// vote_average : 7.0
/// vote_count : 1


// Yasmeen
// class LatestMoviesResponse {
//   LatestMoviesResponse({
//       this.adult,
//       this.backdropPath,
//       this.belongsToCollection,
//       this.budget,
//       this.genres,
//       this.homepage,
//       this.id,
//       this.imdbId,
//       this.originalLanguage,
//       this.originalTitle,
//       this.overview,
//       this.popularity,
//       this.posterPath,
//       this.productionCompanies,
//       this.productionCountries,
//       this.releaseDate,
//       this.revenue,
//       this.runtime,
//       this.spokenLanguages,
//       this.status,
//       this.tagline,
//       this.title,
//       this.video,
//       this.voteAverage,
//       this.voteCount,});
//
//   LatestMoviesResponse.fromJson(dynamic json) {
//     adult = json['adult'];
//     backdropPath = json['backdrop_path'];
//     belongsToCollection = json['belongs_to_collection'];
//     budget = json['budget'];
//     if (json['genres'] != null) {
//       genres = [];
//       json['genres'].forEach((v) {
//         genres?.add(Genres.fromJson(v));
//       });
//     }
//     homepage = json['homepage'];
//     id = json['id'];
//     imdbId = json['imdb_id'];
//     originalLanguage = json['original_language'];
//     originalTitle = json['original_title'];
//     overview = json['overview'];
//     popularity = json['popularity'];
//     posterPath = json['poster_path'];
//     if (json['production_companies'] != null) {
//       productionCompanies = [];
//       json['production_companies'].forEach((v) {
//         productionCompanies?.add(Dynamic.fromJson(v));
//       });
//     }
//     if (json['production_countries'] != null) {
//       productionCountries = [];
//       json['production_countries'].forEach((v) {
//         productionCountries?.add(Dynamic.fromJson(v));
//       });
//     }
//     releaseDate = json['release_date'];
//     revenue = json['revenue'];
//     runtime = json['runtime'];
//     if (json['spoken_languages'] != null) {
//       spokenLanguages = [];
//       json['spoken_languages'].forEach((v) {
//         spokenLanguages?.add(Dynamic.fromJson(v));
//       });
//     }
//     status = json['status'];
//     tagline = json['tagline'];
//     title = json['title'];
//     video = json['video'];
//     voteAverage = json['vote_average'];
//     voteCount = json['vote_count'];
//   }
//   bool? adult;
//   dynamic backdropPath;
//   dynamic belongsToCollection;
//   int? budget;
//   List<Genres>? genres;
//   String? homepage;
//   int? id;
//   dynamic imdbId;
//   String? originalLanguage;
//   String? originalTitle;
//   String? overview;
//   double? popularity;
//   dynamic posterPath;
//   List<dynamic>? productionCompanies;
//   List<dynamic>? productionCountries;
//   String? releaseDate;
//   int? revenue;
//   int? runtime;
//   List<dynamic>? spokenLanguages;
//   String? status;
//   String? tagline;
//   String? title;
//   bool? video;
//   double? voteAverage;
//   int? voteCount;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['adult'] = adult;
//     map['backdrop_path'] = backdropPath;
//     map['belongs_to_collection'] = belongsToCollection;
//     map['budget'] = budget;
//     if (genres != null) {
//       map['genres'] = genres?.map((v) => v.toJson()).toList();
//     }
//     map['homepage'] = homepage;
//     map['id'] = id;
//     map['imdb_id'] = imdbId;
//     map['original_language'] = originalLanguage;
//     map['original_title'] = originalTitle;
//     map['overview'] = overview;
//     map['popularity'] = popularity;
//     map['poster_path'] = posterPath;
//     if (productionCompanies != null) {
//       map['production_companies'] = productionCompanies?.map((v) => v.toJson()).toList();
//     }
//     if (productionCountries != null) {
//       map['production_countries'] = productionCountries?.map((v) => v.toJson()).toList();
//     }
//     map['release_date'] = releaseDate;
//     map['revenue'] = revenue;
//     map['runtime'] = runtime;
//     if (spokenLanguages != null) {
//       map['spoken_languages'] = spokenLanguages?.map((v) => v.toJson()).toList();
//     }
//     map['status'] = status;
//     map['tagline'] = tagline;
//     map['title'] = title;
//     map['video'] = video;
//     map['vote_average'] = voteAverage;
//     map['vote_count'] = voteCount;
//     return map;
//   }
//
// }

/// id : 99
/// name : "Documentary"

// class Genres {
//   Genres({
//       this.id,
//       this.name,});
//
//   Genres.fromJson(dynamic json) {
//     id = json['id'];
//     name = json['name'];
//   }
//   int? id;
//   String? name;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['name'] = name;
//     return map;
//   }
//
// }
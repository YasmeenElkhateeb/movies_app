/// page : 1
/// results : [{"adult":false,"backdrop_path":null,"genre_ids":[28],"id":106912,"original_language":"en","original_title":"Darna! Ang Pagbabalik","overview":"Valentina, Darna's snake-haired arch enemy, is trying to take over the Phillipines through subliminal messages on religious TV shows. Darna has her own problems, however, as she has lost her magic pearl and with it the ability to transform into her scantily clad super self. Trapped as her alter-ego, the plucky reporter Narda, she must try to regain the pearl and foil Valentina's plans.","release_date":"1994-05-09","poster_path":null,"popularity":1.012564,"title":"Darna: The Return","video":false,"vote_average":0,"vote_count":0}]
/// total_pages : 9
/// total_results : 168

class SimilarResponse {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;
  String? status_message;
  int? status_code;

  SimilarResponse({
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalResults,
    this.status_message,
    this.status_code,
  });

  SimilarResponse.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    status_message = json['status_message'];
    status_code = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    map['status_message'] = status_message;
    map['status_code'] = status_code;
    return map;
  }

}

/// adult : false
/// backdrop_path : null
/// genre_ids : [28]
/// id : 106912
/// original_language : "en"
/// original_title : "Darna! Ang Pagbabalik"
/// overview : "Valentina, Darna's snake-haired arch enemy, is trying to take over the Phillipines through subliminal messages on religious TV shows. Darna has her own problems, however, as she has lost her magic pearl and with it the ability to transform into her scantily clad super self. Trapped as her alter-ego, the plucky reporter Narda, she must try to regain the pearl and foil Valentina's plans."
/// release_date : "1994-05-09"
/// poster_path : null
/// popularity : 1.012564
/// title : "Darna: The Return"
/// video : false
/// vote_average : 0
/// vote_count : 0

class Results {
  bool? adult;
  dynamic backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? releaseDate;
  dynamic posterPath;
  double? popularity;
  String? title;
  bool? video;
  num? voteAverage;
  num? voteCount;
  // int? voteAverage;
  // int? voteCount;

  Results({
      this.adult, 
      this.backdropPath, 
      this.genreIds, 
      this.id, 
      this.originalLanguage, 
      this.originalTitle, 
      this.overview, 
      this.releaseDate, 
      this.posterPath, 
      this.popularity, 
      this.title, 
      this.video, 
      this.voteAverage, 
      this.voteCount,});

  Results.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    posterPath = json['poster_path'];
    popularity = json['popularity'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['genre_ids'] = genreIds;
    map['id'] = id;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['release_date'] = releaseDate;
    map['poster_path'] = posterPath;
    map['popularity'] = popularity;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }

}
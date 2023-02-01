/// genres : [{"id":28,"name":"Action"}]

class CateguryResponse {
  List<Genres>? genres;
  String? status_message;
  bool? success;
  int? status_code;

  CateguryResponse({
      this.genres,
    this.status_message,
    this.success,
    this.status_code,});

  CateguryResponse.fromJson(dynamic json) {
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
    status_message = json['status_message'];
    success = json['success'];
    status_code = json['status_code'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    map['status_message'] = status_message;
    map['success'] = success;
    map['status_code'] = status_code;
    return map;
  }

}

/// id : 28
/// name : "Action"

class Genres {
  Genres({
      this.id, 
      this.name,});

  Genres.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}
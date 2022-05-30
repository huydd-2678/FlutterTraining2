import 'package:flutter_training_2/data/model/genre.dart';

class Movie {
  int id;
  String? posterPath;
  String? backdropPath;
  String overview;
  String releaseDate;
  String title;
  num voteAverage;

  // List<Genre> genres;

  Movie({
    required this.id,
    required this.posterPath,
    required this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    // required this.genres
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      voteAverage: json['vote_average'] ?? 0.0,
      releaseDate: json['release_date'] ?? '',
      // genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'poster_path': posterPath,
      'overview': overview,
      'backdrop_path': backdropPath,
      'vote_average': voteAverage,
      'release_date': releaseDate,
      // 'genre_ids': List<dynamic>.from(genres.map((x) => x.toJson())),
    };
  }

  String get fullImageUrl => 'https://image.tmdb.org/t/p/w200$posterPath';

  String get fullBGImageUrl => 'https://image.tmdb.org/t/p/w400$backdropPath';
}

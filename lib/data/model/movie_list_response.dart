import 'package:flutter_training_2/data/model/movie.dart';

class MovieListResponse {
  int page;
  List<Movie> results;
  int totalPages;

  MovieListResponse(
      {required this.page, required this.results, required this.totalPages});

  factory MovieListResponse.fromJson(Map<String, dynamic> json) {
    return MovieListResponse(
      page: json['page'] ?? 0,
      results: List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
      totalPages: json['total_pages'] ?? 0,
    );
  }
}

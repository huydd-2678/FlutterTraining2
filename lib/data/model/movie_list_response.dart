import 'package:flutter_training_2/data/model/movie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_list_response.g.dart';

@JsonSerializable()
class MovieListResponse {
  int? page;
  List<Movie>? results;

  MovieListResponse({this.page, this.results});

  factory MovieListResponse.fromJson(Map<String, dynamic> json) => _$MovieListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListResponseToJson(this);
}

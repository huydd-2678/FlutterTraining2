import 'package:json_annotation/json_annotation.dart';
part 'movie.g.dart';

@JsonSerializable()
class Movie {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'overview')
  String? overview;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'vote_average')
  String? voteAverage;
  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;

  Movie(
      {this.id,
      this.posterPath,
      this.backdropPath,
      this.overview,
      this.releaseDate,
      this.title,
      this.voteAverage,
      this.genreIds});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}

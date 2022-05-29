import 'package:flutter_training_2/data/model/movie_list_response.dart';

abstract class MovieRepository {
  Future<MovieListResponse> getMovieList();
}

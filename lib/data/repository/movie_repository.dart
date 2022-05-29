import 'package:flutter_training_2/data/model/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getMovieList();
}

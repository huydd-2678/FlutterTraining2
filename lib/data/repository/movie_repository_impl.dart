import 'package:flutter_training_2/data/model/movie.dart';
import 'package:flutter_training_2/data/model/movie_list_response.dart';
import 'package:flutter_training_2/data/repository/movie_repository.dart';
import 'package:flutter_training_2/data/source/remote/movie_api.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieApi movieApi;

  MovieRepositoryImpl({required this.movieApi});

  @override
  Future<MovieListResponse> getMovieList(int page) async {
    try {
      final response = await movieApi.getMovieList(page);
      // final movies = response.results;
      return response;
    } on Exception catch(e){
      throw '$e';
    }
  }
}

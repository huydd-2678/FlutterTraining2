import 'package:flutter_training_2/data/api_client.dart';
import 'package:flutter_training_2/data/model/movie_list_response.dart';
import 'package:flutter_training_2/data/repository/movie_repository.dart';
import 'package:dio/dio.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<MovieListResponse> getMovieList() async {
    final dio = Dio();
    final client = ApiClient(dio);
    return await client.getMovieList();
  }
}

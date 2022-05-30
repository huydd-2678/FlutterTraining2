import 'package:dio/dio.dart';
import 'package:flutter_training_2/data/model/movie_list_response.dart';

class MovieApi {
  final Dio dio;

  MovieApi({required this.dio});

  Future<MovieListResponse> getMovieList(int page) async{
    final response = await dio.get('/movie/popular', queryParameters: {'page': page});
    final results = Map<String, dynamic>.from(response.data);
    MovieListResponse movieListResponse = MovieListResponse.fromJson(results);
    return movieListResponse;
  }
}

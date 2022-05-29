import 'package:flutter/material.dart';
import 'package:flutter_training_2/data/model/movie_list_response.dart';
import 'package:flutter_training_2/data/repository/movie_repository.dart';
import 'package:logger/logger.dart';

class MovieListViewModel extends ChangeNotifier {
  final MovieRepository repository;
  final logger = Logger();

  MovieListViewModel(this.repository);

  MovieListResponse _movieListResponse = MovieListResponse();

  MovieListResponse get movieListResponse => _movieListResponse;

  void getMovieList() async {
    _movieListResponse = await repository.getMovieList();
    logger.d(_movieListResponse.results?.first.toJson());
    notifyListeners();
  }
}

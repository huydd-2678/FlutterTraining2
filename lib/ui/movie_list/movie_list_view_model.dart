import 'package:flutter/material.dart';
import 'package:flutter_training_2/data/repository/movie_repository.dart';

class MovieListViewModel extends ChangeNotifier {
  final MovieRepository repository;

  MovieListViewModel(this.repository);

  void getMovieList() async {
    await repository.getMovieList();
  }
}

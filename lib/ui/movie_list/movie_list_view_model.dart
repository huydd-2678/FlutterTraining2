import 'package:flutter/material.dart';
import 'package:flutter_training_2/data/model/movie.dart';
import 'package:flutter_training_2/data/model/movie_list_response.dart';
import 'package:flutter_training_2/data/repository/movie_repository.dart';
import 'package:flutter_training_2/utils/enums.dart';

class MovieListViewModel extends ChangeNotifier {
  final MovieRepository repository;

  MovieListViewModel(this.repository);

  LoadingStatus loadingStatus = LoadingStatus.finish;
  int currentPage = 1;
  int totalPages = 1;

  final List<Movie> _movieList = [];

  List<Movie> get movieList => _movieList;

  void getMovieList({int page = 1, bool isRefresh = false}) async {
    if (page == 1 && !isRefresh) {
      loadingStatus = LoadingStatus.loading;
      notifyListeners();
    }
    MovieListResponse response = await repository.getMovieList(page);
    List<Movie> movies = response.results;
    if (isRefresh) {
      _movieList.clear();
    }
    _movieList.addAll(movies);
    loadingStatus = LoadingStatus.finish;
    currentPage = response.page;
    totalPages = response.totalPages;
    notifyListeners();
  }

  void loadNextPage() {
    if (!haveLoadMore()) {
      return;
    }
    getMovieList(page: ++currentPage);
  }

  bool haveLoadMore() {
    return currentPage < totalPages;
  }
}

import 'package:flutter_training_2/data/repository/movie_repository.dart';
import 'package:flutter_training_2/ui/movie_list/movie_list_view_model.dart';
import 'package:provider/provider.dart';

final _movieListViewModelProvider = ChangeNotifierProvider(
    create: (context) => MovieListViewModel(context.read<MovieRepository>()));

final viewModelProviders = [_movieListViewModelProvider];

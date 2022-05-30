import 'package:flutter_training_2/data/repository/movie_repository.dart';
import 'package:flutter_training_2/data/repository/movie_repository_impl.dart';
import 'package:flutter_training_2/data/source/remote/movie_api.dart';
import 'package:provider/provider.dart';

final _movieRepository = Provider<MovieRepository>(
  create: (context) => MovieRepositoryImpl(movieApi: context.read<MovieApi>()),
);

final repositoryProviders = [_movieRepository];

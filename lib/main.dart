import 'package:flutter/material.dart';
import 'package:flutter_training_2/data/api_client.dart';
import 'package:flutter_training_2/data/repository/movie_repository_impl.dart';
import 'package:flutter_training_2/ui/movie_list/movie_list.dart';
import 'package:flutter_training_2/ui/movie_list/movie_list_view_model.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

final logger = Logger();

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MovieListViewModel(MovieRepositoryImpl()))
    ],
    child: const MyApp(),
  ));

  // final dio = Dio();
  // final client = ApiClient(dio);

  // client.getMovieList().then((it) => logger.d(it.results?.first.toJson()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Training 2',
      theme: ThemeData(),
      home: const MovieList(),
    );
  }
}

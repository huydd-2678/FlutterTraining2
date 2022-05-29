import 'package:flutter/material.dart';
import 'package:flutter_training_2/data/api_client.dart';
import 'package:flutter_training_2/data/rest_client.dart';
import 'package:flutter_training_2/ui/movie_detail/movie_detail.dart';
import 'package:flutter_training_2/ui/movie_list/movie_list.dart';
import 'package:flutter_training_2/utils/constants.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart';

final logger = Logger();

void main() {
  // runApp(const MyApp());
  final dio = Dio();
  final client = ApiClient(dio);
  //
  // client.getMovieList().then((value) => logger.d(value));

  // dio.options.headers["Demo-Header"] = "demo header"; // config your dio headers globally
  // final client = RestClient(dio);

  client.getMovieList().then((it) => print(it));
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

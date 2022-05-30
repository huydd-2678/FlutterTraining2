import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_training_2/data/source/remote/movie_api.dart';
import 'package:provider/provider.dart';

import '../utils/constants.dart';

final _dioProvider = Provider<Dio>(create: (_) {
  final options = BaseOptions(
    contentType: "application/json",
    receiveTimeout: 10000,
    connectTimeout: 10000,
    sendTimeout: 10000,
    baseUrl: BASE_URL,
    queryParameters: {
      'api_key': API_KEY,
    },
  );
  final dio = Dio(options);
  dio.httpClientAdapter = DefaultHttpClientAdapter();
  return dio;
});

final _movieApiProvider = Provider<MovieApi>(
  create: (context) => MovieApi(dio: context.read<Dio>()),
);

final networkProviders = [_dioProvider, _movieApiProvider];

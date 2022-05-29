import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_training_2/data/model/movie_list_response.dart';
import 'package:flutter_training_2/utils/constants.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: BASE_URL)
// @Headers(<String, dynamic>{
//   'Content-Type': 'application/json',
//   'Accept': 'application/json',
// })
abstract class ApiClient {
  factory ApiClient(Dio dio) {
    dio.options = BaseOptions(
      receiveTimeout: 10000,
      connectTimeout: 10000,
      sendTimeout: 10000,
      baseUrl: BASE_URL,
      queryParameters: {
        'apikey': API_KEY,
      },
    );
    return _ApiClient(dio);
  }

  @GET("/3/movie/popular")
  Future<MovieListResponse> getMovieList();
}

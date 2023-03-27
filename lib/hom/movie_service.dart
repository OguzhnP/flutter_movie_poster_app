import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/environment_config.dart';
import 'package:movieapp/hom/movie.dart';
import 'package:movieapp/hom/movies_exception.dart';

final movieServiceProvider = Provider<MovieService>((ref) {
  final config = ref.watch(environmentConfigProvider);

  return MovieService(config, Dio());
});

class MovieService {
  final EnvironmentConfig _environmentConfig;
  final Dio _dio;
  final movieApiKey = "WRITE YOUR OWN APIKEY";

  MovieService(this._environmentConfig, this._dio);

  Future<List<Movie>> getMovies() async {
    try {
      final response = await _dio.get(
          "https://api.themoviedb.org/3/movie/popular?api_key=$movieApiKey&language=en-US&page=1");

      final results = List<Map<String, dynamic>>.from(response.data['results']);

      List<Movie> movies = results
          .map((movieData) => Movie.fromMap(movieData))
          .toList(growable: false);
      return movies;
    } on DioError catch (dioError) {
      throw MoviesException.fromDioError(dioError);
    }
  }
}

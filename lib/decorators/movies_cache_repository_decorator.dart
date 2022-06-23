import 'dart:convert';

import 'package:movieapp/decorators/movies_repository_decorator.dart';
import 'package:movieapp/models/movies_model.dart';
import 'package:movieapp/repositories/movies_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoviesCacheRepositoryDecorator extends MoviesRepositoryDecorator {
  MoviesCacheRepositoryDecorator(MoviesRepository moviesRepository)
      : super(moviesRepository);

  @override
  Future<Movies> getMovies() async {
    try {
      Movies movies = await super.getMovies();
      _saveInCache(movies);
      return movies;
    } catch (e) {
      return await _getInCache();
    }
  }

  _saveInCache(Movies movies) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonMovies = jsonEncode(movies.toJson());
    prefs.setString('movies_cache', jsonMovies);
    print('Salvou os movies in cache $jsonMovies');
  }

  Future<Movies> _getInCache() async {
    var prefs = await SharedPreferences.getInstance();
    var moviesJsonString = prefs.getString('movies_cache')!;
    Map json = jsonDecode(moviesJsonString);
    var movies = Movies.fromJson(json);
    print('Recuperou os movies in cache $moviesJsonString');
    return movies;
  }
}

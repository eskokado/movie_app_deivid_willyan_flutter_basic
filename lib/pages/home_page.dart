import 'package:flutter/material.dart';
import 'package:movieapp/controllers/movie_controller.dart';
import 'package:movieapp/models/movies_model.dart';
import 'package:movieapp/repositories/movies_repository_impl.dart';
import 'package:movieapp/services/dio_service_impl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller = MovieController(
    MoviesRepositoryImpl(
      DioServiceImpl(),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<Movies?>(
        valueListenable: _controller.movies,
        builder: (_, movies, __) {
          return movies != null
              ? ListView.builder(
                  itemCount: movies.listMovies.length,
                  itemBuilder: (_, index) =>
                      Text(movies.listMovies[index].title),
                )
              : Container();
        },
      ),
    );
  }
}

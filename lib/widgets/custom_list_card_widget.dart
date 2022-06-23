import 'package:flutter/material.dart';
import 'package:movieapp/models/movies_model.dart';
import 'package:movieapp/utils/apis.utils.dart';

class CustomListCardWidget extends StatelessWidget {
  final Movie movie;
  const CustomListCardWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(color: Colors.black45),
      child: Row(children: [
        Image.network(API.REQUEST_IMG(movie.posterPath)),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const Spacer(),
                Text('Popularidade: ${movie.popularity}'),
                const SizedBox(
                  height: 10,
                ),
                Text('Votos: ${movie.voteAverage}'),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
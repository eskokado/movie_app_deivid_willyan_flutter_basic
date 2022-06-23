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
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
          child: Image.network(
            API.REQUEST_IMG(movie.posterPath),
            loadingBuilder: (_, child, progress) {
              if (progress == null) return child;
              return const CircularProgressIndicator.adaptive();
            },
          ),
        ),
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

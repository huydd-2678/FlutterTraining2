import 'package:flutter/material.dart';
import 'package:flutter_training_2/data/model/movie.dart';
import 'package:flutter_training_2/ui/movie_detail/movie_detail.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetail(movie: movie),
              ),
            );
          },
          child: Row(
            children: [
              const SizedBox(width: 15),
              Image.network(
                movie.fullImageUrl,
                fit: BoxFit.cover,
                width: 120,
                height: 180,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: const TextStyle(fontSize: 22),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      movie.overview,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 15),
            ],
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

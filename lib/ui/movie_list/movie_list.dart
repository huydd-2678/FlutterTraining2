import 'package:flutter/material.dart';
import 'package:flutter_training_2/ui/movie_detail/movie_detail.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Popular',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Color(0xFF0A0A0A),
          ),
        ),
        elevation: 0,
      ),
      body: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MovieDetail()),
          );
        },
        child: const Text(
          'FORGOT PASSWORD?',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            decoration: TextDecoration.underline,
            decorationThickness: 1.5,
          ),
        ),
      ),
    );
  }

  Widget _item() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          
        ],
      ),
    );
  }
}

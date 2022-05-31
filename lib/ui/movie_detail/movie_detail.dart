import 'package:flutter/material.dart';
import 'package:flutter_training_2/data/model/movie.dart';
import 'package:flutter_training_2/ui/movie_detail/triangle_painter.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MovieDetail extends StatefulWidget {
  final Movie movie;

  const MovieDetail({Key? key, required this.movie}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Movie Detail',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Color(0xFF0A0A0A),
          ),
        ),
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF94B5CE),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color(0xFF94B5CE), //change your color here
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _image(widget.movie.fullBGImageUrl, widget.movie.fullImageUrl),
            const SizedBox(
              height: 6,
            ),
            _title(widget.movie.title, widget.movie.voteAverage),
            const SizedBox(
              height: 10,
            ),
            _reviewsAndTrailers(),
            _info(widget.movie.releaseDate),
            _description(widget.movie.overview),
          ],
        ),
      ),
    );
  }

  Widget _image(String backdropUrl, String posterUrl) {
    return Stack(
      children: [
        Image.network(
          backdropUrl,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 300,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: CustomPaint(
            painter: TrianglePainter(
              strokeColor: Colors.white,
              strokeWidth: 10,
              paintingStyle: PaintingStyle.fill,
            ),
            child: SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ),
        Positioned(
            bottom: 10,
            left: 15,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.5),
                    spreadRadius: 8,
                    blurRadius: 8,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Image.network(
                posterUrl,
                fit: BoxFit.cover,
                width: 120,
                height: 180,
              ),
            ))
      ],
    );
  }

  Widget _title(String title, num vote) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          CircularPercentIndicator(
            radius: 18,
            percent: vote.toDouble()/10,
            center: Text(
              vote.toString(),
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFFA1A1A1),
              ),
            ),
            progressColor: const Color(0xFF1A1A1A),
          ),
        ],
      ),
    );
  }

  Widget _reviewsAndTrailers() {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 2,
            color: Color(0xFFE6E6E6),
          ),
          bottom: BorderSide(
            width: 2,
            color: Color(0xFFE6E6E6),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/reviews.png',
                  width: 30,
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  'Reviews',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            child: VerticalDivider(
              color: Color(0xFFE6E6E6),
              thickness: 1,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/trailers.png',
                  width: 30,
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  'Trailers',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _info(String releaseDate) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2,
            color: Color(0xFFE6E6E6),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Genre',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Drama',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Release',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  releaseDate,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _description(String overview) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Text(
        overview,
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}

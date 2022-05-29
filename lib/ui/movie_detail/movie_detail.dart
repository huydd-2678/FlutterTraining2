import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Movie Detail',
          style: TextStyle(
            color: Color(0xFF0A0A0A),
            fontSize: 18,
            fontWeight: FontWeight.bold,
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
            _image(screenWidth),
            const SizedBox(
              height: 6,
            ),
            _title(),
            const SizedBox(
              height: 10,
            ),
            _reviewsAndTrailers(),
            _info(),
            _description(),
          ],
        ),
      ),
    );
  }

  Widget _image(double width) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/rsq8.jpg',
          width: width,
        ),
        Positioned(
          bottom: 10,
          left: 15,
          child: Image.asset(
            'assets/images/rsq8.jpg',
            width: width * 0.25,
          ),
        )
      ],
    );
  }

  Widget _title() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Escape From Pretoria",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          CircularPercentIndicator(
            radius: 18,
            percent: 0.6,
            center: const Text(
              "6.5",
              style: TextStyle(
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

  Widget _info() {
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
              children: const [
                Text(
                  'Release',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  '2020-03-06',
                  style: TextStyle(
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

  Widget _description() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: const Text(
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when anunknown printer took a galley of type and scrambled itto make a type specimen book. It has survived not only five centuries,but also the leap into electronic typesetting, remaining essentiallyunchanged. It was popularised in the 1960s with the release of Letrasetsheets containing Lorem Ipsum passages, and more',
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}

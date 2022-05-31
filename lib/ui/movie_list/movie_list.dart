import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training_2/ui/movie_list/movie_item.dart';
import 'package:flutter_training_2/ui/movie_list/movie_list_view_model.dart';
import 'package:provider/provider.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Provider.of<MovieListViewModel>(context, listen: false).getMovieList();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        Provider.of<MovieListViewModel>(context, listen: false).loadNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
        body: SafeArea(
          child: Consumer<MovieListViewModel>(
              builder: (context, viewModel, child) {
            return _movieList(viewModel);
          }),
        ));
  }

  Widget _movieList(MovieListViewModel movieListViewModel) {
    return RefreshIndicator(
      onRefresh: () async {
        return movieListViewModel.getMovieList(isRefresh: true);
      },
      child: ListView.builder(
        controller: _scrollController,
        itemCount: context.watch<MovieListViewModel>().movieList.length + 1,
        itemBuilder: (context, index) {
          if (index == context.watch<MovieListViewModel>().movieList.length) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: CupertinoActivityIndicator(),
            );
          }
          return MovieItem(
              movie: context.watch<MovieListViewModel>().movieList[index]);
        },
      ),
    );
  }
}

//File created by mcedgar
//by 1:58 AM
//on 08/Nov/2019

import 'dart:async';

import 'package:auto_load_api/actions/movies_action.dart';
import 'package:auto_load_api/main.dart';
import 'package:auto_load_api/models/app_state.dart';
import 'package:auto_load_api/models/movie.dart';
import 'package:auto_load_api/presentation/movie_search.dart';
import 'package:auto_load_api/presentation/widgets/gridview_builder.dart';
import 'package:flutter/material.dart' hide showSearch, SearchDelegate;
import 'package:redux/redux.dart';
import 'package:rxdart/rxdart.dart';

class QuerySearchDelegate extends SearchDelegate<String> {
  QuerySearchDelegate({this.store, ActionsDispatcher dispatcher, this.movies, this.scrollController})
      : streamController = StreamController<String>() {
    dispatcher.ofType<SetMovies>().listen(_onNewResult);
    sub = Observable<String>(streamController.stream)
        .debounceTime(const Duration(seconds: 5))
        .distinct()
        .listen(_onNewQuery);
  }

  final StreamController<String> streamController;
  final ScrollController scrollController;
  final Store<AppState> store;
  List<Movie> movies;
  bool isLoading = false;
  StreamSubscription<String> sub;

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      //CloseButton(),
      if (query.trim().isNotEmpty)
        IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              query = '';
            }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    //print('buildResults');
    return InkWell(
      child: const Text('Result'),
      onTap: () {
        close(context, 'results');
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //print('buildSuggestions');
    if (query.trim().isNotEmpty) {
      // do the search
      streamController.add(query.trim());
      if (isLoading) {
        return Container(
          width: double.infinity,
          child: const CircularProgressIndicator(),
          alignment: AlignmentDirectional.topCenter,
          margin: const EdgeInsets.all(16.0),
        );
      } else {
        return GridviewBuilder(
          scrollController: scrollController,
          context: context,
          films: movies,
        );
      }
    } else {
      return GridviewBuilder(
        scrollController: scrollController,
        context: context,
        films: movies,
      );
    }
  }

  void _onNewResult(SetMovies event) {
    // clear the loading

    // set the new movies
    setState(() {
      isLoading = false;
      movies = event.films;
    });
  }

  void _onNewQuery(String query) {
    isLoading = true;
    store.dispatch(SearchMovieGenre(query));
  }

  @override
  void close(BuildContext context, String result) {
    sub.cancel();
    super.close(context, result);
  }
}

//File created by mcedgar
//by 1:50 AM
//on 23/Sep/2019

import 'package:auto_load_api/models/app_state.dart';
import 'package:auto_load_api/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class MoviesContainer extends StatelessWidget {
  const MoviesContainer({Key key, this.builder}) : super(key: key);
  final ViewModelBuilder<List<Movie>> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Movie>>(
      converter: (Store<AppState> store) => store.state.films.toList(),
      builder: builder,
    );
  }
}

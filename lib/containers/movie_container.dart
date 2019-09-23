//File created by mcedgar
//by 2:11 AM
//on 23/Sep/2019

import 'package:auto_load_api/models/app_state.dart';
import 'package:auto_load_api/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class MovieContainer extends StatelessWidget {
  const MovieContainer({Key key, this.builder}) : super(key: key);
  final ViewModelBuilder<Movie> builder;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Movie>(
      converter: (Store<AppState> store) => store.state.selectedMovie,
      builder: builder,
    );
  }
}

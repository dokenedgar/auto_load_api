//File created by mcedgar
//by 1:13 AM
//on 23/Sep/2019

library app_state;

import 'package:auto_load_api/models/movie.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState([void updates(AppStateBuilder b)]) = _$AppState;

  AppState._();

  factory AppState.initialState() {
    return _$AppState((AppStateBuilder b) {
      b..films = ListBuilder<Movie>();
      b..selectedMovie = null;
      b..pageNumber = 1;
    });
  }

  BuiltList<Movie> get films;
  @nullable
  Movie get selectedMovie;
  int get pageNumber;
}

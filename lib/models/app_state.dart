//File created by mcedgar
//by 1:13 AM
//on 23/Sep/2019

library app_state;

import 'package:auto_load_api/models/movie.dart';
import 'package:auto_load_api/models/movie_filtering.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState([void updates(AppStateBuilder b)]) = _$AppState;

  AppState._();

  factory AppState.initialState() {
    return _$AppState((AppStateBuilder b) {
      b
        ..films = ListBuilder<Movie>()
        ..selectedMovie = null
        ..pageNumber = 1
        ..genre = 'all'
        ..quality = 'all'
        ..filterOptions = FilterOptions.initialState().toBuilder();
    });
  }

  BuiltList<Movie> get films;

  @nullable
  Movie get selectedMovie;

  int get pageNumber;

  String get genre;

  String get quality;

  FilterOptions get filterOptions;
}

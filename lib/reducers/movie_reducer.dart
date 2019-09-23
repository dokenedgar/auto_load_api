//File created by mcedgar
//by 10:42 PM
//on 22/Sep/2019

import 'package:auto_load_api/actions/movies_action.dart';
import 'package:auto_load_api/models/app_state.dart';
import 'package:redux/redux.dart';

AppState _setMovies(AppState state, SetMovies action) {
  return AppState(action.films, state.selectedMovie);
}

AppState _setSelectedMovie(AppState state, SelectedMovie action) {
  return AppState(state.films, action.movie);
}

final Reducer<AppState> reducer = combineReducers<AppState>(<Reducer<AppState>>[
  TypedReducer<AppState, SetMovies>(_setMovies),
  TypedReducer<AppState, SelectedMovie>(_setSelectedMovie),
]);

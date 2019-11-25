//File created by mcedgar
//by 10:42 PM
//on 22/Sep/2019

import 'package:auto_load_api/actions/movies_action.dart';
import 'package:auto_load_api/models/app_state.dart';
import 'package:redux/redux.dart';

AppState _setMovies(AppState state, SetMovies action) {
  return state.rebuild((AppStateBuilder b) {
    b.films.addAll(action.films);
  });
}

AppState _setSelectedMovie(AppState state, SelectedMovie action) {
  return state.rebuild((AppStateBuilder b) {
    b.selectedMovie.replace(action.movie);
  });
}

AppState _changePageNumber(AppState state, ChangePageNumber action) {
  return state.rebuild((AppStateBuilder b) {
    b.pageNumber = action.pageNumber;
  });
}

AppState _setGenre(AppState state, SetGenre action) {
  return state.rebuild((AppStateBuilder b) => b.genre = action.genre);
}

AppState _setQuality(AppState state, SetQuality action) =>
    state.rebuild((AppStateBuilder b) => b.quality = action.quality);

AppState _setSortBy(AppState state, SetSortBy action) => state.rebuild((AppStateBuilder b) => b.sortBy = action.sortBy);

AppState _setMinRating(AppState state, SetMinRating action) =>
    state.rebuild((AppStateBuilder b) => b.minimumRating = action.minRating);

final Reducer<AppState> reducer = combineReducers<AppState>(<Reducer<AppState>>[
  TypedReducer<AppState, SetMovies>(_setMovies),
  TypedReducer<AppState, SelectedMovie>(_setSelectedMovie),
  TypedReducer<AppState, ChangePageNumber>(_changePageNumber),
  TypedReducer<AppState, SetGenre>(_setGenre),
  TypedReducer<AppState, SetQuality>(_setQuality),
  TypedReducer<AppState, SetSortBy>(_setSortBy),
  TypedReducer<AppState, SetMinRating>(_setMinRating),
]);

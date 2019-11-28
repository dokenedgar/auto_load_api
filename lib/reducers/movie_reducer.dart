//File created by mcedgar
//by 10:42 PM
//on 22/Sep/2019

import 'package:auto_load_api/actions/movies_action.dart';
import 'package:auto_load_api/models/app_state.dart';
import 'package:auto_load_api/models/movie_filtering.dart';
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
  return state.rebuild((AppStateBuilder b) => b.filterOptions.genre = action.genre);
}

AppState _setQuality(AppState state, SetQuality action) =>
    state.rebuild((AppStateBuilder b) => b.filterOptions.quality = action.quality);

AppState _setSortBy(AppState state, SetSortBy action) =>
    state.rebuild((AppStateBuilder b) => b.filterOptions.sortBy = action.sortBy);

AppState _setMinRating(AppState state, SetMinRating action) => state.rebuild((AppStateBuilder b) {
      return b..filterOptions.minimumRating = action.minRating;
    });

AppState _setFilterMovies(AppState state, SetFilterMovies action) {
  return state.rebuild((AppStateBuilder b) {
    if (b.filterOptions.pageNumber > 1) {
      b.films.addAll(action.films);
    } else {
      b.films.replace(action.films);
    }
  });
}

AppState _setFilterPageNumber(AppState state, ChangeFilterPageNumber action) =>
    state.rebuild((AppStateBuilder b) => b.filterOptions.pageNumber = action.pageNumber);

AppState _reInitializeFilterOptions(AppState state, SetFilterOptionsInitState action) => state
    .rebuild((AppStateBuilder b) => b.filterOptions = FilterOptions.initialState().toBuilder());

AppState _removeGenre(AppState state, RemoveGenre action) => state.rebuild((AppStateBuilder b) {
      return b..filterOptions.genre = null;
    });

AppState _removeQuality(AppState state, RemoveQuality action) => state.rebuild((AppStateBuilder b) {
      return b..filterOptions.quality = null;
    });

AppState _removeSortBy(AppState state, RemoveSortBy action) => state.rebuild((AppStateBuilder b) {
      return b..filterOptions.sortBy = null;
    });

AppState _removeMinRating(AppState state, RemoveMinRating action) =>
    state.rebuild((AppStateBuilder b) {
      return b..filterOptions.minimumRating = null;
    });

AppState _setSearchedMovies(AppState state, SetSearchedMovies action) {
  return state.rebuild((AppStateBuilder b) {
    b.films.replace(action.films);
  });
}

final Reducer<AppState> reducer = combineReducers<AppState>(<Reducer<AppState>>[
  TypedReducer<AppState, SetMovies>(_setMovies),
  TypedReducer<AppState, SelectedMovie>(_setSelectedMovie),
  TypedReducer<AppState, ChangePageNumber>(_changePageNumber),
  TypedReducer<AppState, SetGenre>(_setGenre),
  TypedReducer<AppState, SetQuality>(_setQuality),
  TypedReducer<AppState, SetSortBy>(_setSortBy),
  TypedReducer<AppState, SetMinRating>(_setMinRating),
  TypedReducer<AppState, SetFilterMovies>(_setFilterMovies),
  TypedReducer<AppState, ChangeFilterPageNumber>(_setFilterPageNumber),
  TypedReducer<AppState, SetFilterOptionsInitState>(_reInitializeFilterOptions),
  TypedReducer<AppState, RemoveGenre>(_removeGenre),
  TypedReducer<AppState, RemoveQuality>(_removeQuality),
  TypedReducer<AppState, RemoveSortBy>(_removeSortBy),
  TypedReducer<AppState, RemoveMinRating>(_removeMinRating),
  TypedReducer<AppState, SetSearchedMovies>(_setSearchedMovies),
]);

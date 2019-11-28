//File created by mcedgar
//by 1:39 AM
//on 30/Sep/2019

import 'package:auto_load_api/actions/movies_action.dart';
import 'package:auto_load_api/data/yts_api.dart';
import 'package:auto_load_api/models/app_state.dart';
import 'package:auto_load_api/models/movie.dart';
import 'package:redux/redux.dart';

class AppMiddleware {
  const AppMiddleware(this.ytsApi);

  final YtsMovieApi ytsApi;

  List<Middleware<AppState>> get items {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, LoadMovies>(loadMovies),
      TypedMiddleware<AppState, SearchMovieGenre>(searchMovieGenre),
      TypedMiddleware<AppState, FilterMovies>(filterMovies),
    ];
  }

  Future<void> loadMovies(Store<AppState> store, LoadMovies action, NextDispatcher next) async {
    //print(next);
    final List<Movie> movieList = await ytsApi.getMovies(store.state.pageNumber);
    store..dispatch(SetMovies(movieList))..dispatch(ChangePageNumber(store.state.pageNumber + 1));
    //next(action);
  }

  Future<void> searchMovieGenre(
      Store<AppState> store, SearchMovieGenre action, NextDispatcher next) async {
    final List<Movie> movieList = await ytsApi.getMovies(store.state.pageNumber);
    store..dispatch(SetMovies(movieList))..dispatch(ChangePageNumber(store.state.pageNumber + 1));
  }

  Future<void> filterMovies(Store<AppState> store, FilterMovies action, NextDispatcher next) async {
    final int pageNumber = store.state.filterOptions.pageNumber;
    final List<Movie> movieList = await ytsApi.filterMovies(pageNumber, action.filterParameters);
    store..dispatch(SetFilterMovies(movieList))..dispatch(ChangeFilterPageNumber(pageNumber + 1));
  }
}

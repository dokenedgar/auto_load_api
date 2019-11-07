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
    ];
  }

  Future<void> loadMovies(
      Store<AppState> store, LoadMovies action, NextDispatcher next) async {
    //print(next);
    final List<Movie> movieList =
        await ytsApi.getMovies(store.state.pageNumber);
    store
      ..dispatch(SetMovies(movieList))
      ..dispatch(ChangePageNumber(store.state.pageNumber + 1));
    //next(action);
  }
}

//File created by mcedgar
//by 3:13 AM
//on 23/Oct/2019
import 'dart:convert';

import 'package:auto_load_api/actions/movies_action.dart';
import 'package:auto_load_api/models/app_state.dart';
import 'package:auto_load_api/models/movie.dart';
import 'package:auto_load_api/reducers/movie_reducer.dart';
import 'package:test/test.dart';

import '../res/res.dart';

void main() {
  final AppState initial = AppState.initialState();

  final String data = Res.movieListResult.readAsStringSync();
  final dynamic resultData = jsonDecode(data)['data']['movies'];

  final List<Movie> movieList = List<dynamic>.from(resultData)
      .map((dynamic it) => Movie.fromJson(it))
      .toList();

  test('setMovies', () {
    expect(initial.films.length, 0);
    expect(initial.selectedMovie, isNull);
    expect(initial.pageNumber, 1);

    final SetMovies action = SetMovies(movieList);

    final AppState result = reducer(initial, action);
    expect(result.films, isNotEmpty);
    expect(result.films.toList(), action.films);
  });

  test('setSelectedMovie', () {
    expect(initial.selectedMovie, isNull);

    final SelectedMovie action = SelectedMovie(movieList[0]);

    final AppState result = reducer(initial, action);
    expect(result.selectedMovie, isNotNull);
    expect(result.selectedMovie, action.movie);
  });

  test('changePageNumber', () {
    expect(initial.pageNumber, 1);
    const int newPageNumber = 3;
    const ChangePageNumber action = ChangePageNumber(newPageNumber);
    final AppState result = reducer(initial, action);
    expect(result.pageNumber, action.pageNumber);
  });
}

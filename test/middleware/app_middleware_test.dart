//File created by mcedgar
//by 10:41 AM
//on 23/Oct/2019

import 'dart:convert';

import 'package:auto_load_api/actions/movies_action.dart';
import 'package:auto_load_api/data/yts_api.dart';
import 'package:auto_load_api/middleware/app_middleware.dart';
import 'package:auto_load_api/models/app_state.dart';
import 'package:auto_load_api/models/movie.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';
import 'package:test/test.dart';

import '../res/res.dart';

void main() {
  tearDown(resetMockitoState);
  test('loadMovies', () async {
    int pageNumber = 1;
    final MockYtsApi api = MockYtsApi();
    final MockStore store = MockStore(MockAppState());

    final String data = Res.movieListResult.readAsStringSync();
    final dynamic resultData = jsonDecode(data)['data']['movies'];

    final List<Movie> movieList = List<dynamic>.from(resultData)
        .map((dynamic it) => Movie.fromJson(it))
        .toList();

    when(store.state.pageNumber).thenReturn(pageNumber);
    when(api.getMovies(captureThat(anything))).thenAnswer((_) async {
      return movieList;
    });
    when(store.dispatch(captureThat(anything)));

    final AppMiddleware middleware = AppMiddleware(api);
    final LoadMovies action = LoadMovies();

    final List<dynamic> args = <dynamic>[];
    void next(dynamic action) => args.add(action);
    final Future<void> future = middleware.loadMovies(store, action, next);
    //expect(args[0], action);
    await future;

    final VerificationResult verificationResult =
        verify(store.dispatch(captureThat(anything)));

    expect(verificationResult.callCount, 2);
  });
}

class MockYtsApi extends Mock implements YtsMovieApi {}

class MockStore extends Mock implements Store<AppState> {
  MockStore(this.state);
  @override
  MockAppState state;
}

class MockAppState extends Mock implements AppState {}

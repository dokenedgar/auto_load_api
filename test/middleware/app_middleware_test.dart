//File created by mcedgar
//by 10:41 AM
//on 23/Oct/2019

/*
void main() {
  tearDown(resetMockitoState);
  test('loadMovies', () async {
    const int pageNumber = 5;
    final MockYtsApi api = MockYtsApi();
    final AppState state = MockAppState();
    final Store<AppState> store = MockStore();

    final String data = Res.movieListResult.readAsStringSync();
    final dynamic resultData = jsonDecode(data)['data']['movies'];

    final List<Movie> movieList = List<dynamic>.from(resultData)
        .map((dynamic it) => Movie.fromJson(it))
        .toList();

    when(state.pageNumber).thenReturn(pageNumber);
    when(api.getMovies(captureThat(anything)))
        .thenAnswer((_) async => movieList);
    when(store.state).thenReturn(state);
    when(store.dispatch(captureThat(anything)));

    final AppMiddleware middleware = AppMiddleware(api);
    final LoadMovies action = LoadMovies();

    await middleware.loadMovies(store, action, null);

    final VerificationResult verificationResult =
        verify(store.dispatch(captureThat(anything)));

    expect(verificationResult.callCount, 2);
    final SetMovies setMovies = verificationResult.captured[0];
    expect(setMovies.films, movieList);
    final ChangePageNumber changePageNumber = verificationResult.captured[1];
    expect(changePageNumber.pageNumber, pageNumber + 1);
  });
}

class MockYtsApi extends Mock implements YtsMovieApi {}

class MockAppState extends Mock implements AppState {}

class MockStore extends Mock implements Store<AppState> {}
*/

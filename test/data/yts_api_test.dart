//File created by mcedgar
//by 8:48 AM
//on 16/Oct/2019

import 'dart:convert';

import 'package:auto_load_api/data/yts_api.dart';
import 'package:auto_load_api/models/movie.dart';
import 'package:auto_load_api/services/http_service.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../res/res.dart';

void main() {
  test('api constructor', () {
    final MockHttpService httpService = MockHttpService();
    final YtsMovieApi api = YtsMovieApi(httpService);
    expect(api.http, httpService);
  });

  group('getMovies', () {
    const int pageNumber = 1;
    final MockHttpService service = MockHttpService();

    test('getMovies - null', () async {
      when(service.get(captureThat(anything)))
          .thenAnswer((_) async => <String, dynamic>{'data': null});

      final YtsMovieApi api = YtsMovieApi(service);
      final List<Movie> result = await api.getMovies(pageNumber);

      expect(result, isEmpty);

      final VerificationResult verificationResult =
          verify(service.get(captureThat(anything)));

      expect(verificationResult.callCount, 1);
      expect(verificationResult.captured.length, 1);
      expect(verificationResult.captured[0],
          startsWith('/list_movies.json?page='));
      expect(verificationResult.captured[0], endsWith('$pageNumber'));
    });

    test('getMovies with Data', () async {
      final String data = Res.movieListResult.readAsStringSync();
      final dynamic resultData = jsonDecode(data);

      when(service.get(captureThat(anything)))
          .thenAnswer((_) async => resultData);

      final YtsMovieApi api = YtsMovieApi(service);
      final List<Movie> result = await api.getMovies(pageNumber);

      expect(result, isNotEmpty);
      expect(result.length, 20);
      expect(result[0].trailerId, 'yHQRgHp94BQ');

      final VerificationResult verificationResult =
          verify(service.get(captureThat(anything)));

      expect(verificationResult.callCount, 1);
      expect(verificationResult.captured.length, 1);
      expect(verificationResult.captured[0],
          startsWith('/list_movies.json?page='));
      expect(verificationResult.captured[0], endsWith('$pageNumber'));
    });
  });
}

class MockHttpService extends Mock implements HttpService {}

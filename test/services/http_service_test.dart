//File created by mcedgar
//by 11:37 PM
//on 15/Oct/2019

import 'package:auto_load_api/services/http_service.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  const String baseUrl = 'http://example.com';
  final Client client = Client();

  tearDown(resetMockitoState);

  test('constructor', () {
    final HttpService service = HttpService(baseUrl, client);
    expect(service.baseUrl, baseUrl);
    expect(service.client, client);
  });

  group('get', () {
    const String path = '/path';
    final Client client = MockClient();

    test('get 200', () async {
      when(client.get(captureThat(anything),
              headers: captureAnyNamed('headers')))
          .thenAnswer((_) async => Response('{"message":"test"}', 200));

      final HttpService service = HttpService(baseUrl, client);
      final dynamic result = await service.get(path);

      expect(result, <String, dynamic>{'message': 'test'});

      final VerificationResult verificationResult = verify(client
          .get(captureThat(anything), headers: captureAnyNamed('headers')));
      verificationResult.called(1);

      //print(verificationResult.captured);

      final List<dynamic> captured = verificationResult.captured;
      expect(captured.length, 2);
      expect(captured[0], '$baseUrl$path');
      expect(captured[1], isNull);
    });

    test('get 400', () async {
      when(client.get(captureThat(anything),
              headers: captureAnyNamed('headers')))
          .thenAnswer((_) async => Response('{"error":"message"}', 400));

      final HttpService service = HttpService(baseUrl, client);
      //final dynamic result = await service.get(path);

      expect(
          () => service.get(
                path,
              ),
          throwsA('{"error":"message"}'));
    });
  });
}

class MockClient extends Mock implements Client {}

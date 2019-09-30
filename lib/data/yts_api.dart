//File created by mcedgar
//by 1:30 AM
//on 30/Sep/2019

import 'package:auto_load_api/movie.dart';
import 'package:auto_load_api/services/http_service.dart';

class YtsMovieApi {
  const YtsMovieApi(this.http);
  final HttpService http;

  Future<List<Movie>> getMovies(int pageNumber) async {
    final dynamic data =
        await http.get('/list_movies.json?page=$pageNumber&limit=6');

    return List<dynamic>.from(data['data']['movies'])
        .map((dynamic it) => Movie.fromJson(it))
        .toList();
  }
}

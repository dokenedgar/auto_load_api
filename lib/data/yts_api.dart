//File created by mcedgar
//by 1:30 AM
//on 30/Sep/2019

import 'package:auto_load_api/models/movie.dart';
import 'package:auto_load_api/services/http_service.dart';

class YtsMovieApi {
  const YtsMovieApi(this.http);

  final HttpService http;

  Future<List<Movie>> getMovies(int pageNumber, {String genre = 'all'}) async {
    final dynamic data = await http.get('/list_movies.json?genre=$genre&page=$pageNumber');

    //final Map<String, dynamic> query;

    // query.keys.map((key) => '$key=${query[key]}').join('&');

    final dynamic movieData = data['data'];
    return movieData == null
        ? <Movie>[]
        : List<dynamic>.from(movieData['movies']).map((dynamic it) => Movie.fromJson(it)).toList();
  }
}

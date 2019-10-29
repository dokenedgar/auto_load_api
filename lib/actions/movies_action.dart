//File created by mcedgar
//by 10:42 PM
//on 22/Sep/2019

import 'package:auto_load_api/models/movie.dart';

class SetMovies {
  const SetMovies(this.films);
  final List<Movie> films;
}

class SelectedMovie {
  const SelectedMovie(this.movie);
  final Movie movie;
}

class ChangePageNumber {
  const ChangePageNumber(this.pageNumber);
  final int pageNumber;
}

class LoadMovies {}
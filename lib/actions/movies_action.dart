//File created by mcedgar
//by 10:42 PM
//on 22/Sep/2019

import 'package:auto_load_api/models/movie.dart';
import 'package:auto_load_api/models/movie_filter_by_ratings.dart';
import 'package:auto_load_api/models/movie_genre.dart';
import 'package:auto_load_api/models/movie_quality.dart';
import 'package:auto_load_api/models/movie_sort_by.dart';

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

class SearchMovies {
  const SearchMovies(this.queryTerm);

  final String queryTerm;
}

class SetSearchedMovies {
  const SetSearchedMovies(this.films);

  final List<Movie> films;
}

class SetGenre {
  const SetGenre(this.genre);

  final MovieGenre genre;
}

class SetQuality {
  const SetQuality(this.quality);

  final MovieQuality quality;
}

class SetSortBy {
  const SetSortBy(this.sortBy);

  final MovieSortBy sortBy;
}

class SetMinRating {
  const SetMinRating(this.minRating);

  final MovieFilterByRating minRating;
}

class FilterMovies {
  const FilterMovies(this.filterParameters);

  final String filterParameters;
}

class SetFilterMovies {
  const SetFilterMovies(this.films);

  final List<Movie> films;
}

class ChangeFilterPageNumber {
  const ChangeFilterPageNumber(this.pageNumber);

  final int pageNumber;
}

class SetFilterOptionsInitState {}

class RemoveGenre {}

class RemoveQuality {}

class RemoveSortBy {}

class RemoveMinRating {}

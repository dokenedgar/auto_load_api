//File created by mcedgar
//by 12:28 AM
//on 12/Nov/2019

library movie_filtering;

import 'package:auto_load_api/models/movie_filter_by_ratings.dart';
import 'package:auto_load_api/models/movie_genre.dart';
import 'package:auto_load_api/models/movie_quality.dart';
import 'package:auto_load_api/models/movie_sort_by.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'movie_filtering.g.dart';

abstract class FilterOptions implements Built<FilterOptions, FilterOptionsBuilder> {
  factory FilterOptions([void updates(FilterOptionsBuilder b)]) = _$FilterOptions;

  FilterOptions._();

  factory FilterOptions.initialState() {
    return _$FilterOptions((FilterOptionsBuilder b) {
      b
        ..sortByOptions = ListBuilder<MovieSortBy>(MovieSortBy.values)
        ..ratingsOptions = ListBuilder<MovieFilterByRating>(MovieFilterByRating.values)
        ..genreOptions = ListBuilder<MovieGenre>(MovieGenre.values)
        ..qualityOptions = ListBuilder<MovieQuality>(MovieQuality.values)
        ..pageNumber = 1;
    });
  }

  BuiltList<MovieSortBy> get sortByOptions;

  @nullable
  MovieSortBy get sortBy;

  BuiltList<MovieFilterByRating> get ratingsOptions;

  @nullable
  MovieFilterByRating get minimumRating;

  BuiltList<MovieGenre> get genreOptions;

  @nullable
  MovieGenre get genre;

  BuiltList<MovieQuality> get qualityOptions;

  @nullable
  MovieQuality get quality;

  @nullable
  BuiltMap<String, MovieFilterByRating> get minRatings;

  int get pageNumber;

  List<dynamic> _getQueryOptions() {
    return <dynamic>[
      if (genre != null) genre,
      if (minimumRating != null) minimumRating,
      if (quality != null) quality,
      if (sortBy != null) sortBy
    ].toList();
  }

  //Map<String, dynamic> getMap() {
  String getFilterParams() {
    final Map<String, dynamic> filterOptionsMap = <String, dynamic>{};
    final List<dynamic> temp = _getQueryOptions();
    for (dynamic el in temp) {
      filterOptionsMap[el.filterCategory] = el.toString();
    }
    //query.keys.map((key) => '$key=${query[key]}').join('&');
    String q = filterOptionsMap.keys.map((String key) => '$key=${filterOptionsMap[key]}').join('&');
    //print(q);

    return q;
  }
}

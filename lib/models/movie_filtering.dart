//File created by mcedgar
//by 12:28 AM
//on 12/Nov/2019

library movie_filtering;

import 'package:auto_load_api/models/movie_filter_by_ratings.dart';
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
        ..ratingsOptions = ListBuilder<MovieFilterByRating>(MovieFilterByRating.values);
      print(b.sortBy);
    });
  }

  BuiltList<MovieSortBy> get sortByOptions;

  @nullable
  MovieSortBy get sortBy;

  BuiltList<MovieFilterByRating> get ratingsOptions;

  @nullable
  MovieFilterByRating get minimum_rating;
}

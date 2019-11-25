//File created by mcedgar
//by 12:28 AM
//on 12/Nov/2019

library movie_filtering;

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
        ..sortBy = MovieSortBy.title
        ..sortByOptions = ListBuilder<MovieSortBy>(MovieSortBy.values);
      print(b.sortByOptions.runtimeType);
    });
  }

  BuiltList<MovieSortBy> get sortByOptions;
  MovieSortBy get sortBy;
}

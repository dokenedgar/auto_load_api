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
        ..qualityOptions = ListBuilder<MovieQuality>(MovieQuality.values);
    });
  }

  BuiltList<MovieSortBy> get sortByOptions;

  @nullable
  MovieSortBy get sortBy;

  BuiltList<MovieFilterByRating> get ratingsOptions;

  @nullable
  MovieFilterByRating get minimum_rating;

  BuiltList<MovieGenre> get genreOptions;

  @nullable
  MovieGenre get genre;

  BuiltList<MovieQuality> get qualityOptions;

  @nullable
  MovieQuality get quality;
}

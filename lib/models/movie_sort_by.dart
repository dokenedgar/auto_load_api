//File created by mcedgar
//by 11:54 AM
//on 12/Nov/2019

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

class MovieSortBy {
  const MovieSortBy._(this._value);

  final String _value;

  static const MovieSortBy title = MovieSortBy._('title');
  static const MovieSortBy year = MovieSortBy._('year');
  static const MovieSortBy rating = MovieSortBy._('rating');
  static const MovieSortBy downloadCount = MovieSortBy._('download_count');
  static const MovieSortBy likeCount = MovieSortBy._('like_count');
  static const MovieSortBy dateAdded = MovieSortBy._('date_added');

  static const List<MovieSortBy> values = <MovieSortBy>[
    title,
    year,
    rating,
    downloadCount,
    likeCount,
    dateAdded,
  ];

  static Serializer<MovieSortBy> get serializer => _$movieSortBySerializer;

  @override
  String toString() {
    return '$_value';
  }
}

MovieSortBySerializer _$movieSortBySerializer = MovieSortBySerializer();

class MovieSortBySerializer implements PrimitiveSerializer<MovieSortBy> {
  final bool structured = false;

  @override
  final Iterable<Type> types = BuiltList<Type>(<Type>[MovieSortBy]);

  @override
  final String wireName = 'MovieSortBy';

  @override
  Object serialize(Serializers serializers, MovieSortBy object,
      {FullType specifiedType = FullType.unspecified}) {
    return object._value;
  }

  @override
  MovieSortBy deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return MovieSortBy.values.firstWhere((MovieSortBy it) => it._value == serialized);
  }
}

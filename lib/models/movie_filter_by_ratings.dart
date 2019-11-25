//File created by mcedgar
//by 2:57 AM
//on 25/Nov/2019

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

class MovieFilterByRating {
  const MovieFilterByRating._(this._rating);

  final int _rating;

  static const MovieFilterByRating zero = MovieFilterByRating._(0);
  static const MovieFilterByRating one = MovieFilterByRating._(1);
  static const MovieFilterByRating two = MovieFilterByRating._(2);
  static const MovieFilterByRating three = MovieFilterByRating._(3);
  static const MovieFilterByRating four = MovieFilterByRating._(4);
  static const MovieFilterByRating five = MovieFilterByRating._(5);
  static const MovieFilterByRating six = MovieFilterByRating._(6);
  static const MovieFilterByRating seven = MovieFilterByRating._(7);
  static const MovieFilterByRating eight = MovieFilterByRating._(8);
  static const MovieFilterByRating nine = MovieFilterByRating._(9);

  static const List<MovieFilterByRating> values = <MovieFilterByRating>[
    zero,
    one,
    two,
    three,
    four,
    five,
    six,
    seven,
    eight,
    nine
  ];

  static Serializer<MovieFilterByRating> get serializer => _$movieFilterByRatingSerializer;

  @override
  String toString() {
    return '$_rating';
  }

  int getValue() {
    return _rating;
  }
}

MovieFilterByRatingSerializer _$movieFilterByRatingSerializer = MovieFilterByRatingSerializer();

class MovieFilterByRatingSerializer implements PrimitiveSerializer<MovieFilterByRating> {
  final bool structured = false;

  @override
  final Iterable<Type> types = BuiltList<Type>(<Type>[MovieFilterByRating]);

  @override
  final String wireName = 'MovieFilterByRating';

  @override
  Object serialize(Serializers serializers, MovieFilterByRating object,
      {FullType specifiedType = FullType.unspecified}) {
    return object._rating;
  }

  @override
  MovieFilterByRating deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return MovieFilterByRating.values
        .firstWhere((MovieFilterByRating it) => it._rating == serialized);
  }
}

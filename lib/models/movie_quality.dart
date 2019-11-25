//File created by mcedgar
//by 2:05 PM
//on 25/Nov/2019

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

class MovieQuality {
  const MovieQuality._(this._quality);

  final String _quality;

  static const MovieQuality standardDefinition = MovieQuality._('720p');
  static const MovieQuality highDefinition = MovieQuality._('1080p');
  static const MovieQuality threeDimension = MovieQuality._('3D');

  static const List<MovieQuality> values = <MovieQuality>[
    standardDefinition,
    highDefinition,
    threeDimension,
  ];

  static Serializer<MovieQuality> get serializer => _$movieQualitySerializer;

  @override
  String toString() => '$_quality';
}

MovieQualitySerializer _$movieQualitySerializer = MovieQualitySerializer();

class MovieQualitySerializer implements PrimitiveSerializer<MovieQuality> {
  final bool structured = false;

  @override
  final Iterable<Type> types = BuiltList<Type>(<Type>[MovieQuality]);

  @override
  final String wireName = 'MovieQuality';

  @override
  Object serialize(Serializers serializers, MovieQuality object,
      {FullType specifiedType = FullType.unspecified}) {
    return object._quality;
  }

  @override
  MovieQuality deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return MovieQuality.values.firstWhere((MovieQuality it) => it._quality == serialized);
  }
}

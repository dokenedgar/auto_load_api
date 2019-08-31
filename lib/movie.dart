// File created by
// Lung Razvan <long1eu>
// on 31/08/2019

library movie;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'movie.g.dart';

abstract class Movie implements Built<Movie, MovieBuilder> {
  factory Movie([void updates(MovieBuilder b)]) = _$Movie;

  factory Movie.fromJson(Map<dynamic, dynamic> json) => serializers.deserializeWith(serializer, json);

  Movie._();

  String get title;

  @BuiltValueField(wireName: 'medium_cover_image')
  String get image;

  String get summary;

  @memoized
  Map<String, dynamic> get json => serializers.serializeWith(serializer, this);

  static Serializer<Movie> get serializer => _$movieSerializer;
}
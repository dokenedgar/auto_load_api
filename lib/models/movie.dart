// File created by
// Lung Razvan <long1eu>
// on 31/08/2019

library movie;

import 'package:auto_load_api/models/torrents.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'movie.g.dart';

abstract class Movie implements Built<Movie, MovieBuilder> {
  factory Movie([void updates(MovieBuilder b)]) = _$Movie;

  factory Movie.fromJson(Map<dynamic, dynamic> json) {
    return serializers.deserializeWith(serializer, json);
  }

  Movie._();

  String get title;

  @BuiltValueField(wireName: 'large_cover_image')
  String get image;

  String get summary;

  int get year;

  int get runtime;

  double get rating;

  String get language;

  @BuiltValueField(wireName: 'yt_trailer_code')
  String get trailerId;

  BuiltList<String> get genres;

  BuiltList<Torrent> get torrents;

  @memoized
  Map<String, dynamic> get json => serializers.serializeWith(serializer, this);

  static Serializer<Movie> get serializer => _$movieSerializer;
}

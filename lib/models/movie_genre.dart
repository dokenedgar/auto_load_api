//File created by mcedgar
//by 1:16 PM
//on 25/Nov/2019

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

class MovieGenre {
  const MovieGenre._(this._genre);

  final String _genre;

  static const MovieGenre action = MovieGenre._('action');
  static const MovieGenre adventure = MovieGenre._('adventure');
  static const MovieGenre animation = MovieGenre._('animation');
  static const MovieGenre biography = MovieGenre._('biography');
  static const MovieGenre comedy = MovieGenre._('comedy');
  static const MovieGenre crime = MovieGenre._('crime');
  static const MovieGenre documentary = MovieGenre._('documentary');
  static const MovieGenre drama = MovieGenre._('drama');
  static const MovieGenre family = MovieGenre._('family');
  static const MovieGenre fantasy = MovieGenre._('fantasy');
  static const MovieGenre filmNoir = MovieGenre._('film-noir');
  static const MovieGenre gameShow = MovieGenre._('game-show');
  static const MovieGenre history = MovieGenre._('history');
  static const MovieGenre horror = MovieGenre._('horror');
  static const MovieGenre music = MovieGenre._('music');
  static const MovieGenre musical = MovieGenre._('musical');
  static const MovieGenre mystery = MovieGenre._('mystery');
  static const MovieGenre news = MovieGenre._('news');
  static const MovieGenre realityTV = MovieGenre._('reality-tv');
  static const MovieGenre romance = MovieGenre._('romance');
  static const MovieGenre sciFi = MovieGenre._('sci-fi');
  static const MovieGenre sport = MovieGenre._('sport');
  static const MovieGenre talkShow = MovieGenre._('talk-show');
  static const MovieGenre thriller = MovieGenre._('thriller');
  static const MovieGenre war = MovieGenre._('war');
  static const MovieGenre western = MovieGenre._('western');

  static const List<MovieGenre> values = <MovieGenre>[
    action,
    adventure,
    animation,
    biography,
    comedy,
    crime,
    documentary,
    drama,
    family,
    fantasy,
    filmNoir,
    gameShow,
    history,
    horror,
    music,
    musical,
    mystery,
    news,
    realityTV,
    romance,
    sciFi,
    sport,
    talkShow,
    thriller,
    war,
    western
  ];

  String get filterCategory => 'genre';

  static Serializer<MovieGenre> get serializer => _$movieGenreSerializer;

  @override
  String toString() => '$_genre';
}

MovieGenreSerializer _$movieGenreSerializer = MovieGenreSerializer();

class MovieGenreSerializer implements PrimitiveSerializer<MovieGenre> {
  final bool structured = false;

  @override
  final Iterable<Type> types = BuiltList<Type>(<Type>[MovieGenre]);

  @override
  final String wireName = 'MovieGenre';

  @override
  Object serialize(Serializers serializers, MovieGenre object,
      {FullType specifiedType = FullType.unspecified}) {
    return object._genre;
  }

  @override
  MovieGenre deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return MovieGenre.values.firstWhere((MovieGenre it) => it._genre == serialized);
  }
}

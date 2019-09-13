// GENERATED CODE - DO NOT MODIFY BY HAND

part of movie;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Movie> _$movieSerializer = new _$MovieSerializer();

class _$MovieSerializer implements StructuredSerializer<Movie> {
  @override
  final Iterable<Type> types = const [Movie, _$Movie];
  @override
  final String wireName = 'Movie';

  @override
  Iterable<Object> serialize(Serializers serializers, Movie object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'medium_cover_image',
      serializers.serialize(object.image,
          specifiedType: const FullType(String)),
      'summary',
      serializers.serialize(object.summary,
          specifiedType: const FullType(String)),
      'year',
      serializers.serialize(object.year, specifiedType: const FullType(int)),
      'runtime',
      serializers.serialize(object.runtime, specifiedType: const FullType(int)),
      'rating',
      serializers.serialize(object.rating,
          specifiedType: const FullType(double)),
      'language',
      serializers.serialize(object.language,
          specifiedType: const FullType(String)),
      'yt_trailer_code',
      serializers.serialize(object.trailerId,
          specifiedType: const FullType(String)),
      'genres',
      serializers.serialize(object.genres,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'torrents',
      serializers.serialize(object.torrents,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Torrent)])),
    ];

    return result;
  }

  @override
  Movie deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MovieBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'medium_cover_image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'summary':
          result.summary = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'year':
          result.year = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'runtime':
          result.runtime = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'language':
          result.language = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'yt_trailer_code':
          result.trailerId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'genres':
          result.genres.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<dynamic>);
          break;
        case 'torrents':
          result.torrents.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Torrent)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$Movie extends Movie {
  @override
  final String title;
  @override
  final String image;
  @override
  final String summary;
  @override
  final int year;
  @override
  final int runtime;
  @override
  final double rating;
  @override
  final String language;
  @override
  final String trailerId;
  @override
  final BuiltList<String> genres;
  @override
  final BuiltList<Torrent> torrents;
  Map<String, dynamic> __json;

  factory _$Movie([void Function(MovieBuilder) updates]) =>
      (new MovieBuilder()..update(updates)).build();

  _$Movie._(
      {this.title,
      this.image,
      this.summary,
      this.year,
      this.runtime,
      this.rating,
      this.language,
      this.trailerId,
      this.genres,
      this.torrents})
      : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('Movie', 'title');
    }
    if (image == null) {
      throw new BuiltValueNullFieldError('Movie', 'image');
    }
    if (summary == null) {
      throw new BuiltValueNullFieldError('Movie', 'summary');
    }
    if (year == null) {
      throw new BuiltValueNullFieldError('Movie', 'year');
    }
    if (runtime == null) {
      throw new BuiltValueNullFieldError('Movie', 'runtime');
    }
    if (rating == null) {
      throw new BuiltValueNullFieldError('Movie', 'rating');
    }
    if (language == null) {
      throw new BuiltValueNullFieldError('Movie', 'language');
    }
    if (trailerId == null) {
      throw new BuiltValueNullFieldError('Movie', 'trailerId');
    }
    if (genres == null) {
      throw new BuiltValueNullFieldError('Movie', 'genres');
    }
    if (torrents == null) {
      throw new BuiltValueNullFieldError('Movie', 'torrents');
    }
  }

  @override
  Map<String, dynamic> get json => __json ??= super.json;

  @override
  Movie rebuild(void Function(MovieBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MovieBuilder toBuilder() => new MovieBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Movie &&
        title == other.title &&
        image == other.image &&
        summary == other.summary &&
        year == other.year &&
        runtime == other.runtime &&
        rating == other.rating &&
        language == other.language &&
        trailerId == other.trailerId &&
        genres == other.genres &&
        torrents == other.torrents;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc($jc(0, title.hashCode), image.hashCode),
                                    summary.hashCode),
                                year.hashCode),
                            runtime.hashCode),
                        rating.hashCode),
                    language.hashCode),
                trailerId.hashCode),
            genres.hashCode),
        torrents.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Movie')
          ..add('title', title)
          ..add('image', image)
          ..add('summary', summary)
          ..add('year', year)
          ..add('runtime', runtime)
          ..add('rating', rating)
          ..add('language', language)
          ..add('trailerId', trailerId)
          ..add('genres', genres)
          ..add('torrents', torrents))
        .toString();
  }
}

class MovieBuilder implements Builder<Movie, MovieBuilder> {
  _$Movie _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _image;
  String get image => _$this._image;
  set image(String image) => _$this._image = image;

  String _summary;
  String get summary => _$this._summary;
  set summary(String summary) => _$this._summary = summary;

  int _year;
  int get year => _$this._year;
  set year(int year) => _$this._year = year;

  int _runtime;
  int get runtime => _$this._runtime;
  set runtime(int runtime) => _$this._runtime = runtime;

  double _rating;
  double get rating => _$this._rating;
  set rating(double rating) => _$this._rating = rating;

  String _language;
  String get language => _$this._language;
  set language(String language) => _$this._language = language;

  String _trailerId;
  String get trailerId => _$this._trailerId;
  set trailerId(String trailerId) => _$this._trailerId = trailerId;

  ListBuilder<String> _genres;
  ListBuilder<String> get genres =>
      _$this._genres ??= new ListBuilder<String>();
  set genres(ListBuilder<String> genres) => _$this._genres = genres;

  ListBuilder<Torrent> _torrents;
  ListBuilder<Torrent> get torrents =>
      _$this._torrents ??= new ListBuilder<Torrent>();
  set torrents(ListBuilder<Torrent> torrents) => _$this._torrents = torrents;

  MovieBuilder();

  MovieBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _image = _$v.image;
      _summary = _$v.summary;
      _year = _$v.year;
      _runtime = _$v.runtime;
      _rating = _$v.rating;
      _language = _$v.language;
      _trailerId = _$v.trailerId;
      _genres = _$v.genres?.toBuilder();
      _torrents = _$v.torrents?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Movie other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Movie;
  }

  @override
  void update(void Function(MovieBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Movie build() {
    _$Movie _$result;
    try {
      _$result = _$v ??
          new _$Movie._(
              title: title,
              image: image,
              summary: summary,
              year: year,
              runtime: runtime,
              rating: rating,
              language: language,
              trailerId: trailerId,
              genres: genres.build(),
              torrents: torrents.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'genres';
        genres.build();
        _$failedField = 'torrents';
        torrents.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Movie', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

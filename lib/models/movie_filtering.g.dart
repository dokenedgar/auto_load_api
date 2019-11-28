// GENERATED CODE - DO NOT MODIFY BY HAND

part of movie_filtering;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FilterOptions extends FilterOptions {
  @override
  final BuiltList<MovieSortBy> sortByOptions;
  @override
  final MovieSortBy sortBy;
  @override
  final BuiltList<MovieFilterByRating> ratingsOptions;
  @override
  final MovieFilterByRating minimumRating;
  @override
  final BuiltList<MovieGenre> genreOptions;
  @override
  final MovieGenre genre;
  @override
  final BuiltList<MovieQuality> qualityOptions;
  @override
  final MovieQuality quality;
  @override
  final BuiltMap<String, MovieFilterByRating> minRatings;
  @override
  final int pageNumber;

  factory _$FilterOptions([void Function(FilterOptionsBuilder) updates]) =>
      (new FilterOptionsBuilder()..update(updates)).build();

  _$FilterOptions._(
      {this.sortByOptions,
      this.sortBy,
      this.ratingsOptions,
      this.minimumRating,
      this.genreOptions,
      this.genre,
      this.qualityOptions,
      this.quality,
      this.minRatings,
      this.pageNumber})
      : super._() {
    if (sortByOptions == null) {
      throw new BuiltValueNullFieldError('FilterOptions', 'sortByOptions');
    }
    if (ratingsOptions == null) {
      throw new BuiltValueNullFieldError('FilterOptions', 'ratingsOptions');
    }
    if (genreOptions == null) {
      throw new BuiltValueNullFieldError('FilterOptions', 'genreOptions');
    }
    if (qualityOptions == null) {
      throw new BuiltValueNullFieldError('FilterOptions', 'qualityOptions');
    }
    if (pageNumber == null) {
      throw new BuiltValueNullFieldError('FilterOptions', 'pageNumber');
    }
  }

  @override
  FilterOptions rebuild(void Function(FilterOptionsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilterOptionsBuilder toBuilder() => new FilterOptionsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilterOptions &&
        sortByOptions == other.sortByOptions &&
        sortBy == other.sortBy &&
        ratingsOptions == other.ratingsOptions &&
        minimumRating == other.minimumRating &&
        genreOptions == other.genreOptions &&
        genre == other.genre &&
        qualityOptions == other.qualityOptions &&
        quality == other.quality &&
        minRatings == other.minRatings &&
        pageNumber == other.pageNumber;
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
                                $jc(
                                    $jc($jc(0, sortByOptions.hashCode),
                                        sortBy.hashCode),
                                    ratingsOptions.hashCode),
                                minimumRating.hashCode),
                            genreOptions.hashCode),
                        genre.hashCode),
                    qualityOptions.hashCode),
                quality.hashCode),
            minRatings.hashCode),
        pageNumber.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FilterOptions')
          ..add('sortByOptions', sortByOptions)
          ..add('sortBy', sortBy)
          ..add('ratingsOptions', ratingsOptions)
          ..add('minimumRating', minimumRating)
          ..add('genreOptions', genreOptions)
          ..add('genre', genre)
          ..add('qualityOptions', qualityOptions)
          ..add('quality', quality)
          ..add('minRatings', minRatings)
          ..add('pageNumber', pageNumber))
        .toString();
  }
}

class FilterOptionsBuilder
    implements Builder<FilterOptions, FilterOptionsBuilder> {
  _$FilterOptions _$v;

  ListBuilder<MovieSortBy> _sortByOptions;
  ListBuilder<MovieSortBy> get sortByOptions =>
      _$this._sortByOptions ??= new ListBuilder<MovieSortBy>();
  set sortByOptions(ListBuilder<MovieSortBy> sortByOptions) =>
      _$this._sortByOptions = sortByOptions;

  MovieSortBy _sortBy;
  MovieSortBy get sortBy => _$this._sortBy;
  set sortBy(MovieSortBy sortBy) => _$this._sortBy = sortBy;

  ListBuilder<MovieFilterByRating> _ratingsOptions;
  ListBuilder<MovieFilterByRating> get ratingsOptions =>
      _$this._ratingsOptions ??= new ListBuilder<MovieFilterByRating>();
  set ratingsOptions(ListBuilder<MovieFilterByRating> ratingsOptions) =>
      _$this._ratingsOptions = ratingsOptions;

  MovieFilterByRating _minimumRating;
  MovieFilterByRating get minimumRating => _$this._minimumRating;
  set minimumRating(MovieFilterByRating minimumRating) =>
      _$this._minimumRating = minimumRating;

  ListBuilder<MovieGenre> _genreOptions;
  ListBuilder<MovieGenre> get genreOptions =>
      _$this._genreOptions ??= new ListBuilder<MovieGenre>();
  set genreOptions(ListBuilder<MovieGenre> genreOptions) =>
      _$this._genreOptions = genreOptions;

  MovieGenre _genre;
  MovieGenre get genre => _$this._genre;
  set genre(MovieGenre genre) => _$this._genre = genre;

  ListBuilder<MovieQuality> _qualityOptions;
  ListBuilder<MovieQuality> get qualityOptions =>
      _$this._qualityOptions ??= new ListBuilder<MovieQuality>();
  set qualityOptions(ListBuilder<MovieQuality> qualityOptions) =>
      _$this._qualityOptions = qualityOptions;

  MovieQuality _quality;
  MovieQuality get quality => _$this._quality;
  set quality(MovieQuality quality) => _$this._quality = quality;

  MapBuilder<String, MovieFilterByRating> _minRatings;
  MapBuilder<String, MovieFilterByRating> get minRatings =>
      _$this._minRatings ??= new MapBuilder<String, MovieFilterByRating>();
  set minRatings(MapBuilder<String, MovieFilterByRating> minRatings) =>
      _$this._minRatings = minRatings;

  int _pageNumber;
  int get pageNumber => _$this._pageNumber;
  set pageNumber(int pageNumber) => _$this._pageNumber = pageNumber;

  FilterOptionsBuilder();

  FilterOptionsBuilder get _$this {
    if (_$v != null) {
      _sortByOptions = _$v.sortByOptions?.toBuilder();
      _sortBy = _$v.sortBy;
      _ratingsOptions = _$v.ratingsOptions?.toBuilder();
      _minimumRating = _$v.minimumRating;
      _genreOptions = _$v.genreOptions?.toBuilder();
      _genre = _$v.genre;
      _qualityOptions = _$v.qualityOptions?.toBuilder();
      _quality = _$v.quality;
      _minRatings = _$v.minRatings?.toBuilder();
      _pageNumber = _$v.pageNumber;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FilterOptions other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FilterOptions;
  }

  @override
  void update(void Function(FilterOptionsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FilterOptions build() {
    _$FilterOptions _$result;
    try {
      _$result = _$v ??
          new _$FilterOptions._(
              sortByOptions: sortByOptions.build(),
              sortBy: sortBy,
              ratingsOptions: ratingsOptions.build(),
              minimumRating: minimumRating,
              genreOptions: genreOptions.build(),
              genre: genre,
              qualityOptions: qualityOptions.build(),
              quality: quality,
              minRatings: _minRatings?.build(),
              pageNumber: pageNumber);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'sortByOptions';
        sortByOptions.build();

        _$failedField = 'ratingsOptions';
        ratingsOptions.build();

        _$failedField = 'genreOptions';
        genreOptions.build();

        _$failedField = 'qualityOptions';
        qualityOptions.build();

        _$failedField = 'minRatings';
        _minRatings?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'FilterOptions', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

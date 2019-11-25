// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppState extends AppState {
  @override
  final BuiltList<Movie> films;
  @override
  final Movie selectedMovie;
  @override
  final int pageNumber;
  @override
  final String genre;
  @override
  final String quality;
  @override
  final String sortBy;
  @override
  final int minimumRating;
  @override
  final FilterOptions filterOptions;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.films,
      this.selectedMovie,
      this.pageNumber,
      this.genre,
      this.quality,
      this.sortBy,
      this.minimumRating,
      this.filterOptions})
      : super._() {
    if (films == null) {
      throw new BuiltValueNullFieldError('AppState', 'films');
    }
    if (pageNumber == null) {
      throw new BuiltValueNullFieldError('AppState', 'pageNumber');
    }
    if (genre == null) {
      throw new BuiltValueNullFieldError('AppState', 'genre');
    }
    if (quality == null) {
      throw new BuiltValueNullFieldError('AppState', 'quality');
    }
    if (sortBy == null) {
      throw new BuiltValueNullFieldError('AppState', 'sortBy');
    }
    if (minimumRating == null) {
      throw new BuiltValueNullFieldError('AppState', 'minimumRating');
    }
    if (filterOptions == null) {
      throw new BuiltValueNullFieldError('AppState', 'filterOptions');
    }
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        films == other.films &&
        selectedMovie == other.selectedMovie &&
        pageNumber == other.pageNumber &&
        genre == other.genre &&
        quality == other.quality &&
        sortBy == other.sortBy &&
        minimumRating == other.minimumRating &&
        filterOptions == other.filterOptions;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, films.hashCode), selectedMovie.hashCode),
                            pageNumber.hashCode),
                        genre.hashCode),
                    quality.hashCode),
                sortBy.hashCode),
            minimumRating.hashCode),
        filterOptions.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('films', films)
          ..add('selectedMovie', selectedMovie)
          ..add('pageNumber', pageNumber)
          ..add('genre', genre)
          ..add('quality', quality)
          ..add('sortBy', sortBy)
          ..add('minimumRating', minimumRating)
          ..add('filterOptions', filterOptions))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  ListBuilder<Movie> _films;
  ListBuilder<Movie> get films => _$this._films ??= new ListBuilder<Movie>();
  set films(ListBuilder<Movie> films) => _$this._films = films;

  MovieBuilder _selectedMovie;
  MovieBuilder get selectedMovie =>
      _$this._selectedMovie ??= new MovieBuilder();
  set selectedMovie(MovieBuilder selectedMovie) =>
      _$this._selectedMovie = selectedMovie;

  int _pageNumber;
  int get pageNumber => _$this._pageNumber;
  set pageNumber(int pageNumber) => _$this._pageNumber = pageNumber;

  String _genre;
  String get genre => _$this._genre;
  set genre(String genre) => _$this._genre = genre;

  String _quality;
  String get quality => _$this._quality;
  set quality(String quality) => _$this._quality = quality;

  String _sortBy;
  String get sortBy => _$this._sortBy;
  set sortBy(String sortBy) => _$this._sortBy = sortBy;

  int _minimumRating;
  int get minimumRating => _$this._minimumRating;
  set minimumRating(int minimumRating) => _$this._minimumRating = minimumRating;

  FilterOptionsBuilder _filterOptions;
  FilterOptionsBuilder get filterOptions =>
      _$this._filterOptions ??= new FilterOptionsBuilder();
  set filterOptions(FilterOptionsBuilder filterOptions) =>
      _$this._filterOptions = filterOptions;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _films = _$v.films?.toBuilder();
      _selectedMovie = _$v.selectedMovie?.toBuilder();
      _pageNumber = _$v.pageNumber;
      _genre = _$v.genre;
      _quality = _$v.quality;
      _sortBy = _$v.sortBy;
      _minimumRating = _$v.minimumRating;
      _filterOptions = _$v.filterOptions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              films: films.build(),
              selectedMovie: _selectedMovie?.build(),
              pageNumber: pageNumber,
              genre: genre,
              quality: quality,
              sortBy: sortBy,
              minimumRating: minimumRating,
              filterOptions: filterOptions.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'films';
        films.build();
        _$failedField = 'selectedMovie';
        _selectedMovie?.build();

        _$failedField = 'filterOptions';
        filterOptions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

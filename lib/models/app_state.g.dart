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
  final FilterOptions filterOptions;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.films, this.selectedMovie, this.pageNumber, this.filterOptions})
      : super._() {
    if (films == null) {
      throw new BuiltValueNullFieldError('AppState', 'films');
    }
    if (pageNumber == null) {
      throw new BuiltValueNullFieldError('AppState', 'pageNumber');
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
        filterOptions == other.filterOptions;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, films.hashCode), selectedMovie.hashCode),
            pageNumber.hashCode),
        filterOptions.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('films', films)
          ..add('selectedMovie', selectedMovie)
          ..add('pageNumber', pageNumber)
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

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
  final MovieFilterByRating minimum_rating;

  factory _$FilterOptions([void Function(FilterOptionsBuilder) updates]) =>
      (new FilterOptionsBuilder()..update(updates)).build();

  _$FilterOptions._(
      {this.sortByOptions,
      this.sortBy,
      this.ratingsOptions,
      this.minimum_rating})
      : super._() {
    if (sortByOptions == null) {
      throw new BuiltValueNullFieldError('FilterOptions', 'sortByOptions');
    }
    if (ratingsOptions == null) {
      throw new BuiltValueNullFieldError('FilterOptions', 'ratingsOptions');
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
        minimum_rating == other.minimum_rating;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, sortByOptions.hashCode), sortBy.hashCode),
            ratingsOptions.hashCode),
        minimum_rating.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FilterOptions')
          ..add('sortByOptions', sortByOptions)
          ..add('sortBy', sortBy)
          ..add('ratingsOptions', ratingsOptions)
          ..add('minimum_rating', minimum_rating))
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

  MovieFilterByRating _minimum_rating;
  MovieFilterByRating get minimum_rating => _$this._minimum_rating;
  set minimum_rating(MovieFilterByRating minimum_rating) =>
      _$this._minimum_rating = minimum_rating;

  FilterOptionsBuilder();

  FilterOptionsBuilder get _$this {
    if (_$v != null) {
      _sortByOptions = _$v.sortByOptions?.toBuilder();
      _sortBy = _$v.sortBy;
      _ratingsOptions = _$v.ratingsOptions?.toBuilder();
      _minimum_rating = _$v.minimum_rating;
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
              minimum_rating: minimum_rating);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'sortByOptions';
        sortByOptions.build();

        _$failedField = 'ratingsOptions';
        ratingsOptions.build();
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

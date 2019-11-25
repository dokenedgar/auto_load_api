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

  factory _$FilterOptions([void Function(FilterOptionsBuilder) updates]) =>
      (new FilterOptionsBuilder()..update(updates)).build();

  _$FilterOptions._({this.sortByOptions, this.sortBy}) : super._() {
    if (sortByOptions == null) {
      throw new BuiltValueNullFieldError('FilterOptions', 'sortByOptions');
    }
    if (sortBy == null) {
      throw new BuiltValueNullFieldError('FilterOptions', 'sortBy');
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
        sortBy == other.sortBy;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, sortByOptions.hashCode), sortBy.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FilterOptions')
          ..add('sortByOptions', sortByOptions)
          ..add('sortBy', sortBy))
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

  FilterOptionsBuilder();

  FilterOptionsBuilder get _$this {
    if (_$v != null) {
      _sortByOptions = _$v.sortByOptions?.toBuilder();
      _sortBy = _$v.sortBy;
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
              sortByOptions: sortByOptions.build(), sortBy: sortBy);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'sortByOptions';
        sortByOptions.build();
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

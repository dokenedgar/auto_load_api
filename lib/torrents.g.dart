// GENERATED CODE - DO NOT MODIFY BY HAND

part of torrents;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Torrent> _$torrentSerializer = new _$TorrentSerializer();

class _$TorrentSerializer implements StructuredSerializer<Torrent> {
  @override
  final Iterable<Type> types = const [Torrent, _$Torrent];
  @override
  final String wireName = 'Torrent';

  @override
  Iterable<Object> serialize(Serializers serializers, Torrent object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'size',
      serializers.serialize(object.size, specifiedType: const FullType(String)),
      'quality',
      serializers.serialize(object.quality,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Torrent deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TorrentBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'size':
          result.size = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'quality':
          result.quality = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Torrent extends Torrent {
  @override
  final String url;
  @override
  final String size;
  @override
  final String quality;
  Map<String, dynamic> __json;

  factory _$Torrent([void Function(TorrentBuilder) updates]) =>
      (new TorrentBuilder()..update(updates)).build();

  _$Torrent._({this.url, this.size, this.quality}) : super._() {
    if (url == null) {
      throw new BuiltValueNullFieldError('Torrent', 'url');
    }
    if (size == null) {
      throw new BuiltValueNullFieldError('Torrent', 'size');
    }
    if (quality == null) {
      throw new BuiltValueNullFieldError('Torrent', 'quality');
    }
  }

  @override
  Map<String, dynamic> get json => __json ??= super.json;

  @override
  Torrent rebuild(void Function(TorrentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TorrentBuilder toBuilder() => new TorrentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Torrent &&
        url == other.url &&
        size == other.size &&
        quality == other.quality;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, url.hashCode), size.hashCode), quality.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Torrent')
          ..add('url', url)
          ..add('size', size)
          ..add('quality', quality))
        .toString();
  }
}

class TorrentBuilder implements Builder<Torrent, TorrentBuilder> {
  _$Torrent _$v;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  String _size;
  String get size => _$this._size;
  set size(String size) => _$this._size = size;

  String _quality;
  String get quality => _$this._quality;
  set quality(String quality) => _$this._quality = quality;

  TorrentBuilder();

  TorrentBuilder get _$this {
    if (_$v != null) {
      _url = _$v.url;
      _size = _$v.size;
      _quality = _$v.quality;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Torrent other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Torrent;
  }

  @override
  void update(void Function(TorrentBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Torrent build() {
    final _$result =
        _$v ?? new _$Torrent._(url: url, size: size, quality: quality);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

library torrents;

import 'package:auto_load_api/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'torrents.g.dart';

abstract class Torrent implements Built<Torrent, TorrentBuilder> {
  factory Torrent([void updates(TorrentBuilder b)]) = _$Torrent;
  factory Torrent.fromJson(Map<dynamic, dynamic> json) =>
      serializers.deserializeWith(serializer, json);

  Torrent._();

  String get url;

  String get size;

  String get quality;

  @memoized
  Map<String, dynamic> get json => serializers.serializeWith(serializer, this);

  static Serializer<Torrent> get serializer => _$torrentSerializer;
}

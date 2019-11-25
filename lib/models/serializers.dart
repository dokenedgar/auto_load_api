// File created by
// Lung Razvan <long1eu>
// on 31/08/2019
library serializers;

import 'package:auto_load_api/models/movie.dart';
import 'package:auto_load_api/models/movie_filter_by_ratings.dart';
import 'package:auto_load_api/models/movie_sort_by.dart';
import 'package:auto_load_api/models/torrents.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

part 'serializers.g.dart';

@SerializersFor(<Type>[
  Movie,
  Torrent,
])
Serializers serializers = (_$serializers.toBuilder() //
      ..add(MovieSortBy.serializer)
      ..add(MovieFilterByRating.serializer)
      ..addPlugin(StandardJsonPlugin()) //
    )
    .build();

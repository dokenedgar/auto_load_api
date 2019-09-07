import 'package:auto_load_api/main.dart';
import 'package:auto_load_api/movieDetail.dart';
import 'package:auto_load_api/route_constants.dart';
import 'package:flutter/material.dart';

import 'movie.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute:
      return MaterialPageRoute(builder: (BuildContext context) => ApiList());

    case MovieDetailRoute:
      final Movie movie = settings.arguments;
      return MaterialPageRoute(
          builder: (BuildContext context) => MovieDetail(
                movie: movie,
              ));

    default:
      return MaterialPageRoute(builder: (BuildContext context) => ApiList());
  }
}

import 'package:auto_load_api/main.dart';
import 'package:auto_load_api/movie_detail.dart';
import 'package:auto_load_api/route_constants.dart';
import 'package:flutter/material.dart';

import 'movie.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.homeRoute:
      return MaterialPageRoute<void>(
          builder: (BuildContext context) => ApiList());

    case AppRoutes.movieDetailRoute:
      final Movie movie = settings.arguments;
      return MaterialPageRoute<void>(
          builder: (BuildContext context) => MovieDetail(
                movie: movie,
              ));

    default:
      return MaterialPageRoute<void>(
          builder: (BuildContext context) => ApiList());
  }
}

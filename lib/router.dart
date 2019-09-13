import 'package:auto_load_api/main.dart';
import 'package:auto_load_api/movie_detail.dart';
import 'package:auto_load_api/movie_trailer.dart';
import 'package:auto_load_api/route_constants.dart';
import 'package:flutter/material.dart';

import 'movie.dart';

Route<void> generateRoute(RouteSettings settings) {
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

    case AppRoutes.movieTrailer:
      final String trailerID = settings.arguments;
      return MaterialPageRoute<void>(
          builder: (BuildContext context) => MovieTrailer(
                trailerId: trailerID,
              ));
    default:
      return MaterialPageRoute<void>(
          builder: (BuildContext context) => ApiList());
  }
}

import 'package:auto_load_api/presentation/load_initial_movies.dart';
import 'package:auto_load_api/presentation/movie_detail.dart';
import 'package:auto_load_api/presentation/movie_trailer.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String homeRoute = '/';
  static const String movieDetailRoute = '/movieDetail';
  static const String movieTrailer = '/movieTrailer';
}

Route<void> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.homeRoute:
      return MaterialPageRoute<void>(
          builder: (BuildContext context) => ApiList());

    case AppRoutes.movieDetailRoute:
      return MaterialPageRoute<void>(
        builder: (BuildContext context) => const MovieDetail(),
      );

    case AppRoutes.movieTrailer:
      return MaterialPageRoute<void>(
        builder: (BuildContext context) => const MovieTrailer(),
      );

    default:
      return MaterialPageRoute<void>(
          builder: (BuildContext context) => ApiList());
  }
}

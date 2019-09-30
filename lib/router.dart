import 'package:auto_load_api/main.dart';
import 'package:auto_load_api/presentation/movie_detail.dart';
import 'package:auto_load_api/presentation/movie_trailer.dart';
import 'package:auto_load_api/route_constants.dart';
import 'package:flutter/material.dart';

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

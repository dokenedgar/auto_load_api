import 'package:auto_load_api/movie.dart';
import 'package:flutter/material.dart';

class MovieDetail extends StatelessWidget {
  Movie movie;
  MovieDetail({Key key, @required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Detail'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[Text(movie.title), Text(movie.summary)],
        ),
      ),
    );
  }
}

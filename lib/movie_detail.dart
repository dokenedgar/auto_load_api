import 'package:auto_load_api/movie.dart';
import 'package:auto_load_api/route_constants.dart';
import 'package:flutter/material.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({Key key, @required this.movie}) : super(key: key);

  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(movie.title),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Image(
                      image: NetworkImage(movie.image),
                    ),
                    Text(
                      movie.title,
                      style: TextStyle(fontSize: 25.0),
                      textAlign: TextAlign.center,
                    ),
                    Wrap(
                      children: movie.genres
                          .map((String genre) => Chip(
                                backgroundColor: Colors.amber,
                                label: Text(genre),
                              ))
                          .toList(),
                    ),
                    Text('Language: ${movie.language}'),
                    Divider(
                      color: Colors.black,
                    ),
                    Container(
                      height: 30.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Year: ${movie.year}'),
                          VerticalDivider(
                            color: Colors.black,
                          ),
                          Text('Running Time: ${movie.runtime} mins'),
                          VerticalDivider(
                            color: Colors.black,
                          ),
                          Text('${movie.rating}/10'),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Text(
                      movie.summary,
                      style: TextStyle(fontSize: 15.0),
                    ),
                    (movie.trailerId.length > 3)
                        ? showTrailer(context, true)
                        : showTrailer(context, false),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget showTrailer(BuildContext context, bool hasTrailer) {
    if (hasTrailer) {
      return RaisedButton(
        onPressed: () => Navigator.pushNamed(
          context,
          AppRoutes.movieTrailer,
          arguments: movie.trailerId,
        ), //print(movie.yt_trailer_code),
        child: Text(
          'WATCH TRAILER',
          style: TextStyle(),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(20.0))),
      );
    }
    return Center(
      child: Text(
        'NO TRAILER AVAILABLE YET...',
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
    );
  }
}

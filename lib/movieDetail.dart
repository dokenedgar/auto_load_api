import 'package:auto_load_api/movie.dart';
import 'package:flutter/material.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({Key key, @required this.movie}) : super(key: key);

  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Movie Detail'),
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
                    Divider(
                      color: Colors.black,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(child: Text('Year: ${movie.year}')),
                        VerticalDivider(
                          color: Colors.black,
                        ),
                        Expanded(
                            flex: 2,
                            child: Text('Running Time: ${movie.runtime} mins')),
                        VerticalDivider(
                          color: Colors.black,
                        ),
                        Expanded(
                          child: Text('${movie.rating}/10'),
                        ),
                        VerticalDivider(
                          color: Colors.black,
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Text(
                      movie.summary,
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

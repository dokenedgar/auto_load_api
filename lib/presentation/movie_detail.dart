import 'package:auto_load_api/containers/movie_container.dart';
import 'package:auto_load_api/models/movie.dart';
import 'package:auto_load_api/models/torrents.dart';
import 'package:auto_load_api/presentation/widgets/hyper_link.dart';
import 'package:auto_load_api/route_constants.dart';
import 'package:flutter/material.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MovieContainer(
      builder: (BuildContext context, Movie movie) {
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
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
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
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    label: Text(
                                      genre,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
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
                        Column(
                          children: movie.torrents
                              .map((Torrent torrent) => ListTile(
                                    title: HyperLink(
                                      torrent.url,
                                      'Download Torrent for ${movie.title}',
                                    ),
                                    subtitle: Text(torrent.quality),
                                    trailing: Text(torrent.size),
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }

  Widget showTrailer(BuildContext context, bool hasTrailer) {
    if (hasTrailer) {
      return RaisedButton(
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        onPressed: () => Navigator.pushNamed(
          context,
          AppRoutes.movieTrailer,
        ),
        child: const Text(
          'WATCH TRAILER',
        ),
        shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(20.0))),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          'NO TRAILER AVAILABLE YET...',
          style: TextStyle(
            color: Theme.of(context).errorColor,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}

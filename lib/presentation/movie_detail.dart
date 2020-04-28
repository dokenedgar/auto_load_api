import 'package:auto_load_api/containers/movie_container.dart';
import 'package:auto_load_api/models/app_state.dart';
import 'package:auto_load_api/models/movie.dart';
import 'package:auto_load_api/models/torrents.dart';
import 'package:auto_load_api/presentation/widgets/hyper_link.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({Key key}) : super(key: key);

  Widget showTrailer(BuildContext context, bool hasTrailer) {
    if (hasTrailer) {
      return RaisedButton(
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        onPressed: () async {
          if (await Connectivity().checkConnectivity() != ConnectivityResult.none) {
           return playVideo(context, StoreProvider.of<AppState>(context).state.selectedMovie.trailerId);
          } else {
            return showDialog<Widget>(
              context: context,
              builder: (BuildContext context) {
                if (Theme.of(context).platform == TargetPlatform.android) {
                  return AlertDialog(
                    title: const Text('No Connection'),
                    content: const Text('Cannot play trailer. Check your network connection and try again'),
                    actions: <Widget>[
                      FlatButton(
                        child: const Text('Ok'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  );
                }
                return CupertinoAlertDialog(
                  title: const Text('No Connection'),
                  content: const Text('Cannot play trailer. Check your network connection and try again'),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: const Text('Ok'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                );
              },
            );
          }
        },
        child: const Text(
          'WATCH TRAILER',
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
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
  void playVideo(BuildContext context, String trailerID) {
    FlutterYoutube.playYoutubeVideoByUrl(
      apiKey: 'AIzaSyDw8qvZXYe5AGcp78oPkbrPHMnVCd1YYuA',
      videoUrl: 'https://www.youtube.com/watch?v=$trailerID',
      autoPlay: true,
      fullScreen: true,
    );
  }
  @override
  Widget build(BuildContext context) {
    return MovieContainer(
      builder: (BuildContext context, Movie movie) {
        return Scaffold(
            appBar: GradientAppBar(
              //celestial
              backgroundColorStart: const Color.fromRGBO(195, 55, 100, 1.0),
              backgroundColorEnd: const Color.fromRGBO(29, 38, 113, 1.0),
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
                          style: const TextStyle(fontSize: 25.0),
                          textAlign: TextAlign.center,
                        ),
                        Wrap(
                          children: movie.genres
                              .map((String genre) => Chip(
                                    backgroundColor: Theme.of(context).primaryColor,
                                    label: Text(
                                      genre,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                        Text('Language: ${movie.language}'),
                        const Divider(
                          color: Colors.black,
                        ),
                        Container(
                          height: 30.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Year: ${movie.year}'),
                              const VerticalDivider(
                                color: Colors.black,
                              ),
                              Text('Running Time: ${movie.runtime} mins'),
                              const VerticalDivider(
                                color: Colors.black,
                              ),
                              Text('${movie.rating}/10'),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.black,
                        ),
                        Text(
                          movie.summary,
                          style: const TextStyle(fontSize: 15.0),
                        ),
                        (movie.trailerId.length > 3) ? showTrailer(context, true) : showTrailer(context, false),
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
}

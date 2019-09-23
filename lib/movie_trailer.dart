import 'package:auto_load_api/models/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class MovieTrailer extends StatefulWidget {
  const MovieTrailer({Key key}) : super(key: key);

  @override
  _MovieTrailerState createState() => _MovieTrailerState();
}

class _MovieTrailerState extends State<MovieTrailer> {
  String trailerID;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    trailerID =
        StoreProvider.of<AppState>(context).state.selectedMovie.trailerId;
    playVideo();
  }

  void playVideo() {
    FlutterYoutube.playYoutubeVideoByUrl(
      apiKey: 'AIzaSyDw8qvZXYe5AGcp78oPkbrPHMnVCd1YYuA',
      videoUrl: 'https://www.youtube.com/watch?v=$trailerID',
      autoPlay: true,
      fullScreen: true,
    );
    FlutterYoutube().onVideoEnded.listen((dynamic onData) {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trailer'),
      ),
      body: Center(
        child: Text('TRAILER for $trailerID'),
      ),
    );
  }
}

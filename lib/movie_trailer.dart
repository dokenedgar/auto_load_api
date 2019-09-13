import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class MovieTrailer extends StatefulWidget {
  const MovieTrailer({Key key, @required this.trailerId}) : super(key: key);

  final String trailerId;

  @override
  _MovieTrailerState createState() => _MovieTrailerState();
}

class _MovieTrailerState extends State<MovieTrailer> {
  @override
  void initState() {
    super.initState();
    playVideo();
  }

  @override
  void reassemble() {}

  void playVideo() {
    FlutterYoutube.playYoutubeVideoByUrl(
      apiKey: 'AIzaSyDw8qvZXYe5AGcp78oPkbrPHMnVCd1YYuA',
      videoUrl: 'https://www.youtube.com/watch?v=${widget.trailerId}',
      autoPlay: true,
      fullScreen: true,
    );
    FlutterYoutube().onVideoEnded.listen((onData) {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trailer'),
      ),
      body: Center(
        child: Text('TRAILER for ${widget.trailerId}'),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(BaseWidget());

class BaseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ApiList(),
    );
  }
}

class ApiList extends StatefulWidget {
  @override
  _ApiListState createState() => _ApiListState();
}

class _ApiListState extends State<ApiList> {
  List<String> films = List<String>();
  final ScrollController _scrollController = ScrollController();
  int pageNumber = 1;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    fetch();
    _scrollController.addListener(
      () {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          // get more movie titles
          /* _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Row(
              children: const <Widget>[
                CircularProgressIndicator(),
                Text('  Loading...')
              ],
            ),
          ));
          */
          setState(() {
            pageNumber++;
          });
          print('get page $pageNumber');
          fetch();
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Get Data From An API'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: films.length,
        itemBuilder: (BuildContext context, int index) => ListTile(
          title:
              films.isEmpty ? const Text('Loading') : Text('${films[index]}'),
        ),
      ),
    );
  }

  Future<void> fetch() async {
    final response = await http.get(
        'https://yts.lt/api/v2/list_movies.json?page=$pageNumber&limit=50');
    if (response.statusCode == 200) {
      print('OK');
      final Map<String, dynamic> decodedData = json.decode(response.body);
      final List<dynamic> movies = decodedData['data']['movies'];
      // movies.forEach(( dynamic movie) => print(movie['title']));

      for (dynamic film in movies) {
        setState(
          () {
            films.add(film['title']);
          },
        );
      }
    } else {
      print('NOT OKAY');
    }
    return;
  }
}

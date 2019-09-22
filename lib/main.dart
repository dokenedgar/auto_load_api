import 'dart:convert';

import 'package:auto_load_api/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'movie.dart';
import 'router.dart' as router;

// todo dive deep into async/await

void main() => runApp(BaseWidget());

class BaseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: ApiList(),
      onGenerateRoute: router.generateRoute,
      initialRoute: AppRoutes.homeRoute,
    );
  }
}

class ApiList extends StatefulWidget {
  @override
  _ApiListState createState() => _ApiListState();
}

class _ApiListState extends State<ApiList> {
  List<Movie> films = <Movie>[];

  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int pageNumber = 1;
  bool isLoading = true;
  bool error = false;

  @override
  void initState() {
    super.initState();

    fetch();
    _scrollController.addListener(_onScrollChanged);
  }

  void _onScrollChanged() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        pageNumber++;
        isLoading = true;
      });
      print('get page $pageNumber');

      WidgetsBinding.instance.scheduleFrameCallback((_) => _scrollController
          .animateTo(_scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.bounceInOut));

      fetch();
    }
  }

  Future<void> fetch() async {
    final Response response = await get(
        'https://yts.lt/api/v2/list_movies.json?page=$pageNumber&limit=50');

    try {
      if (response.statusCode == 200) {
        print('OK');
        final Map<String, dynamic> decodedData = json.decode(response.body);
        final List<Map<String, dynamic>> movies =
            List<Map<String, dynamic>>.from(decodedData['data']['movies']);

        setState(() {
          for (Map<String, dynamic> film in movies) {
            final Movie movie = Movie.fromJson(film);
            films.add(movie);
            //print(film);
          }
        });
      } else {
        setState(() => error = true);
      }
    } catch (e) {
      setState(() => error = true);
    }

    if (mounted) {
      setState(() => isLoading = false);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    const int itemHeight = 420;
    final double itemWidth = screenSize.width / 2;
    final double itemAspectRatio = itemWidth / itemHeight;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Get Data From An API'),
        actions: <Widget>[
          if (error)
            IconButton(
              icon: Icon(
                Icons.error_outline,
                color: Colors.red,
              ),
              onPressed: () {
                setState(() {
                  error = false;
                  isLoading = true;
                });
                fetch();
              },
            ),
        ],
      ),
      body: GridView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.all(4.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: itemAspectRatio,
        ),
        itemCount: films.length,
        itemBuilder: (BuildContext context, int index) {
          final Movie film = films[index];

          //print(film.image);
          return InkWell(
            onTap: () => Navigator.pushNamed(
              context,
              AppRoutes.movieDetailRoute,
              arguments: film,
            ),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    height: itemWidth * (3 / 2),
                    alignment: AlignmentDirectional.topCenter,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadiusDirectional.only(
                        topStart: Radius.circular(4.0),
                        topEnd: Radius.circular(4.0),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: NetworkImage(
                          film.image.isEmpty
                              ? 'http://via.placeholder.com/300'
                              : film.image,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      margin: const EdgeInsetsDirectional.only(top: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            film.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Wrap(
                            alignment: WrapAlignment.center,
                            children: List<Widget>.generate(
                              film.genres.length,
                              (int i) {
                                return Text(
                                    '${film.genres[i]}${i == film.genres.length - 1 ? '' : ', '}');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              elevation: 2.0,
              margin: const EdgeInsets.all(5.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        },
      ),
    );
  }
}

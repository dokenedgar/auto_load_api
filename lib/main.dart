import 'package:auto_load_api/actions/movies_action.dart';
import 'package:auto_load_api/containers/movies_container.dart';
import 'package:auto_load_api/data/yts_api.dart';
import 'package:auto_load_api/middleware/app_middleware.dart';
import 'package:auto_load_api/models/app_state.dart';
import 'package:auto_load_api/reducers/movie_reducer.dart';
import 'package:auto_load_api/route_constants.dart';
import 'package:auto_load_api/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'movie.dart';
import 'router.dart' as router;

void main() {
  final HttpService ytsHttpService = HttpService('https://yts.lt/api/v2');
  final YtsMovieApi ytsMovieApi = YtsMovieApi(ytsHttpService);
  final AppMiddleware middleware = AppMiddleware(ytsMovieApi);
  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: AppState.initialState(),
    middleware: middleware.items,
  );
  runApp(BaseWidget(store: store));
}

class BaseWidget extends StatelessWidget {
  const BaseWidget({Key key, this.store}) : super(key: key);
  final Store<AppState> store;
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: router.generateRoute,
        initialRoute: AppRoutes.homeRoute,
      ),
    );
  }
}

class ApiList extends StatefulWidget {
  @override
  _ApiListState createState() => _ApiListState();
}

class _ApiListState extends State<ApiList> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = true;
  bool error = false;

  @override
  void initState() {
    super.initState();
    //fetch();
    _scrollController.addListener(_onScrollChanged);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    StoreProvider.of<AppState>(context).dispatch(LoadMovies());
  }

  void _onScrollChanged() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        isLoading = true;
      });

      WidgetsBinding.instance.scheduleFrameCallback((_) => _scrollController
          .animateTo(_scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.bounceInOut));
      print(
          'Loading Page => ${StoreProvider.of<AppState>(context).state.pageNumber}');
      StoreProvider.of<AppState>(context).dispatch(LoadMovies());
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

    return MoviesContainer(builder: (BuildContext context, List<Movie> films) {
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
                  //fetch();
                },
              ),
          ],
        ),
        body: films.isEmpty
            ? Center(
                child: const CircularProgressIndicator(),
              )
            : GridView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(4.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: itemAspectRatio,
                ),
                itemCount: films.length,
                itemBuilder: (BuildContext context, int index) {
                  final Movie film = films[index];
                  return InkWell(
                    onTap: () {
                      StoreProvider.of<AppState>(context)
                          .dispatch(SelectedMovie(film));
                      return Navigator.pushNamed(
                        context,
                        AppRoutes.movieDetailRoute,
                      );
                    },
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
                              margin:
                                  const EdgeInsetsDirectional.only(top: 16.0),
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
    });
  }
}

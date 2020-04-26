//File created by mcedgar
//by 12:35 AM
//on 30/Oct/2019

import 'dart:async';

import 'package:auto_load_api/actions/movies_action.dart';
import 'package:auto_load_api/containers/movies_container.dart';
import 'package:auto_load_api/main.dart';
import 'package:auto_load_api/models/app_state.dart';
import 'package:auto_load_api/models/movie.dart';
import 'package:auto_load_api/presentation/filter_page.dart';
import 'package:auto_load_api/presentation/movie_search.dart';
import 'package:auto_load_api/presentation/query_search_delegate.dart';
import 'package:auto_load_api/presentation/widgets/gridview_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide showSearch, SearchDelegate;
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:connectivity/connectivity.dart';

class ApiList extends StatefulWidget {
  @override
  _ApiListState createState() => _ApiListState();
}

class _ApiListState extends State<ApiList> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  StreamSubscription<ConnectivityResult> connectivitySubscription;
  bool isLoading = true;
  bool error = false;
  bool searchedResults = false;
  bool networkConnectivity = false;
  bool initialLoadMovies = true;

  @override
  void initState() {
    super.initState();
    connectivitySubscription = Connectivity().onConnectivityChanged.listen(connectivityListener);
    _scrollController.addListener(_onScrollChanged);
  }

  void connectivityListener(ConnectivityResult result){
    if(result != ConnectivityResult.none){
      setState(() {
        networkConnectivity = true;
      });
      if(initialLoadMovies) {
        setState(() {
          initialLoadMovies = false;
        });
        StoreProvider.of<AppState>(context).dispatch(LoadMovies());
      }
    }
    else{
      setState(() {
        networkConnectivity = false;
      });
    }
  }


  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();

    if (StoreProvider.of<AppState>(context).state.filterOptions.getFilterParams().isEmpty) {
      if (isLoading && await getConnectivityStatus()) {
        StoreProvider.of<AppState>(context).dispatch(LoadMovies());
        setState(() {
          initialLoadMovies = false;
        });
      } else if (isLoading && !await getConnectivityStatus() && initialLoadMovies) {
        _showDialog(context, title: 'No Connection', content: 'Check your network connectivity and try again.');
      }
    }
  }

  void _onScrollChanged() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      setState(() {
        isLoading = true;
      });

      WidgetsBinding.instance.scheduleFrameCallback((_) => _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.bounceInOut));

      if (StoreProvider.of<AppState>(context).state.filterOptions.getFilterParams().isEmpty) {
        if (!searchedResults) {
          setState(() {
            isLoading = false;
          });
          StoreProvider.of<AppState>(context).dispatch(LoadMovies());
        }
      } else {
        final String filterParameters = StoreProvider.of<AppState>(context).state.filterOptions.getFilterParams();
        StoreProvider.of<AppState>(context).dispatch(FilterMovies(filterParameters));
      }
    }
  }

  Future<bool> getConnectivityStatus() async {
    final dynamic connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }

  void _showDialog(BuildContext context, {@required String title, @required String content}) {
    showDialog<Widget>(
      context: context,
      builder: (BuildContext context) {
        if (Theme.of(context).platform == TargetPlatform.android) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              FlatButton(
                child: const Text('Ok'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        }
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(content),
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

  @override
  void dispose() {
    _scrollController.dispose();
    connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MoviesContainer(
      builder: (BuildContext context, List<Movie> films) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: GradientAppBar(
            //celestial
            backgroundColorStart: const Color.fromRGBO(195, 55, 100, 1.0),
            backgroundColorEnd: const Color.fromRGBO(29, 38, 113, 1.0),

            title: const Text('Lock-down Movies'),
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
                  },
                ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () async {
                  setState(() {
                    isLoading = false;
                  });
                  if(await Connectivity().checkConnectivity() != ConnectivityResult.none) {
                    final dynamic result = await showSearch<String>(
                      context: context,
                      delegate: QuerySearchDelegate(
                        store: StoreProvider.of<AppState>(context),
                        dispatcher: ActionsDispatcher.of(context),
                        movies: films,
                        scrollController: _scrollController,
                      ),
                    );
                    setState(() {
                      searchedResults = true;
                    });
                  }
                  else{
                    _showDialog(context, title: 'No Connection', content: 'Check your network connectivity and try searching again.');
                  }
                },
              ),
            ],
          ),
          body: films.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : GridviewBuilder(
                  scrollController: _scrollController,
                  context: context,
                  films: films,
                ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              final dynamic result = await Navigator.push<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                    fullscreenDialog: true,
                    builder: (BuildContext context) => FilterPage(),
                  ));

              final dynamic connResult = await Connectivity().checkConnectivity();
              if(connResult != ConnectivityResult.none){
                if (result.runtimeType == String && result.toString().isNotEmpty) {
                  StoreProvider.of<AppState>(context).dispatch(FilterMovies(result));
                  _scrollController.animateTo(_scrollController.position.minScrollExtent,
                      duration: const Duration(seconds: 1), curve: prefix0.Curves.ease);
                } else {
                  StoreProvider.of<AppState>(context).dispatch(SetFilterOptionsInitState());
                }
              }
              else{
                _showDialog(context, title: 'No Connection', content: 'Check your network connectivity and try filtering movies again.');
              }

            },
            label: Icon(Icons.filter_vintage),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }
}

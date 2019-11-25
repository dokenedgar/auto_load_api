//File created by mcedgar
//by 12:35 AM
//on 30/Oct/2019

import 'package:auto_load_api/actions/movies_action.dart';
import 'package:auto_load_api/containers/movies_container.dart';
import 'package:auto_load_api/main.dart';
import 'package:auto_load_api/models/app_state.dart';
import 'package:auto_load_api/models/movie.dart';
import 'package:auto_load_api/presentation/filter_page.dart';
import 'package:auto_load_api/presentation/movie_search.dart';
import 'package:auto_load_api/presentation/query_search_delegate.dart';
import 'package:auto_load_api/presentation/widgets/gridview_builder.dart';
import 'package:flutter/material.dart' hide showSearch, SearchDelegate;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

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
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      setState(() {
        isLoading = true;
      });

      WidgetsBinding.instance.scheduleFrameCallback((_) => _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.bounceInOut));
      print('Loading Page => ${StoreProvider.of<AppState>(context).state.pageNumber}');
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
    return MoviesContainer(
      builder: (BuildContext context, List<Movie> films) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: GradientAppBar(
            //celestial
            backgroundColorStart: const Color.fromRGBO(195, 55, 100, 1.0),
            backgroundColorEnd: const Color.fromRGBO(29, 38, 113, 1.0),

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
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () async {
                  final String result = await showSearch<String>(
                    context: context,
                    delegate: QuerySearchDelegate(
                      store: StoreProvider.of<AppState>(context),
                      dispatcher: ActionsDispatcher.of(context),
                      movies: films,
                      scrollController: _scrollController,
                    ),
                  );

                  print('result received:  $result');
                },
              )
            ],
          ),
          body: films.isEmpty
              ? Center(
                  child: const CircularProgressIndicator(),
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
                      fullscreenDialog: true, builder: (BuildContext context) => FilterPage()));
              if (result.runtimeType == String) {
                /*print(StoreProvider.of<AppState>(context).state.genre);
                print(StoreProvider.of<AppState>(context).state.quality);
                print(StoreProvider.of<AppState>(context).state.sortBy);
                print(StoreProvider.of<AppState>(context).state.minimumRating);
                 */
                //print(StoreProvider.of<AppState>(context).state.filterOptions);
                //perform query and reset state
              } else {
                print('$result EMPTY RES');
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

import 'package:auto_load_api/data/yts_api.dart';
import 'package:auto_load_api/middleware/app_middleware.dart';
import 'package:auto_load_api/models/app_state.dart';
import 'package:auto_load_api/reducers/movie_reducer.dart';
import 'package:auto_load_api/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'route_constants.dart' as router;

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
        //theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: router.generateRoute,
        initialRoute: router.AppRoutes.homeRoute,
      ),
    );
  }
}

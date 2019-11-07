import 'dart:async';

import 'package:auto_load_api/data/yts_api.dart';
import 'package:auto_load_api/middleware/app_middleware.dart';
import 'package:auto_load_api/models/app_state.dart';
import 'package:auto_load_api/reducers/movie_reducer.dart';
import 'package:auto_load_api/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:rxdart/rxdart.dart';

import 'route_constants.dart' as router;

void main() {
  final HttpService ytsHttpService = HttpService('https://yts.lt/api/v2');
  final YtsMovieApi ytsMovieApi = YtsMovieApi(ytsHttpService);
  final AppMiddleware middleware = AppMiddleware(ytsMovieApi);

  final StreamController<dynamic> actionController = StreamController<dynamic>.broadcast();

  final Store<AppState> store = Store<AppState>(
    //reducer,
    (AppState state, dynamic action) {
      actionController.add(action);
      return reducer(state, action);
    },
    initialState: AppState.initialState(),
    middleware: middleware.items,
  );
  runApp(BaseWidget(
    store: store,
    actionStream: actionController.stream,
  ));
}

class BaseWidget extends StatelessWidget {
  const BaseWidget({Key key, this.store, this.actionStream}) : super(key: key);
  final Store<AppState> store;
  final Stream<dynamic> actionStream;

  @override
  Widget build(BuildContext context) {
    return ActionsDispatcher(
      actions: actionStream,
      child: StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          //theme: ThemeData.dark(),
          theme: ThemeData(
            primarySwatch: Colors.grey,
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: router.generateRoute,
          initialRoute: router.AppRoutes.homeRoute,
        ),
      ),
    );
  }
}

class ActionsDispatcher extends InheritedWidget {
  const ActionsDispatcher({
    Key key,
    @required Widget child,
    @required this.actions,
  })  : assert(actions != null),
        assert(child != null),
        super(key: key, child: child);

  static ActionsDispatcher of(BuildContext context) {
    final ActionsDispatcher dispatcher = context.inheritFromWidgetOfExactType(ActionsDispatcher);
    return dispatcher;
  }

  final Stream<dynamic> actions;

  Stream<T> ofType<T>() => Observable<dynamic>(actions).whereType<T>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}

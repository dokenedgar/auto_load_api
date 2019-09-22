//File created by mcedgar
//by 1:51 PM
//on 22/Sep/2019

import 'package:auto_load_api/actions/page_load_action.dart';
import 'package:auto_load_api/models/app_state.dart';
import 'package:redux/redux.dart';

AppState _changePageNumber(AppState state, ChangePageNumber action) {
  return AppState(action.pageNumber, state.isLoading, state.error);
}

AppState _changeIsLoading(AppState state, ChangeIsLoading action) {
  return AppState(state.pageNumber, action.isLoading, state.error);
}

AppState _changeErrorState(AppState state, ChangeErrorState action) {
  return AppState(state.pageNumber, state.isLoading, action.error);
}

final Reducer<AppState> reducer = combineReducers<AppState>(<Reducer<AppState>>[
  TypedReducer<AppState, ChangePageNumber>(_changePageNumber),
  TypedReducer<AppState, ChangeIsLoading>(_changeIsLoading),
  TypedReducer<AppState, ChangeErrorState>(_changeErrorState),
]);

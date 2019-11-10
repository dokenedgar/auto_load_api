//File created by mcedgar
//by 2:02 AM
//on 08/Nov/2019

import 'package:auto_load_api/actions/movies_action.dart';
import 'package:auto_load_api/models/app_state.dart';
import 'package:auto_load_api/models/movie.dart';
import 'package:auto_load_api/route_constants.dart' as router;
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class GridviewBuilder extends StatelessWidget {
  GridviewBuilder({
    Key key,
    @required ScrollController scrollController,
    //  @required this.itemAspectRatio,
    //  @required this.itemWidth,
    @required this.context,
    this.films,
  })  : _scrollController = scrollController,
        screenSize = MediaQuery.of(context).size,
        // itemAspectRatio = itemWidth / itemHeight,
        super(key: key);

  final BuildContext context;
  final ScrollController _scrollController;

  //final double itemAspectRatio;
  // final double itemWidth;
  final Size screenSize;
  final int itemHeight = 420;

  //final double itemWidth = screenSize.width / 2;

  final List<Movie> films;

  @override
  Widget build(BuildContext context) {
    final double itemWidth = screenSize.width / 2;
    final double itemAspectRatio = itemWidth / itemHeight;
    return GridView.builder(
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
            StoreProvider.of<AppState>(context).dispatch(SelectedMovie(film));
            return Navigator.pushNamed(
              context,
              router.AppRoutes.movieDetailRoute,
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
                        film.image.isEmpty ? 'http://via.placeholder.com/300' : film.image,
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
                              return Text('${film.genres[i]}${i == film.genres.length - 1 ? '' : ', '}');
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
    );
  }
}

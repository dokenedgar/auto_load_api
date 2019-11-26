//File created by mcedgar
//by 2:21 AM
//on 08/Nov/2019

import 'package:auto_load_api/actions/movies_action.dart';
import 'package:auto_load_api/models/app_state.dart';
import 'package:auto_load_api/models/movie_filter_by_ratings.dart';
import 'package:auto_load_api/models/movie_genre.dart';
import 'package:auto_load_api/models/movie_quality.dart';
import 'package:auto_load_api/models/movie_sort_by.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class FilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<MovieGenre> genre =
        StoreProvider.of<AppState>(context).state.filterOptions.genreOptions.toList();
    final List<MovieFilterByRating> minimumRating =
        StoreProvider.of<AppState>(context).state.filterOptions.ratingsOptions.toList();
    final List<MovieSortBy> sortBy =
        StoreProvider.of<AppState>(context).state.filterOptions.sortByOptions.toList();
    final List<MovieQuality> quality =
        StoreProvider.of<AppState>(context).state.filterOptions.qualityOptions.toList();

    return Scaffold(
      appBar: GradientAppBar(
        backgroundColorStart: const Color.fromRGBO(195, 55, 100, 1.0),
        backgroundColorEnd: const Color.fromRGBO(29, 38, 113, 1.0),
        title: const Text('Filters'),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pop(context, false),
        ),
        actions: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: const Text(
                  'Apply',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  //print('save');
                  // method that saves selections to Store
                  Navigator.pop(context, 'Apply Clicked');
                },
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: <Widget>[
                filterCategory('Genre'),
                Divider(),
                FilterChipWidget(genre, 'genre'),
                Divider(),
                filterCategory('Quality'),
                Divider(),
                FilterChipWidget(quality, 'quality'),
                Divider(),
                filterCategory('Minimum Rating'),
                Divider(),
                FilterChipWidget(minimumRating, 'minimumRating'),
                Divider(),
                filterCategory('Sort By'),
                FilterChipWidget(sortBy, 'sortBy'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text filterCategory(String category) {
    return Text(
      category,
      style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    );
  }
}

class FilterChipWidget extends StatefulWidget {
  const FilterChipWidget(this.filterCategory, this.categoryName);

  final List<dynamic> filterCategory;
  final String categoryName;

  @override
  _FilterChipWidgetState createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  int _value = -1;
  dynamic selectedItem = '';

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.0,
      children: widget.filterCategory
          .map((dynamic item) => FilterChip(
                label: selectedItem == item
                    ? Text(
                        item.toString().replaceAll(RegExp('_'), ' '),
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      )
                    : Text(item.toString().replaceAll(RegExp('_'), ' ')),
                selectedColor: const Color.fromRGBO(195, 55, 100, 1.0),
                selected: widget.filterCategory.indexOf(item) == _value,
                onSelected: (bool isSelected) {
                  setState(() {
                    selectedItem = item;
                    _value = widget.filterCategory.indexOf(item);
                  });
                  updateFilter(context, widget.categoryName, item);
                },
              ))
          .toList(),
    );
  }

  void updateFilter(BuildContext context, String filterCategory, dynamic filterValue) {
    print(filterValue.runtimeType);
    switch (filterCategory) {
      case 'genre':
        final MovieGenre selectedGenre = StoreProvider.of<AppState>(context)
            .state
            .filterOptions
            .genreOptions
            .firstWhere((MovieGenre element) => element.toString() == filterValue.toString());
        StoreProvider.of<AppState>(context).dispatch(SetGenre(selectedGenre));
        break;
      case 'quality':
        final MovieQuality selectedQuality = StoreProvider.of<AppState>(context)
            .state
            .filterOptions
            .qualityOptions
            .firstWhere((MovieQuality element) => element.toString() == filterValue.toString());
        StoreProvider.of<AppState>(context).dispatch(SetQuality(selectedQuality));
        break;
      case 'sortBy':
        final MovieSortBy selectedOption = StoreProvider.of<AppState>(context)
            .state
            .filterOptions
            .sortByOptions
            .firstWhere((MovieSortBy el) => el.toString() == filterValue.toString());
        StoreProvider.of<AppState>(context).dispatch(SetSortBy(selectedOption));
        break;
      case 'minimumRating':
        final MovieFilterByRating selectedRating = StoreProvider.of<AppState>(context)
            .state
            .filterOptions
            .ratingsOptions
            .firstWhere((MovieFilterByRating el) => el.getValue() == filterValue.getValue());
        StoreProvider.of<AppState>(context).dispatch(SetMinRating(selectedRating));
        //StoreProvider.of<AppState>(context)
        //   .dispatch(SetMinRating('minimum_rating', selectedRating));
        break;
    }
  }
}

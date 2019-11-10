//File created by mcedgar
//by 2:21 AM
//on 08/Nov/2019

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class FilterPage extends StatelessWidget {
  final List<int> minimumRating = <int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  final List<String> sortBy = <String>['title', 'year', 'rating', 'download_count', 'like_count', 'date_added'];
  final List<String> quality = <String>['720p', '1080p', '3D'];
  final List<String> genre = <String>[
    'action',
    'adventure',
    'animation',
    'biography',
    'comedy',
    'crime',
    'documentary',
    'drama',
    'family',
    'fantasy',
    'film-noir',
    'game-show',
    'history',
    'horror',
    'music',
    'musical',
    'mystery',
    'news',
    'reality-tv',
    'romance',
    'sci-fi',
    'sport',
    'talk-show',
    'thriller',
    'war',
    'western'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        backgroundColorStart: const Color.fromRGBO(195, 55, 100, 1.0),
        backgroundColorEnd: const Color.fromRGBO(29, 38, 113, 1.0),
        title: const Text('Filters'),
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
                  print('save');
                  Navigator.pop(context);
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
                        item.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      )
                    : Text(item.toString()),
                selectedColor: const Color.fromRGBO(195, 55, 100, 1.0),
                selected: widget.filterCategory.indexOf(item) == _value,
                onSelected: (bool isSelected) {
                  setState(() {
                    selectedItem = item;
                    _value = widget.filterCategory.indexOf(item);
                    print(widget.filterCategory.indexOf(item));
                    print('selected category is: ${widget.categoryName} and selected item is: $selectedItem');
                  });
                },
              ))
          .toList(),
    );
  }
}

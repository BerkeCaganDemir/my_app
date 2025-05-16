import 'package:flutter/material.dart';

class ExploreController extends ChangeNotifier {
  final List<String> filters = ['All', 'Life', 'Comedy', 'Tech'];
  int selectedFilterIndex = 0;

  void selectFilter(int index) {
    selectedFilterIndex = index;
    notifyListeners();
  }

  List<Map<String, dynamic>> get trendingItems => [
        {
          'title': 'The missing 96 percent of the universe',
          'subtitle': 'Claire Malone',
          'image': 'assets/images/user1.png',
          'color': Colors.purple,
        },
        {
          'title': 'How Dolly Parton led me to an epiphany',
          'subtitle': 'Abumenyang',
          'image': 'assets/images/user2.png',
          'color': Colors.lightBlue,
        },
        {
          'title': 'The missing 96 percent of the universe',
          'subtitle': 'Tir McDohl',
          'image': 'assets/images/user3.png',
          'color': Colors.deepOrange,
        },
        {
          'title': 'Ngobam with Denny Caknan',
          'subtitle': 'Denny Kulon',
          'image': 'assets/images/user4.png',
          'color': Colors.amber,
        },
      ];
}

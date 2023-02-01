import 'package:flutter/material.dart';
import 'package:movies_app/search_tab.dart';
import 'package:movies_app/watch_list_tab.dart';

import 'browse_tab.dart';
import 'home_tab.dart';


class HomeScreen extends StatefulWidget{
  static const String routeName ='home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  int iconSelectIndex = 0;
  List<Widget> taps = [
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    WatchListTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        backgroundColor: Color(0xFF121312),
        body: taps[iconSelectIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: iconSelectIndex,
          backgroundColor: Color(0xFF1D1E1D),
          onTap: (index) {
            iconSelectIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF1D1E1D),
                icon: Icon(Icons.home),
                label: 'HOME'),
            BottomNavigationBarItem(
                backgroundColor: Color(0xFF1D1E1D),
                icon: Icon(Icons.search),
                label: 'SEARCH'),
            BottomNavigationBarItem(
                backgroundColor: Color(0xFF1D1E1D),
                icon: Icon(Icons.movie),
                label: 'Browser'),
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF1D1E1D),
              icon: Icon(Icons.book_rounded),
              label: 'WATCHLIST',
            ),
          ],
        ),
      ),
    );
  }
}
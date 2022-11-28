import 'package:flutter/material.dart';
import 'package:instagram_cc/screen/homepage/home_page.dart';
import 'package:instagram_cc/screen/searchpage/search_page.dart';
import 'package:instagram_cc/screen/reelspage/reels_page.dart';
import 'package:instagram_cc/screen/shoppingpage/shopping_page.dart';
import 'package:instagram_cc/screen/profilepage/profile_page.dart';

class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int selectedPageIndex = 0;

  List pages = [
    HomePage(),
    SearchPage(),
    ReelsPage(),
    ShoppingPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pages[selectedPageIndex],
      ),
      bottomNavigationBar: BottomNavigationBar( //하단 네이게이션바
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.black,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.smart_display_outlined,
                color: Colors.black,
              ),
              label: 'Reels'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                color: Colors.black,
              ),
              label: 'Profile'),
        ],
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }
}

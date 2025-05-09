import 'package:bharat_nxt_assignment/pages/favourites_page.dart';
import 'package:bharat_nxt_assignment/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int index = 0;
  List<Widget> pages = [Home(), FavouritesPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          setState(() {
            index = value;
          });
        },
        selectedIndex: index,
        backgroundColor: Colors.white,
        indicatorColor: Colors.black,
        shadowColor: Colors.grey,
        elevation: 10,
        surfaceTintColor: Colors.white,
        destinations: [
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home_filled,
              color: Colors.white,
            ),
            icon: Icon(Icons.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(CupertinoIcons.heart),
            selectedIcon: Icon(
              CupertinoIcons.heart_fill,
              color: Colors.white,
            ),
            label: "Favourites",
          ),
        ],
      ),
    );
  }
}

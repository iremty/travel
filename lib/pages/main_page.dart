import 'package:flutter/material.dart';
import 'package:travel/pages/bar_item_page.dart';
import 'package:travel/pages/home_page.dart';
import 'package:travel/pages/my_page.dart';
import 'package:travel/pages/search_page.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        currentIndex: currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        items: [
          BottomNavigationBarItem(label:"Anasayfa", icon: Icon(Icons.apps)),
          BottomNavigationBarItem(label:"Bar",
               icon: Icon(Icons.bar_chart_sharp)),
          BottomNavigationBarItem( label:"Arama",icon: Icon(Icons.search)),
          BottomNavigationBarItem(label:"Profilim", icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}

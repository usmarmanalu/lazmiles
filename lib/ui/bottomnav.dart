import 'package:flutter/material.dart';
import 'package:lazmiles/ui/bottom_nav_pages/message.dart';
import '../const/appcolor.dart';
import 'bottom_nav_pages/card.dart';
import 'bottom_nav_pages/favorite.dart';
import 'bottom_nav_pages/home.dart';
import 'bottom_nav_pages/profile.dart';

class BottomNavController extends StatefulWidget {
  @override
  _BottomNavControllerState createState() => _BottomNavControllerState();
} 

class _BottomNavControllerState extends State<BottomNavController> {
  final _pages = [
    Home(),
    Favourite(),
    MessageScreen(),
    Cart(),
    Profile(),
  ];
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 5,
        selectedItemColor: AppColor.deep_orange,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        selectedLabelStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        items: [
          BottomNavigationBarItem(
            label: "Beranda",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Favorit",
            icon: Icon(Icons.favorite_outline),
          ),
          BottomNavigationBarItem(
            label: "Chat",
            icon: Icon(Icons.message_outlined),
          ),
          BottomNavigationBarItem(
            label: "Troly",
            icon: Icon(Icons.add_shopping_cart),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            print(_currentIndex);
          });
        },
      ),
      body: _pages[_currentIndex],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:twitter_clone/constants.dart';
import 'package:twitter_clone/screens/home_screen.dart';
import 'package:twitter_clone/screens/search_screen.dart';

class MainScreen extends StatefulWidget {
  static const id = 'main screen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final screens = [
    HomeScreen(),
    SearchScreen(),
    notificationScreen(),
    messagesScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: kDarkBlue,
        selectedItemColor: kLightBlue,
        unselectedItemColor: kGrey,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Text('')),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_none,
            ),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.email,
            ),
            title: Text(''),
          )
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      backgroundColor: kDarkBlue,
      body: screens[_currentIndex],
    );
  }
}

Container homeScreen() {
  return Container(
    color: kBlack,
    child: Text('home'),
  );
}

Container searchScreen() {
  return Container(
    color: kBlack,
  );
}

Container notificationScreen() {
  return Container(
    color: kBlack,
  );
}

Container messagesScreen() {
  return Container(
    color: kBlack,
  );
}

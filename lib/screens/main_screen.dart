import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/constants.dart';
import 'package:twitter_clone/screens/home_screen.dart';
import 'package:twitter_clone/screens/search_screen.dart';
import 'package:twitter_clone/screens/notification_screen.dart';
import 'package:twitter_clone/screens/message_screen.dart';
import 'package:custom_navigator/custom_navigation.dart';

class MainScreen extends StatefulWidget {
  static const id = 'main screen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffold: Scaffold(
        backgroundColor: kDarkBlue,
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: kDarkBlue,
          unselectedItemColor: kGrey,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Text(''),
            ),
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
        ),
      ),
      children: <Widget>[
        HomeScreen(),
        SearchScreen(),
        NotificationScreen(),
        MessagesScreen(),
      ],
      onItemTap: (index) {
        setState(
          () {
            _currentIndex = index;
          },
        );
      },
    );
  }
}

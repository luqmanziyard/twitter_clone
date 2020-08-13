import 'package:flutter/material.dart';
import 'package:twitter_clone/screens/welcome_screen.dart';
import 'package:twitter_clone/screens/create_account_screen.dart';
import 'package:twitter_clone/screens/login_screen.dart';
import 'package:twitter_clone/screens/main_screen.dart';
import 'package:twitter_clone/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'tweets_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TweetsData(),
      child: MaterialApp(
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          CreateAccountScreen.id: (context) => CreateAccountScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          MainScreen.id: (context) => MainScreen(),
          HomeScreen.id: (context) => HomeScreen(),
        },
      ),
    );
  }
}

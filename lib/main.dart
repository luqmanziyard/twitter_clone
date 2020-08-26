import 'package:flutter/material.dart';
import 'package:twitter_clone/screens/welcome_screen.dart';
import 'package:twitter_clone/screens/create_account_screen.dart';
import 'package:twitter_clone/screens/login_screen.dart';
import 'package:twitter_clone/screens/main_screen.dart';
import 'package:twitter_clone/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'tweets_data.dart';
import 'package:twitter_clone/pages/tweet_page.dart';
import 'package:twitter_clone/pages/new_message_page.dart';
import 'package:twitter_clone/pages/chat_screen.dart';
import 'package:twitter_clone/screens/profile_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

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
          TweetPage.id: (context) => TweetPage(),
          NewMessageScreen.id: (context) => NewMessageScreen(),
          ChatScreen.id: (context) => ChatScreen(),
          ProfileScreen.id: (context) => ProfileScreen(),
        },
      ),
    );
  }
}

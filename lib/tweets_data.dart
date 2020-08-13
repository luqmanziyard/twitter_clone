import 'package:flutter/material.dart';
import 'tweet.dart';
import 'constants.dart';

class TweetsData extends ChangeNotifier {
  List<Tweet> tweets = [
    Tweet(
      name: 'John',
      profileImage: 'images/newUser1.jpg',
    ),
    Tweet(
      name: 'jessica',
      profileImage: 'images/newUser2.jpg',
    ),
    Tweet(
      name: 'umerfyzer',
      profileImage: 'images/newUser3.jpg',
    )
  ];

  List<Tweet> hashtags = [
    Tweet(
      name: 'John',
      profileImage: 'images/newUser1.jpg',
    ),
    Tweet(
      name: 'jessica',
      profileImage: 'images/newUser2.jpg',
    ),
    Tweet(
      name: 'umerfyzer',
      profileImage: 'images/newUser3.jpg',
    )
  ];
}

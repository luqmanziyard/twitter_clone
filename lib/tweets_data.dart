import 'package:flutter/material.dart';
import 'package:twitter_clone/hashtag.dart';
import 'tweet.dart';
import 'constants.dart';

class TweetsData extends ChangeNotifier {
  List<Tweet> tweets = [
    Tweet(
      name: 'John',
      profileImage: 'images/newUser1.jpg',
    ),
    Tweet(
      name: 'Jessica',
      profileImage: 'images/newUser2.jpg',
    ),
    Tweet(
      name: 'Mark',
      profileImage: 'images/newUser3.jpg',
    ),
    Tweet(
      name: 'Jessica',
      profileImage: 'images/newUser2.jpg',
    ),
  ];

  List<HashTag> hashtags = [
    HashTag(
      name: '#BLM',
      tweets: '3026',
    ),
    HashTag(
      name: '#jungkook',
      tweets: '977k',
    ),
    HashTag(
      name: '#Pride',
      tweets: '5909',
    ),
    HashTag(
      name: '#Fiverr',
      tweets: '34.9k',
    ),
    HashTag(
      name: '#Yess',
      tweets: '49.6k',
    ),
  ];
}

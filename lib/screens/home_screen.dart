import 'package:flutter/material.dart';
import 'package:twitter_clone/constants.dart';
import 'package:provider/provider.dart';
import 'package:twitter_clone/tweet.dart';
import 'package:twitter_clone/tweets_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/widgets/tweet_builder.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'home screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Stack(
            children: <Widget>[
              Image(
                image: AssetImage('images/twitterFetherFlutter.png'),
                height: 42,
                width: 42,
              ),
              Positioned(
                top: 5,
                left: 5,
                child: Icon(
                  Icons.add,
                  size: 15,
                ),
              )
            ],
          ),
        ),
        backgroundColor: kDarkBlue,
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 19,
                    backgroundColor: kLightBlue,
                  ),
                  SizedBox(
                    width: width / 3,
                  ),
                  Image(
                    height: 33,
                    width: 38,
                    image: AssetImage('images/twitterLogoFlutter.png'),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: kGrey,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return TweetBuilder(
                    width: width,
                    height: height,
                    name: Provider.of<TweetsData>(context).tweets[index].name,
                    image: Provider.of<TweetsData>(context)
                        .tweets[index]
                        .profileImage,
                    userName:
                        Provider.of<TweetsData>(context).tweets[index].name,
                  );
                },
                itemCount: Provider.of<TweetsData>(context).tweets.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}

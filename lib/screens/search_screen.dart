import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_clone/constants.dart';

import 'package:twitter_clone/tweets_data.dart';

import 'package:twitter_clone/pages/tweet_page.dart';
import 'package:twitter_clone/pages/drawer_page.dart';

class SearchScreen extends StatefulWidget {
  static const id = 'search screen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool onTap = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: width * 0.6,
                height: height * 0.04,
                padding: EdgeInsets.only(left: 5.0),
                decoration: BoxDecoration(
                  color: kBlack,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: TextField(
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: kDarkBlue,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: kDarkBlue,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: kGrey,
                      size: 12,
                    ),
                    hintText: 'search',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
          leading: Builder(
            builder: (context) => MaterialButton(
              padding: EdgeInsets.all(0),
              minWidth: 0,
              child: CircleAvatar(
                radius: 19,
                backgroundColor: kLightBlue,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          bottom: PreferredSize(
            child: Container(
              color: kGrey,
              height: 1.0,
            ),
          ),
          elevation: 0.0,
          automaticallyImplyLeading: false,
          backgroundColor: kDarkBlue,
        ),
        drawer: SideDrawer(
          width: width,
          height: height,
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              width: width,
              height: height * 0.06,
              decoration: BoxDecoration(
                color: kDarkBlue,
                border: Border(
                  bottom: BorderSide(
                    color: kGrey,
                    width: 1,
                  ),
                ),
              ),
              child: Text(
                'Trends for you',
                style: kHeaderStyle,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return HashTagBuilder(
                      hashTag:
                          Provider.of<TweetsData>(context).hashtags[index].name,
                      width: width,
                      height: height);
                },
                itemCount: Provider.of<TweetsData>(context).hashtags.length,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TweetPage(),
            ),
          ),
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
        backgroundColor: kBlack,
      ),
    );
  }
}

class HashTagBuilder extends StatelessWidget {
  const HashTagBuilder({
    @required this.width,
    @required this.height,
    @required this.hashTag,
  });

  final double width;
  final double height;
  final String hashTag;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: width,
      height: height * 0.1,
      decoration: BoxDecoration(
        color: kDarkBlue,
        border: Border(
          bottom: BorderSide(
            color: kGrey,
            width: 1,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                hashTag,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.keyboard_arrow_down,
                  size: 20,
                  color: kGrey,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                '3068 Tweets',
                textAlign: TextAlign.left,
                style: TextStyle(color: kGrey),
              ),
            ],
          )
        ],
      ),
    );
  }
}

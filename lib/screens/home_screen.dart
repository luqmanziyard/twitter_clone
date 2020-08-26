import 'package:flutter/material.dart';
import 'package:twitter_clone/constants.dart';
import 'package:provider/provider.dart';
import 'package:twitter_clone/tweets_data.dart';
import 'package:twitter_clone/widgets/tweet_builder.dart';
import 'package:twitter_clone/pages/tweet_page.dart';
import 'package:twitter_clone/pages/drawer_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'home screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;

  String loggedInUserEmail;

  @override
  void initState() {
    // TODO: implement initState
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUserEmail = user.email;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: kDarkBlue,
        appBar: AppBar(
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: width * 0.22,
              ),
              MaterialButton(
                minWidth: 0,
                onPressed: () {
                  _auth.signOut();
                  Navigator.pop(context);
                },
                child: Image(
                  height: 33,
                  width: 38,
                  image: AssetImage('images/twitterLogoFlutter.png'),
                ),
              ),
            ],
          ),
        ),
        drawer: SideDrawer(
          width: width,
          height: height,
        ),
        body: Column(
          children: <Widget>[
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
      ),
    );
  }
}

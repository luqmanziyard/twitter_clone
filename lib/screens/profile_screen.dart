import 'package:flutter/material.dart';
import 'package:twitter_clone/constants.dart';
import 'package:twitter_clone/services/crud.dart';
import 'package:twitter_clone/tweets_data.dart';
import 'package:twitter_clone/widgets/tweet_builder.dart';
import 'package:provider/provider.dart';
import 'package:twitter_clone/pages/tweet_page.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  static const id = 'profile screen';
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  CrudMethods crudMethods = CrudMethods();

  final ImagePicker _picker = ImagePicker();

  File selectedImage;
  Future getImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);

    try {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
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
      backgroundColor: kDarkBlue,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: kLightBlue,
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                height: height,
                width: width,
                color: kLightBlue,
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  width: width,
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            child: selectedImage != null
                                ? CircleAvatar(
                                    radius: 27,
                                    backgroundImage: FileImage(selectedImage),
                                  )
                                : CircleAvatar(
                                    radius: 27,
                                    backgroundColor: kGrey,
                                    child: Icon(Icons.add_a_photo),
                                  ),
                            onTap: () {
                              getImage();
                            },
                          ),
                          MaterialButton(
                            onPressed: () {},
                            padding: EdgeInsets.all(0),
                            minWidth: 0,
                            splashColor: kDarkBlue,
                            child: Container(
                              padding: EdgeInsets.all(4),
                              height: 24,
                              width: 75,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                border: Border.all(
                                  color: kLightBlue,
                                  width: 1,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Text(
                                'Edit profile',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: kLightBlue,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Mark Zuck',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '@zuck',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.lightbulb_outline,
                            color: Colors.white.withOpacity(0.5),
                            size: 18,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            'Born february 5,2001',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.date_range,
                            color: Colors.white.withOpacity(0.5),
                            size: 18,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            'Joined March 2018',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '7',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            'following',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            '2',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            'followers',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TabBar(
                    controller: tabController,
                    isScrollable: false,
                    indicatorColor: kLightBlue,
                    labelColor: kLightBlue,
                    unselectedLabelColor: Colors.white.withOpacity(0.5),
                    labelStyle: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                    tabs: <Widget>[
                      Tab(
                        child: Text('Tweets'),
                      ),
                      Tab(
                        child: Text('Replies'),
                      ),
                      Tab(
                        child: Text('Media'),
                      ),
                      Tab(
                        child: Text('Likes'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: <Widget>[
                      Tweets(
                        height: height,
                        width: width,
                      ),
                      Replies(
                        height: height,
                        width: width,
                      ),
                      Media(
                        width: width,
                        height: height,
                      ),
                      Likes(
                        width: width,
                        height: height,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Tweets extends StatelessWidget {
  Tweets({
    @required this.height,
    @required this.width,
  });
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TweetBuilder(
            height: height,
            width: width,
            image: Provider.of<TweetsData>(context).tweets[index].profileImage,
            name: Provider.of<TweetsData>(context).tweets[index].name,
            userName: Provider.of<TweetsData>(context).tweets[index].name,
          );
        },
        itemCount: Provider.of<TweetsData>(context).tweets.length,
      ),
    );
  }
}

class Replies extends StatelessWidget {
  Replies({
    @required this.height,
    @required this.width,
  });
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TweetBuilder(
            height: height,
            width: width,
            image: Provider.of<TweetsData>(context).tweets[index].profileImage,
            name: Provider.of<TweetsData>(context).tweets[index].name,
            userName: Provider.of<TweetsData>(context).tweets[index].name,
          );
        },
        itemCount: Provider.of<TweetsData>(context).tweets.length,
      ),
    );
  }
}

class Media extends StatelessWidget {
  Media({
    @required this.height,
    @required this.width,
  });
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: Center(
        child: Container(
          child: Text(
            'Nothing to see here — yet.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class Likes extends StatelessWidget {
  Likes({
    @required this.height,
    @required this.width,
  });
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TweetBuilder(
            height: height,
            width: width,
            image: Provider.of<TweetsData>(context).tweets[index].profileImage,
            name: Provider.of<TweetsData>(context).tweets[index].name,
            userName: Provider.of<TweetsData>(context).tweets[index].name,
          );
        },
        itemCount: Provider.of<TweetsData>(context).tweets.length,
      ),
    );
  }
}

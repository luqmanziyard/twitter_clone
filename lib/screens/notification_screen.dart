import 'package:flutter/material.dart';
import 'package:twitter_clone/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/pages/tweet_page.dart';
import 'package:twitter_clone/pages/drawer_page.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Notification',
            textAlign: TextAlign.center,
            style: kHeaderStyle,
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
            Padding(
              padding: EdgeInsets.only(top: 10, right: 10, left: 10),
              child: TabBar(
                controller: tabController,
                isScrollable: false,
                indicatorColor: kLightBlue,
                labelColor: kLightBlue,
                unselectedLabelColor: Colors.white.withOpacity(0.5),
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                unselectedLabelStyle:
                    TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                tabs: <Widget>[
                  Tab(
                    child: Text('All'),
                  ),
                  Tab(
                    child: Text('Mentions'),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: height,
                child: TabBarView(
                  controller: tabController,
                  children: <Widget>[
                    AllSection(height: height, width: width),
                    Mentions(height: height, width: width),
                  ],
                ),
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
        backgroundColor: kDarkBlue,
      ),
    );
  }
}

class Mentions extends StatelessWidget {
  const Mentions({
    Key key,
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

class AllSection extends StatelessWidget {
  const AllSection({
    @required this.height,
    @required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            height: height * 0.16,
            width: width,
            decoration: BoxDecoration(
              color: kDarkBlue,
              border: Border(
                bottom: BorderSide(width: 1, color: kGrey),
              ),
            ),
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    FaIcon(
                      FontAwesomeIcons.solidHeart,
                      color: kRed,
                      size: 25,
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 19,
                      backgroundColor: kLightBlue,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Elon musk',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          'Liked your comment',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '#UFC223 pic.twitter.com/QIMwAIILX1',
                      style: TextStyle(
                        color: kGrey,
                        fontSize: 12,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:twitter_clone/constants.dart';
import 'package:twitter_clone/pages/new_message_page.dart';
import 'package:twitter_clone/pages/drawer_page.dart';

class MessagesScreen extends StatefulWidget {
  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Messages',
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
        drawer: SideDrawer(width: width, height: height),
        body: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: kDarkBlue,
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: kGrey,
                  ),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              width: width,
              height: height * 0.07,
              child: Container(
                margin: EdgeInsets.all(5),
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
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    width: width,
                    height: height * 0.12,
                    margin: EdgeInsets.only(bottom: 10),
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
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('images/newUser1.jpg'),
                              radius: 27,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Elon Musk',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '@CEOofTesla',
                                      style: TextStyle(
                                        color: kGrey,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Yes',
                                  style: TextStyle(color: kGrey),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                '6d',
                                style: TextStyle(
                                  color: kGrey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => NewMessageScreen(),
            ),
          ),
          child: Stack(
            children: <Widget>[
              Icon(
                Icons.email,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ),
        backgroundColor: kBlack,
      ),
    );
  }
}

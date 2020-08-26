import 'package:flutter/material.dart';
import 'package:twitter_clone/constants.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({this.name});
  final String name;
  static const id = 'chat screen';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
        backgroundColor: kDarkBlue,
        body: Column(
          children: <Widget>[
            Container(
              color: kDarkBlue,
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  BackButton(
                    color: kLightBlue,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: width * 0.6,
                    child: Text(
                      'New message',
                      textAlign: TextAlign.center,
                      style: kHeaderStyle,
                    ),
                  ),
                ],
              ),
            ),
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
              width: width,
              height: height * 0.07,
              child: Container(
                margin: EdgeInsets.all(5),
                width: width * 0.6,
                height: height * 0.04,
                padding: EdgeInsets.only(left: 5.0),
                decoration: BoxDecoration(
                  color: kBlack,
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                      height: 24,
                      decoration: BoxDecoration(
                        color: kLightBlue,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: kDarkBlue,
              ),
            ),
            Container(
              height: 46,
              width: width,
              decoration: BoxDecoration(
                color: kDarkBlue,
                border: Border(
                  top: BorderSide(width: 0.5, color: kGrey),
                ),
              ),
              child: Row(
                children: <Widget>[
                  MaterialButton(
                    onPressed: () {},
                    minWidth: 0,
                    padding: EdgeInsets.all(0),
                    child: Icon(
                      Icons.image,
                      color: kLightBlue,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    minWidth: 0,
                    padding: EdgeInsets.all(0),
                    child: Icon(
                      Icons.gif,
                      color: kLightBlue,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    width: width * 0.58,
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
                  MaterialButton(
                    onPressed: () {},
                    minWidth: 0,
                    padding: EdgeInsets.all(0),
                    child: Icon(
                      Icons.send,
                      color: kLightBlue,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

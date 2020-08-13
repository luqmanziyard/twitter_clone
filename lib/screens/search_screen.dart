import 'package:flutter/material.dart';
import 'package:twitter_clone/constants.dart';
import 'package:twitter_clone/widgets/tweet_builder.dart';

class SearchScreen extends StatelessWidget {
  static const id = 'search screen';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kDarkBlue,
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 19,
                    backgroundColor: kLightBlue,
                  ),
                  SizedBox(
                    width: 20,
                  ),
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
            ),
            Divider(
              thickness: 1,
              color: kGrey,
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}

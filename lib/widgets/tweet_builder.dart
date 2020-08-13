import 'package:flutter/material.dart';
import 'package:twitter_clone/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TweetBuilder extends StatelessWidget {
  const TweetBuilder(
      {@required this.width,
      @required this.height,
      @required this.image,
      @required this.name,
      @required this.userName});

  final double width;
  final double height;
  final String image;
  final String name;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: width,
      height: height * 0.15,
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
                backgroundImage: AssetImage(image),
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
                        name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '@${userName}',
                        style: TextStyle(
                          color: kGrey,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '15h',
                        style: TextStyle(
                          color: kGrey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Aut asperiores quibusdam maiores quas \nexercitationem rerum dolorum aut.',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
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
            height: 10,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: width * 0.17,
              ),
              FaIcon(
                FontAwesomeIcons.comment,
                color: kGrey,
                size: kIconButtonsSize,
              ),
              SizedBox(
                width: kIconButtonGapSize,
              ),
              FaIcon(
                FontAwesomeIcons.retweet,
                color: kGrey,
                size: kIconButtonsSize,
              ),
              SizedBox(
                width: kIconButtonGapSize,
              ),
              FaIcon(
                FontAwesomeIcons.heart,
                color: kGrey,
                size: kIconButtonsSize,
              ),
              SizedBox(
                width: kIconButtonGapSize,
              ),
              FaIcon(
                FontAwesomeIcons.upload,
                color: kGrey,
                size: kIconButtonsSize,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

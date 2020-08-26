import 'package:flutter/material.dart';
import 'package:twitter_clone/constants.dart';
import 'package:twitter_clone/pages/chat_screen.dart';
import 'package:twitter_clone/tweets_data.dart';
import 'package:provider/provider.dart';

class NewMessageScreen extends StatefulWidget {
  static const id = 'new message screen';

  @override
  _NewMessageScreenState createState() => _NewMessageScreenState();
}

class _NewMessageScreenState extends State<NewMessageScreen> {
  List<MessageBuilder> messagesBuilders = [
    MessageBuilder(
      height: 58,
      width: 375,
    )
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlack,
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
                child: TextField(
                  autofocus: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white),
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
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return MessageBuilder(
                    width: width,
                    height: height,
                    name: Provider.of<TweetsData>(context).tweets[index].name,
                    userName:
                        Provider.of<TweetsData>(context).tweets[index].name,
                    image: Provider.of<TweetsData>(context)
                        .tweets[index]
                        .profileImage,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(
                            name: Provider.of<TweetsData>(context)
                                .tweets[index]
                                .name,
                          ),
                        ),
                      );
                    },
                  );
                },
                itemCount: Provider.of<TweetsData>(context).tweets.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageBuilder extends StatelessWidget {
  MessageBuilder(
      {@required this.width,
      @required this.height,
      this.image,
      this.name,
      this.userName,
      this.onTap});

  final double width;
  final double height;
  final String image;
  final String name;
  final String userName;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: width,
        height: height * 0.09,
        decoration: BoxDecoration(
          color: kDarkBlue,
          border: Border(
            bottom: BorderSide(
              color: kGrey,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage(image),
              radius: 19,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  '@' + userName,
                  style: TextStyle(
                    color: kGrey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

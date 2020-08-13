import 'package:flutter/material.dart';
import 'package:twitter_clone/constants.dart';
import 'package:twitter_clone/screens/login_screen.dart';
import 'package:twitter_clone/widgets/rounded_button.dart';
import 'package:twitter_clone/screens/create_account_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static const id = 'welcome screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    height: 33,
                    width: 38,
                    image: AssetImage('images/twitterLogoFlutter.png'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 225,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'See whats \nHappening in the \nWorld right now.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundedButton(
                  height: 41,
                  width: 275,
                  text: 'Create account',
                  fontSize: 15,
                  fonWeight: FontWeight.w700,
                  borderRadius: 20,
                  onPressed: () {
                    Navigator.pushNamed(context, CreateAccountScreen.id);
                  },
                )
              ],
            ),
            SizedBox(
              height: 130,
            ),
            Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Have an account already?',
                      style: kHintTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    MaterialButton(
                      padding: EdgeInsets.all(0),
                      minWidth: 0,
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                      child: Text(
                        'Log in',
                        style: kHintTextStyle.copyWith(
                          color: kLightBlue,
                        ),
                      ),
                      highlightColor: kDarkBlue,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

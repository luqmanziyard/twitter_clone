import 'package:flutter/material.dart';
import 'package:twitter_clone/constants.dart';
import 'package:twitter_clone/screens/main_screen.dart';
import 'package:twitter_clone/widgets/info_textField.dart';
import 'package:twitter_clone/widgets/rounded_button.dart';

class LoginScreen extends StatelessWidget {
  static const id = 'login screen';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kDarkBlue,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Row(
                children: <Widget>[
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: kLightBlue, fontSize: 16),
                    ),
                    padding: EdgeInsets.all(10),
                    minWidth: 0,
                    highlightColor: kDarkBlue,
                  ),
                  SizedBox(
                    width: width * 0.26,
                  ),
                  Image(
                    height: 33,
                    width: 38,
                    image: AssetImage('images/twitterLogoFlutter.png'),
                  ),
                  SizedBox(
                    width: width * 0.35,
                  ),
                  Icon(
                    Icons.more_horiz,
                    color: kLightBlue,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Log in to Twitter',
              style: kHeadingStyle,
            ),
            SizedBox(
              height: 45,
            ),
            InfoTextField(
              hintText: 'Phone, email or username',
            ),
            SizedBox(
              height: 30,
            ),
            InfoTextField(
              hintText: 'Password',
            ),
            SizedBox(
              height: 80,
            ),
            RoundedButton(
              width: 275,
              height: 41,
              borderRadius: 20,
              text: 'Log in',
              fonWeight: FontWeight.w700,
              fontSize: 15,
              onPressed: () {
                Navigator.pushNamed(context, MainScreen.id);
                FocusScope.of(context).requestFocus(FocusNode());
              },
            )
          ],
        ),
      ),
    );
  }
}

//showOverlay(BuildContext context) {
//  if (overlayEntry != null) return;
//  OverlayState overlayState = Overlay.of(context);
//  overlayEntry = OverlayEntry(
//    builder: (context) {
//      return Positioned(
//          bottom: MediaQuery.of(context).viewInsets.bottom,
//          right: 0.0,
//          left: 0.0,
//          child: RoundedButton(
//              width: 275,
//              height: 41,
//              borderRadius: 20,
//              text: 'Log in',
//              fonWeight: FontWeight.w700,
//              fontSize: 15,
//              onPressed: () {
//                Navigator.pushNamed(context, MainScreen.id);
//                FocusScope.of(context).requestFocus(FocusNode());
//              }));
//    },
//  );
//  overlayState.insert(overlayEntry);
//}

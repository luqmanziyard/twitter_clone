import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/constants.dart';
import 'package:twitter_clone/screens/main_screen.dart';
import 'package:twitter_clone/widgets/info_textField.dart';
import 'package:twitter_clone/widgets/rounded_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'login screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;

  String email, password;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kDarkBlue,
        body: Column(
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
            Expanded(
              child: ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
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
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InfoTextField(
                        hintText: 'Password',
                        onChanged: (value) {
                          password = value;
                        },
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 80,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RoundedButton(
                  width: 60,
                  height: 32,
                  borderRadius: 20,
                  text: 'Log in',
                  fonWeight: FontWeight.w700,
                  fontSize: 12,
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        Navigator.pushNamed(context, MainScreen.id);
                      }
                    } catch (e) {
                      print(e);
                    }
                    setState(() {
                      isLoading = false;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twitter_clone/constants.dart';
import 'package:twitter_clone/widgets/info_textField.dart';
import 'package:twitter_clone/widgets/rounded_button.dart';
import 'package:twitter_clone/screens/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateAccountScreen extends StatefulWidget {
  static const id = 'create account screen';

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _auth = FirebaseAuth.instance;
  String email, password1, password2;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kDarkBlue,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Row(
              children: <Widget>[
                BackButton(),
                SizedBox(
                  width: width / 3,
                ),
                Image(
                  height: 33,
                  width: 38,
                  image: AssetImage('images/twitterLogoFlutter.png'),
                ),
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
                      'Create your account',
                      style: kHeadingStyle,
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    InfoTextField(
                      hintText: 'Email',
                      keyBoardType: TextInputType.text,
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InfoTextField(
                      hintText: 'Password',
                      keyBoardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        password1 = value;
                      },
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InfoTextField(
                      hintText: 'Password confirmation',
                      keyBoardType: TextInputType.datetime,
                      onChanged: (value) {
                        password2 = value;
                      },
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 40,
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
                text: 'Sign in',
                fonWeight: FontWeight.w700,
                fontSize: 12,
                onPressed: () async {
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password2);
                    if (newUser != null) {
                      Navigator.pushNamed(context, MainScreen.id);
                    }
                  } catch (e) {
                    print(e);
                  }
//                  Navigator.pushNamed(context, MainScreen.id);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  BackButton({this.onPressed});
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(0),
      minWidth: 12,
      height: 20,
      child: Icon(
        Icons.chevron_left,
        size: 45,
        color: Colors.grey,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
      highlightColor: kDarkBlue,
    );
  }
}

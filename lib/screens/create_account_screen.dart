import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twitter_clone/constants.dart';
import 'package:twitter_clone/widgets/info_textField.dart';
import 'package:twitter_clone/widgets/rounded_button.dart';
import 'package:twitter_clone/screens/main_screen.dart';

class CreateAccountScreen extends StatelessWidget {
  static const id = 'create account screen';

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
              hintText: 'name',
              keyBoardType: TextInputType.text,
            ),
            SizedBox(
              height: 30,
            ),
            InfoTextField(
              hintText: 'Phone number or email address',
              keyBoardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 30,
            ),
            InfoTextField(
              hintText: 'date of birth',
              keyBoardType: TextInputType.datetime,
            ),
            SizedBox(
              height: 40,
            ),
            RoundedButton(
              width: 275,
              height: 41,
              borderRadius: 20,
              text: 'Create account',
              fonWeight: FontWeight.w700,
              fontSize: 15,
              onPressed: () {
                Navigator.pushNamed(context, MainScreen.id);
              },
            ),
          ],
        ),
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

//
//DateTime selectedDate = DateTime.now();
//
//TextEditingController _date = new TextEditingController();
//
//Future<Null> _selectDate(BuildContext context) async {
//  final DateTime picked = await showDatePicker(
//    context: context,
//    initialDate: selectedDate,
//    firstDate: DateTime(1901),
//    lastDate: DateTime(2021),
//  );
//  if (picked != null && picked != selectedDate) {
//    setState(() {
//      selectedDate = picked;
//      _date.value = TextEditingValue(text: picked.toString());
//    });
//  }
//}

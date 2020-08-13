import 'package:flutter/material.dart';
import 'package:twitter_clone/constants.dart';

class InfoTextField extends StatelessWidget {
  InfoTextField({this.hintText, this.keyBoardType});
  @required
  final String hintText;
  final TextInputType keyBoardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
        keyboardType: keyBoardType,
        style: TextStyle(color: Colors.white),
        decoration: kTextFieldDecoration.copyWith(hintText: hintText),
      ),
    );
  }
}

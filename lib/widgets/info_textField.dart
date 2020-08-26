import 'package:flutter/material.dart';
import 'package:twitter_clone/constants.dart';

class InfoTextField extends StatelessWidget {
  InfoTextField(
      {this.hintText,
      this.keyBoardType,
      this.onChanged,
      this.obscureText = false});
  @required
  final String hintText;
  final TextInputType keyBoardType;
  final Function onChanged;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
        onChanged: onChanged,
        autofocus: true,
        keyboardType: keyBoardType,
        style: TextStyle(color: Colors.white),
        decoration: kTextFieldDecoration.copyWith(hintText: hintText),
        obscureText: obscureText,
      ),
    );
  }
}

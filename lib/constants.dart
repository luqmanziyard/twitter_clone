import 'package:flutter/material.dart';

const kLightBlue = Color(0xff1D8DEE);
const kDarkBlue = Color(0xff1B2737);
const kBlack = Color(0xff151E29);
const kGrey = Colors.blueGrey;
const kRed = Color(0xffFB3958);

const kHintTextStyle = TextStyle(
  color: Colors.grey,
  fontSize: 12,
);

const kTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.only(top: 20),
  hintText: 'Enter your text',
  hintStyle: TextStyle(
    color: Colors.grey,
    fontSize: 12,
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 2),
  ),
  border: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
  ),
);

const kHeadingStyle = TextStyle(
  color: Colors.white,
  fontSize: 25,
  fontWeight: FontWeight.w700,
);

const double kIconButtonsSize = 15;

const double kIconButtonGapSize = 60;

const kHeaderStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w600,
  fontSize: 18,
);

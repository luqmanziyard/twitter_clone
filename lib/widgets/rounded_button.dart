import 'package:flutter/material.dart';
import 'package:twitter_clone/constants.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({
    @required this.height,
    @required this.width,
    @required this.text,
    @required this.fontSize,
    @required this.borderRadius,
    @required this.onPressed,
    @required this.fonWeight,
  });
  final double height;
  final double width;
  final String text;
  final double fontSize;
  final double borderRadius;
  final Function onPressed;
  final FontWeight fonWeight;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Container(
        padding: EdgeInsets.only(top: 10),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: kLightBlue,
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: fonWeight,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

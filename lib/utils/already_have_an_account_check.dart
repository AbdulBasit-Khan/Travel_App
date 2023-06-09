import 'package:flutter/material.dart';
import 'package:travel_app_template/utils/strings.dart';


class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Color color;
  final Color leftTextColor;
  final VoidCallback onPressed;

  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.color,
    required this.leftTextColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don’t have an Account ? " : "Already have an Account ? ",
          style: TextStyle(color: leftTextColor),
        ),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            login ? Strings.signUp : Strings.signIn,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}

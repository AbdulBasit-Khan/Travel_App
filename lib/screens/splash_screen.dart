import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_app_template/utils/colors_const.dart';
import 'package:travel_app_template/utils/common_functions.dart';
import 'package:travel_app_template/utils/strings.dart';
import 'package:travel_app_template/walkthrough/travel_walkthrough.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 8),
        () => Navigator.of(context).pushReplacement(
            CommonFunctions.pushWithRightAnimation(child: const TravelWalkThrough(),duration: const Duration(milliseconds: 1200))
           ));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,


            // stops: [0.1, 0.5],
            colors: [
            ColorsConstants.amberColor.withOpacity(1),
              ColorsConstants.amberColor],
          ),
        //  color: Color(0xffffffff)
        ),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.1+50,),
                Lottie.asset('assets/images/splash_loading.json',height: MediaQuery.of(context).size.height*0.3+50,width: MediaQuery.of(context).size.height*0.3+50,repeat: true),
                const SizedBox(height: 80,),
                 Text(Strings.splashText,textAlign:TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                ),
              ],
            ),

          ],
        )
      ),

    );
  }
}

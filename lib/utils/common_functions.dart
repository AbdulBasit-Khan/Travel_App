import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_template/provider/app_provider.dart';
import 'package:travel_app_template/utils/page_transation/enum.dart';
import 'package:travel_app_template/utils/page_transation/page_transition.dart';


import 'colors_const.dart';
import 'const.dart';
  TextStyle themeTitleStyle = TextStyle(
  

   fontWeight: FontWeight.w600,
  fontSize: 20,
  color:ColorsConstants.darkBG
);
class CommonFunctions{

  static String apiKey="AIzaSyDr4aP_rczqVSLo86cMdinyPs-tIFlh9AE";
  static TextStyle titleStyle =
  const TextStyle(letterSpacing: 1.2, fontSize: 20);

  static TextStyle themeSubTitleStyle = const TextStyle(
    fontSize: 12,
    letterSpacing: 1.1,
    height: 1.2,
    fontWeight: FontWeight.w200,
  );
  TextStyle commonStyle(){

    return GoogleFonts.pacifico();

  }
  static PageTransition pushWithRightAnimation({ required Widget child,required Duration duration})
  {
    return PageTransition(child: child,  type: PageTransitionType.rightToLeft,duration:duration);
  }

  static PageTransition pushWithTopAnimation({ required Widget child,required Duration duration})
  {
    return PageTransition(child: child,  type: PageTransitionType.bottomToTop,duration:duration);
  }


  static PageTransition pushWithFadeAnimation({ required Widget child,required Duration duration})
  {
    return PageTransition(child: child,  type: PageTransitionType.fade,duration:duration);
  }



  static bool isLightTheme(BuildContext context) {
    bool isLightTheme =
        Provider.of<AppProvider>(context).theme == Constants.lightTheme;
    return isLightTheme;
  }
  static int getRealIndex(int position, int base, int? length) {
    final int offset = position - base;
    return remainder(offset, length);
  }
  static int remainder(int input, int? source) {
    if (source == 0) return 0;
    final int result = input % source!;
    return result < 0 ? source + result : result;
  }
  static Widget switchWidget(BuildContext context) {
    return Switch(
      inactiveTrackColor: Colors.grey,
      inactiveThumbColor: Theme.of(context).primaryColor,
      value: Provider.of<AppProvider>(context).theme == Constants.lightTheme
          ? false
          : true,
      onChanged: (v) async {
        if (v) {
          Provider.of<AppProvider>(context, listen: false)
              .setTheme(Constants.darkTheme, "dark");
        } else {
          Provider.of<AppProvider>(context, listen: false)
              .setTheme(Constants.lightTheme, "light");
        }
      },
      activeColor: Theme.of(context).colorScheme.secondary,
    );
  }


}

const headerStyle = TextStyle( fontSize: 18, fontWeight: FontWeight.w600);
const titleStyle = TextStyle( fontSize: 16, fontWeight: FontWeight.bold);
const subtitleStyle = TextStyle(color: Colors.grey, fontSize: 12);
//const monthStyle = TextStyle(color: ColorsConstants.appColor, fontSize: 16, fontWeight: FontWeight.w500);


const String devMausam = 'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/mausam%2Fprofile.jpg?alt=media&token=83fa8b83-f53b-489c-a799-ca5d5aceae7b';

const Color furnitureCateDisableColor = Color(0xFF939BA9);

const List profileItems = [
  {'count': '846', 'name': 'Collect'},
  {'count': '51', 'name': 'Attention'},
  {'count': '267', 'name': 'Track'},
  {'count': '39', 'name': 'Coupons'},
];
class ProfileMenuModel {
  String title;
  String subTitle;
  IconData icon;
  Color iconColor;
  bool isDarkTheme;
  VoidCallback onTap;
  ProfileMenuModel({required this.icon,required this.title, required this.iconColor,required this.subTitle,required this.isDarkTheme,required this.onTap});
}

class ProfileCategory {
  String name;
  IconData icon;
  int number;
  ProfileCategory({required this.icon, required this.name,required  this.number});
}


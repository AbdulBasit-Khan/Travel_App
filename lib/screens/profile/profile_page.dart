import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app_template/screens/profile/edit_profile.dart';
import 'package:travel_app_template/screens/profile/privacy_policy.dart';
import 'package:travel_app_template/screens/profile/setting/address_screen.dart';
import 'package:travel_app_template/screens/profile/setting/setting_screen.dart';
import 'package:travel_app_template/utils/colors_const.dart';
import 'package:travel_app_template/utils/common_functions.dart';
import 'package:travel_app_template/utils/strings.dart';

import 'notification_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        title:  Text(Strings.yourProfile,style: themeTitleStyle,),

      ),
      body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
        child: Material(
          color: Theme.of(context).backgroundColor,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 10.0,
            ),
            child: Column(
              //mainAxisSize: M ainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                ProfileDetail(),
                SizedBox(height: 20,),
                ProfileMenu(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TitleLarge extends StatelessWidget {
  final String title;

  const TitleLarge({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 40.0,
            letterSpacing: 2.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}



// class Category extends StatelessWidget {
//   final ProfileCategory category;
//
//   const Category({Key? key, required this.category}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         Stack(
//           clipBehavior: Clip.none, children: <Widget>[
//             GestureDetector(
//               onTap: () {
//                 },
//               child: Container(
//                 padding: const EdgeInsets.all(10.0),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: ColorsConstants.profileInfoBackground,
//                 ),
//                 child: Icon(
//                   category.icon,
//                   // size: 20.0,
//                 ),
//               ),
//             ),
//             category.number > 0
//                 ? Positioned(
//                     right: -5.0,
//                     child: Container(
//                       padding: const EdgeInsets.all(5.0),
//                       decoration: BoxDecoration(
//                         color: ColorsConstants.profileInfoBackground,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Text(
//                         category.number.toString(),
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 10.0,
//                         ),
//                       ),
//                     ),
//                   )
//                 : const SizedBox(),
//           ],
//         ),
//         const SizedBox(
//           height: 10.0,
//         ),
//         Text(
//           category.name,
//           style: const TextStyle(
//             fontSize: 13.0,
//           ),
//         )
//       ],
//     );
//   }
// }

class MenuItem extends StatelessWidget {
  final ProfileMenuModel menu;

  const MenuItem({Key? key, required this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: ()=>menu.onTap(),
      child: Card(
        margin:const EdgeInsets.only(bottom: 10),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          height: deviceSize.height * 0.09,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              30.0,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child:Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: menu.iconColor,
                        ),
                        child: Icon(
                          menu.icon,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                menu.title,
                                style: const TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  menu.subTitle,
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ) ,
              )
              ,
              menu.isDarkTheme?CommonFunctions.switchWidget(context):
              Icon(
                Icons.chevron_right,
                color: ColorsConstants.profileItemColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Material(
      borderRadius: const BorderRadius.all(
        Radius.circular(20.0),
      ),
      elevation: 10.0,
      child: Container(
        height: deviceSize.height * 0.2,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          color: ColorsConstants.appColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                const ProfileImage(
                  height: 60.0,
                  width: 60.0,
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children:  <Widget>[
                        const Text(
                          'Masami Ramayana',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>const EditProfilePage()));
                          },
                          child: const Icon(
                            Icons.border_color,
                            color: Colors.white,
                            size: 15.0,
                          ),
                        )
                      ],
                    ),
                     Text(
                      Strings.treadSetter,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                for (var item in profileItems)
                  Column(
                    children: <Widget>[
                      Text(
                        item['count'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        item['name'],
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  final double height, width;
  final Color color;

  const ProfileImage(
      {Key? key, this.height = 100.0, this.width = 100.0, this.color = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ColorsConstants.appColor,
        image: const DecorationImage(
          image: NetworkImage(devMausam),
          fit: BoxFit.contain,
        ),
        border: Border.all(
          color: color,
          width: 3.0,
        ),
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProfileMenuModel> profileMenuList = [
      ProfileMenuModel(
          title: Strings.privacy,
          subTitle: Strings.privacyDes,
          iconColor: ColorsConstants.profileColor1,
          icon: Icons.lock,
          isDarkTheme: false,
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>const PrivacyPolicyScreen()));
          }
      ),
      ProfileMenuModel(
          title: Strings.address,
          subTitle:Strings.addressDec,
          iconColor: ColorsConstants.profileColor2,
          icon: Icons.location_on,
          isDarkTheme: false,
          onTap: (){
             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AddressScreen()));
          }
      ),

      ProfileMenuModel(
          title: Strings.setting,
          subTitle: Strings.settingDes,
          iconColor: ColorsConstants.profileColor3,
          icon: Icons.settings,
          isDarkTheme: false,
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>const SettingsScreen()));
          }
      ),
      ProfileMenuModel(
          title: Strings.darkTheme,
          subTitle: Strings.darkThemeDec,
          iconColor: ColorsConstants.profileColor4,
          icon: Icons.wb_sunny,
          isDarkTheme: true,
          onTap: (){

          }
      ),
      ProfileMenuModel(
          title: Strings.notification,
          subTitle: Strings.notificationDes,
          iconColor: ColorsConstants.profileColor5,
          icon: Icons.notifications,
          isDarkTheme: false,
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>const NotificationScreen()));
          }
      ),
      ProfileMenuModel(
          title: Strings.logout,
          subTitle: Strings.logoutDes,
          iconColor: ColorsConstants.profileColor6,
          icon: FontAwesomeIcons.signOutAlt,
          isDarkTheme: false,
          onTap: (){

          }
      ),
    ];
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        for (var menu in profileMenuList)
          MenuItem(
            menu: menu,
          ),
      ],
    );
  }
}



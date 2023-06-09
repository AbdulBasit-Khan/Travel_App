import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_template/screens/dashboard_screen.dart';
import 'package:travel_app_template/screens/profile/profile_page.dart';
import 'package:travel_app_template/screens/search/search_screen.dart';
import 'package:travel_app_template/screens/trip_idea/trip_idea_screen.dart';
import 'package:travel_app_template/utils/colors_const.dart';
import 'package:travel_app_template/utils/screen_util.dart';

import 'custom_animated_bottom_bar.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;
  static  final List<Widget> _widgetOptions = <Widget>[
    const DashBoardScreen(),
     const SearchScreen(isBack: false,),
    const TripIdeaScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
          backgroundColor: Theme
              .of(context)
              .backgroundColor,
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: _buildBottomBar(context)
      );

  }
  _buildBottomBar(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.1+10,
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
            
          ),
          color: ColorsConstants.amberColor,
        ),
        child: Center(
          child: ClipRRect(
             
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: CustomAnimatedBottomBar(
              containerHeight: 100,
              items: <BottomNavyBarItem>[
                BottomNavyBarItem(
                  icon: Container(
                    decoration: BoxDecoration(
                      color: _selectedIndex == 0
                          ? Colors.white.withOpacity(0.2)
                          : Colors.transparent,
                      shape: BoxShape.rectangle,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                        "assets/icon/home_tab.png",
                        width: 20,
                        height: 20,
                        color: _selectedIndex == 0
                            ? Colors.white
                            : Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ),
                   title: const Text(""),
                ),
                BottomNavyBarItem(
                  icon: Container(
                    decoration: BoxDecoration(
                      color: _selectedIndex == 1
                          ? Colors.white.withOpacity(0.2)
                          : Colors.transparent,
                      shape: BoxShape.rectangle,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                        "assets/icon/search_tab.png",
                        width: 20,
                        height: 20,
                        color: _selectedIndex == 1
                            ? Colors.white
                            : Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ),
                  title: const Text("")

                ),
                BottomNavyBarItem(
                  icon: Container(
                    decoration: BoxDecoration(
                      color: _selectedIndex == 2
                          ? Colors.white.withOpacity(0.2)
                          : Colors.transparent,
                      shape: BoxShape.rectangle,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                        "assets/icon/trip_tab.png",
                        width: 20,
                        height: 20,
                        color: _selectedIndex == 2
                            ? Colors.white
                            : Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ),
                  title: const Text(""),
                ),
                BottomNavyBarItem(
                  icon: Container(
                    decoration: BoxDecoration(
                      color: _selectedIndex == 3
                          ? Colors.white.withOpacity(0.2)
                          : Colors.transparent,
                      shape: BoxShape.rectangle,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                        "assets/icon/user_tab.png",
                        width: 18,
                        height: 18,
                        color: _selectedIndex == 3
                            ? Colors.white
                            : Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ),
                  title: const Text("")
                ),

              ],
              backgroundColor: ColorsConstants.amberColor,
              onItemSelected: (int value) {
              setState(() {
                _selectedIndex = value;
              });
            },
            ),
          ),
        ),
      ),
    );
  }
}


class ScreenUtilInit extends StatelessWidget {
  /// A helper widget that initializes [ScreenUtil]
  const ScreenUtilInit({
    required this.builder,
    this.designSize = ScreenUtil.defaultSize,
    Key? key,
  }) : super(key: key);

  final Widget Function() builder;

  /// The [Size] of the device in the design draft, in dp
  final Size designSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, BoxConstraints constraints) {
      if (constraints.maxWidth != 0) {
        final Orientation orientation =
        constraints.maxWidth > constraints.maxHeight
            ? Orientation.landscape
            : Orientation.portrait;
        ScreenUtil.init(
          constraints,
          orientation: orientation,
          designSize: designSize,
        );
        return builder();
      }
      return Container();
    });
  }
}
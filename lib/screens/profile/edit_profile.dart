import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:travel_app_template/utils/colors_const.dart';
import 'package:travel_app_template/utils/common_functions.dart';


class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    bool isLightTheme = CommonFunctions.isLightTheme(context);
    return Scaffold(
      backgroundColor: const Color(0xffF8F8FA),
      body: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Container(
            height: 20 * MediaQuery.of(context).size.height / 50,
            decoration: BoxDecoration(color: ColorsConstants.appColor),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 30.0, top: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Edit Profile",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                      child: Stack(children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: const Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  devMausam
                              ))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Colors.white.withOpacity(0.7),
                            ),
                            color: ColorsConstants.appColor,
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ])),
                  SizedBox(
                    height: 3 * MediaQuery.of(context).size.height / 100,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 32 * MediaQuery.of(context).size.height / 100),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
              decoration:  BoxDecoration(
                  color: isLightTheme?Colors.white:Colors.black,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  )),
              child: SingleChildScrollView(
                child: Container(
                  color:isLightTheme? Colors.white:Colors.black,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                          color:isLightTheme? Colors.black.withOpacity(0.03):Colors.white.withOpacity(0.4),
                        ),
                        padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                        child: Theme(
                          data: ThemeData(
                            colorScheme: ThemeData().colorScheme.copyWith(
                                  primary: ColorsConstants.appColor,
                                ),
                          ),
                          child: TextFormField(
                            style: TextStyle(color:isLightTheme?Colors.black:Colors.white),
                            decoration:  InputDecoration(
                              focusColor: ColorsConstants.appColor,
                              border: InputBorder.none,
                              hintText: "enter full name",
                              hintStyle: TextStyle(color:isLightTheme?Colors.grey:Colors.white),
                              prefixIcon: Icon(Icons.person,color:isLightTheme?Colors.grey:Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius:  const BorderRadius.all(Radius.circular(30)),
                          color:isLightTheme? Colors.black.withOpacity(0.03):Colors.white.withOpacity(0.4),
                        ),
                        padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                        child: Theme(
                          data: ThemeData(
                            colorScheme: ThemeData().colorScheme.copyWith(
                                  primary: ColorsConstants.appColor,
                                ),
                          ),
                          child: TextFormField(
                            style: TextStyle(color:isLightTheme?Colors.black:Colors.white),
                            decoration:  InputDecoration(
                              focusColor: ColorsConstants.appColor,
                              border: InputBorder.none,
                              hintText: "enter email",
                              hintStyle: TextStyle(color:isLightTheme?Colors.grey:Colors.white),
                              prefixIcon: Icon(Icons.email,color:isLightTheme?Colors.grey:Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                          color: isLightTheme? Colors.black.withOpacity(0.03):Colors.white.withOpacity(0.4),
                        ),
                        padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                        child: Theme(
                          data: ThemeData(
                            colorScheme: ThemeData().colorScheme.copyWith(
                                  primary: ColorsConstants.appColor,
                                ),
                          ),
                          child: TextFormField(
                            style: TextStyle(color:isLightTheme?Colors.black:Colors.white),
                            decoration:  InputDecoration(
                              focusColor: ColorsConstants.appColor,
                              border: InputBorder.none,
                              hintStyle: TextStyle(color:isLightTheme?Colors.grey:Colors.white),
                              hintText: "enter password",
                              prefixIcon: Icon(Icons.lock,color:isLightTheme?Colors.grey:Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                          color: isLightTheme? Colors.black.withOpacity(0.03):Colors.white.withOpacity(0.4),
                        ),
                        padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                        child: Theme(
                          data: ThemeData(
                            colorScheme: ThemeData().colorScheme.copyWith(
                                  primary: ColorsConstants.appColor,
                                ),
                          ),
                          child: TextFormField(
                            style: TextStyle(color:isLightTheme?Colors.black:Colors.white),
                            decoration:  InputDecoration(
                              focusColor: ColorsConstants.appColor,
                              border: InputBorder.none,
                              hintStyle: TextStyle(color:isLightTheme?Colors.grey:Colors.white),
                              hintText: "enter location",
                              prefixIcon:  Icon(Icons.location_on_outlined,color:isLightTheme?Colors.grey:Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                          color: isLightTheme? Colors.black.withOpacity(0.03):Colors.white.withOpacity(0.4),
                        ),
                        padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                        child: Theme(
                          data: ThemeData(
                            colorScheme: ThemeData().colorScheme.copyWith(
                                  primary: ColorsConstants.appColor,
                                ),
                          ),
                          child: TextFormField(
                            style: TextStyle(color:isLightTheme?Colors.black:Colors.white),
                            decoration:  InputDecoration(
                              focusColor: ColorsConstants.appColor,
                              border: InputBorder.none,
                              hintStyle: TextStyle(color:isLightTheme?Colors.grey:Colors.white),
                              hintText: "enter address",
                              prefixIcon: Icon(Icons.streetview,color:isLightTheme?Colors.grey:Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                          color: isLightTheme? Colors.black.withOpacity(0.03):Colors.white.withOpacity(0.4),
                        ),
                        padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                        child: Theme(
                          data: ThemeData(
                            colorScheme: ThemeData().colorScheme.copyWith(
                                  primary: ColorsConstants.appColor,
                                ),
                          ),
                          child: TextFormField(
                            style: TextStyle(color:isLightTheme?Colors.black:Colors.white),
                            decoration:  InputDecoration(
                              focusColor: ColorsConstants.appColor,
                              border: InputBorder.none,
                              hintStyle: TextStyle(color:isLightTheme?Colors.grey:Colors.white),
                              hintText: "enter phone number",
                              prefixIcon: Icon(Icons.phone,color:isLightTheme?Colors.grey:Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: isLightTheme?Colors.black:Colors.white, //Color of the border
                                  style: BorderStyle.solid, //Style of the border
                                  width: 1, //width of the border
                                ),
                              ),
                              child:  Text("CANCEL",
                                  style: TextStyle(
                                      fontSize: 14,
                                      letterSpacing: 2.2,
                                      color: isLightTheme?Colors.black:Colors.white)),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            color: ColorsConstants.appColor,
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: const Text(
                              "SAVE",
                              style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 2.2,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 28,),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );


  }
}

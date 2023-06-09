import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app_template/utils/colors_const.dart';
import 'package:travel_app_template/utils/common_functions.dart';
import 'package:travel_app_template/utils/strings.dart';

import '../payment_screen.dart';
import '../show_dialog.dart';

class Gender {
  String name;
  int index;

  Gender(this.name, this.index);
}

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({Key? key}) : super(key: key);

  @override
  _HotelBookingScreenState createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  List<Gender> fList = [
    Gender(
      Strings.mySelf,
      1,
    ),
    Gender(
      Strings.someone,
      2,
    ),
  ];
  String radioItem = 'My Self';
  int id = 1;
  bool valueFirst = false;

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = CommonFunctions.isLightTheme(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        title:  Text(
          Strings.booking,
          style: themeTitleStyle,
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: ColorsConstants.lightGrey.withAlpha(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(color: Colors.grey.shade300,
              height: 1,),
              Padding(
                padding: const EdgeInsets.only(top: 15,right: 15,left: 15),
                child: Card(
                  color: Theme.of(context).backgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   Text(
                                   Strings.address1,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  RatingBarIndicator(
                                    rating: 3,
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star,
                                      color: ColorsConstants.amberColor,
                                    ),
                                    itemCount: 5,
                                    itemSize: 15.0,
                                    unratedColor:
                                        ColorsConstants.amberColor.withAlpha(50),
                                    direction: Axis.horizontal,
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                   Text(
                                    Strings.addressLocation,
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                  ),
                                ],
                              ),
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    //colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                                    image: NetworkImage(
                                        "https://images.unsplash.com/photo-1582719508461-905c673771fd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1100&q=80"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    width: 20,
                                    padding: const EdgeInsets.all(5),
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: ColorsConstants.amberColor,
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(5),
                                            bottomLeft: Radius.circular(5),
                                            topLeft: Radius.circular(5))),
                                    child: const Center(
                                      child: Text(
                                        "4",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10, top: 5),
                          child: Row(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        bottomLeft: Radius.circular(5))),
                                height: 30,
                                width: 30,
                                padding: const EdgeInsets.all(5),
                                child: Image.asset("assets/icon/security.png"),
                              ),
                              Container(
                                height: 30,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        bottomRight: Radius.circular(5)),
                                    border: Border.all(color: Colors.blue),
                                    color: Colors.blue.withAlpha(15)),
                                child:  Center(
                                  child: Text(
                                   Strings.hotelPrivacy,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Divider(
                          color: Colors.grey.withAlpha(30),
                          thickness: 2,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children:  [
                                      Text(
                                        Strings.checkIn,
                                        style: const TextStyle(
                                            color: Colors.grey, fontSize: 14),
                                      ),
                                      const Text(
                                        "12 PM",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  const Text(
                                    "23 Sep'21",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  const Text(
                                    "Thursday",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 10, right: 10),
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withAlpha(30),
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Center(
                                  child: Text(
                                    "1 Night",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: const [
                                        Text(
                                          "Check-out:",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 14),
                                        ),
                                        Flexible(
                                          child: Text(
                                            "11 AM",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        )

                                      ],
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    const Text(
                                      "24 Sep'21",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    const Text(
                                      "Friday",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.grey.withAlpha(30),
                          thickness: 2,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              Text(
                                Strings.guestRoom,
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800),
                              ),
                              Text(
                               Strings.hotelAdult,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.grey.withAlpha(30),
                          thickness: 2,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  Strings.classic,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.w800),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 5),
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: isLightTheme
                                            ? Colors.black.withAlpha(200)
                                            : Colors.white.withAlpha(200)),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Text(
                                      Strings.roomCancel,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: 14,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 5),
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: isLightTheme
                                            ? Colors.black.withAlpha(200)
                                            : Colors.white.withAlpha(200)),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    Strings.breakFast,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Icon(
                                      FontAwesomeIcons.checkDouble,
                                      color: ColorsConstants.amberColor,
                                      size: 10,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 18,
                                  ),
                                  Text(
                                    Strings.cancelIn,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: ColorsConstants.amberColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 30,
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                    color: ColorsConstants.amberColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white),
                                    ),
                                     Expanded(
                                      child: Center(
                                        child: Text(
                                          Strings.cancelFees,
                                          style: const TextStyle(
                                              fontSize: 13, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Now",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Text(
                                      "23 Sep",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Divider(
                                color: Colors.grey.withAlpha(30),
                                thickness: 2,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                               Text(
                                Strings.roomPolicy,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15,right: 15,left: 15),
                child: Card(
                    color: Theme.of(context).backgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Strings.roomNight,
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800),
                                ),
                                const Text(
                                  "₹ 4,464",
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                Strings.basePrice,
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15),
                            child: Divider(
                              color: Colors.grey.withAlpha(30),
                              thickness: 2,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Strings.tDiscount,
                                  style: TextStyle(
                                    color: ColorsConstants.amberColor,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "-₹ 2,500",
                                  style: TextStyle(
                                    color: ColorsConstants.amberColor,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            color: Colors.grey.withAlpha(30),
                            height: 2,
                          ),
                          Container(
                            color: Colors.blue.withAlpha(10),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:  [
                                  Text(
                                    Strings.priceDiscount,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const Text(
                                    "₹ 1,909",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.grey.withAlpha(30),
                            height: 2,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Service Fees",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "₹ 121",
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15),
                            child: Divider(
                              color: Colors.grey.withAlpha(30),
                              thickness: 2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:  [
                                Text(
                                  Strings.amountPaid,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                                const Text(
                                  "₹ 1,909",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15,right: 15,left: 15),
                child: Card(
                  color: Theme.of(context).backgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                         Text(
                          Strings.bookText,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: fList
                                  .map((data) => SizedBox(
                                        width: 130,
                                        child: RadioListTile(
                                          contentPadding: const EdgeInsets.all(0),
                                          title: Text(data.name),
                                          groupValue: id,
                                          activeColor: ColorsConstants.amberColor,
                                          value: data.index,
                                          onChanged: (val) {
                                            setState(() {
                                              radioItem = data.name;
                                              id = data.index;
                                            });
                                          },
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ],
                        ),
                        const Text(
                          "Name",
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextField(
                          onChanged: (text) {},
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            prefixIconConstraints:
                                const BoxConstraints(minWidth: 35, maxHeight: 35),
                            prefixIcon: Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 12.0, end: 5.0),
                              child: Icon(
                                Icons.person,
                                color: ColorsConstants.amberColor,
                              ),
                            ),
                            hintText: Strings.hintEmail,
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: (OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            )),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Email",
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextField(
                          onChanged: (text) {},
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            prefixIconConstraints:
                                const BoxConstraints(minWidth: 35, maxHeight: 35),
                            prefixIcon: Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 12.0, end: 5.0),
                              child: Icon(
                                Icons.email,
                                color: ColorsConstants.amberColor,
                              ),
                            ),
                            hintText: Strings.hintEmail,
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: (OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            )),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Phone Number",
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextField(
                          onChanged: (text) {},
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            prefixIconConstraints:
                                const BoxConstraints(minWidth: 35, maxHeight: 35),
                            prefixIcon: Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 12.0, end: 5.0),
                              child: Icon(
                                Icons.phone,
                                color: ColorsConstants.amberColor,
                              ),
                            ),
                            hintText: Strings.hintEmail,
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: (OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            )),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              activeColor: ColorsConstants.amberColor,
                              value: valueFirst,
                              onChanged: (bool? value) {
                                setState(() {
                                  valueFirst = value!;
                                });
                              },
                            ),
                            const Text(
                              'I have GST number ',
                              style: TextStyle(fontSize: 17.0),
                            ),
                            Text(
                              "(Optinal)",
                              style: TextStyle(color: Colors.grey.shade400),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  text: TextSpan(
                      text: Strings.bookProcess,
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                      children: <TextSpan>[
                        TextSpan(
                            text: Strings.userAgreement,
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 13,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {

                                // open desired screen
                              }),
                        const TextSpan(
                          text: 'and ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                        TextSpan(
                            text: Strings.cancelPolicy,
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 13,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // open desired screen
                              })
                      ]),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => PaymentScreen(onTap: () async {
                          await showSuccessDialog(context,
                              title:  Text(Strings.booked),
                              content:  Text('Hotel Booked successfully',style: TextStyle(color: isLightTheme?Colors.black:Colors.white),),
                              action: DialogAction(
                                  title: const Text('Success'),
                                  value: null, action: (BuildContext context) {
                                    Navigator.of(context).pop();
                              }), barrierColor: Colors.black.withOpacity(0.8));
                        },)));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10,right: 15,left: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorsConstants.amberColor),
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child:  Center(
                      child: Text(
                          Strings.continueText,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<Future<T?>> showSuccessDialog<T>(BuildContext context, {
    Widget icon = const Icon(Icons.check_circle),
    Widget ?title,
    Widget? content,
    required DialogAction<T> action,
    bool barrierDismissible = false,
    required Color barrierColor,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    }) {

    return showResultDialog(context,
        backgroundColor: ColorsConstants.amberColor,
        textColor: Colors.white,
        icon: icon,
        title: title,// ?? Text(StandardDialogsLocalizations.of(context)[ResultDialogLocalizationsEnum.success])),
        content: content!,
        action: action,
        barrierDismissible: barrierDismissible,
        barrierColor: barrierColor,
        useSafeArea: useSafeArea,
        useRootNavigator: useRootNavigator,
        );

  }

   Future<Future<T?>> showResultDialog<T>(BuildContext context, {
    required Color backgroundColor,
    required Color textColor,
    required Widget icon,
    title,
    required Widget content,
    required DialogAction<T> action,
    bool barrierDismissible = true,
    required Color barrierColor,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    }) async {

    return showDialog<T>(
        context: context,
        builder: (context) {

          return ResultDialog(
              backgroundColor: backgroundColor,
              textColor: textColor,
              icon: icon,
              title: title,
              content: content,
              action: action
          );

        },
        barrierDismissible: true,
        barrierColor: barrierColor,
        useSafeArea: useSafeArea,
        useRootNavigator: useRootNavigator,

    );

  }

}

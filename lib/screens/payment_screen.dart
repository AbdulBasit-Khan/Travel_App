import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:travel_app_template/models/payment_model.dart';

import 'package:travel_app_template/utils/colors_const.dart';
import 'package:travel_app_template/utils/common_functions.dart';
import 'package:travel_app_template/utils/strings.dart';

class PaymentScreen extends StatefulWidget {
  final VoidCallback onTap;
  const PaymentScreen({Key? key,required this.onTap}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int? selectedId;

  @override
  Widget build(BuildContext context) {
    var isDarkTheme = !CommonFunctions.isLightTheme(context);
    var opposite = isDarkTheme ? Colors.white : Colors.black;
    // ignore: avoid_unnecessary_containers
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme
              .of(context)
              .backgroundColor,
          title:  Text("Payment", style: themeTitleStyle,
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
              children: [
                Divider(color: Colors.grey.shade300,),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15, vertical: 15,),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(Strings.paymentMethod,
                            style: TextStyle(fontSize: 16, color: opposite)),
                        const SizedBox(height: 5),
                        Text(
                          Strings.paymentMethod,
                          style: TextStyle(
                            fontSize: 12,
                            color: isDarkTheme
                                ? Colors.white.withOpacity(0.6)
                                : ColorsConstants.grey.withOpacity(0.6),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Column(
                          children: <Widget>[
                            for (int i = 0; i < paymentMethodList.length; i++)
                              Column(
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedId = paymentMethodList[i].id;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: paymentMethodList[i].id ==
                                              selectedId
                                              ? isDarkTheme ? Theme
                                              .of(context)
                                              .primaryColor
                                              .withOpacity(0.12) : ColorsConstants
                                              .cartGrey
                                              : Colors.transparent),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 10),
                                        child: Row(
                                          children: <Widget>[
                                            Theme(
                                              data: Theme.of(context).copyWith(
                                                  unselectedWidgetColor: opposite,
                                                  disabledColor: Colors.blue),
                                              child: Radio(
                                                  value: paymentMethodList[i].id!,
                                                  groupValue: selectedId,
                                                  onChanged: (int ?i) {
                                                    setState(() {
                                                      selectedId = i;
                                                    });
                                                  }),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: <Widget>[
                                                  paymentMethodList[i].isText!
                                                      ? Text(
                                                    paymentMethodList[i].name!,
                                                    style: TextStyle(
                                                        color: opposite),)
                                                      : Image.asset(
                                                    paymentMethodList[i].image!,
                                                    width: 120,
                                                    height: 35,
                                                    fit: BoxFit.scaleDown,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Divider(height: 1)
                                ],
                              )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                Strings.subTotal,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: isDarkTheme ? Colors.white : Colors
                                        .black,
                                    fontWeight: FontWeight.w300),
                              ),
                              Text("\$ 300.0",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: isDarkTheme ? Colors.white : Colors
                                          .black,
                                      fontWeight: FontWeight.w300))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                Strings.discount,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: isDarkTheme ? Colors.white : Colors
                                        .black,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text("\$ 100",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: isDarkTheme ? Colors.white : Colors
                                          .black,
                                      fontWeight: FontWeight.w400))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(Strings.total,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: isDarkTheme ? Colors.white : Colors
                                          .black,
                                      fontWeight: FontWeight.w700)),
                              Text(
                                "\$ 800",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: isDarkTheme ? Colors.white : Colors
                                        .black,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.underline),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        Row(children: [
                          Expanded(
                            child: ButtonTheme(
                              height: 45,
                              child: MaterialButton(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                onPressed: () => widget.onTap(),
                                textColor: isDarkTheme ? Colors.black : Colors
                                    .white,
                                color: ColorsConstants.amberColor,
                                child: const Text(
                                  "Book", style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ]),

                      ],
                    ),
                  ),
                ),
              ]
          ),
        ));
  }

  }

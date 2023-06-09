import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_app_template/utils/colors_const.dart';
import 'package:travel_app_template/utils/common_functions.dart';
import 'package:travel_app_template/utils/strings.dart';
import 'book_flight.dart';

class FlightScreen extends StatefulWidget {
  const FlightScreen({Key? key}) : super(key: key);

  @override
  _FlightScreenState createState() => _FlightScreenState();
}

class _FlightScreenState extends State<FlightScreen> {
  @override
  Widget build(BuildContext context) {
    bool isLightTheme=CommonFunctions.isLightTheme(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          color: Colors.transparent,
          child: Column(
            children: [
              Stack(children: [
                Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height / 1.9,
                  child: Lottie.asset("assets/svg/flight_animation.json"),
                ),
                 Positioned(
                  top: MediaQuery.of(context).size.height*0.06,
                    left: MediaQuery.of(context).size.height*0.02,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                   Icons.arrow_back,
                  color: Colors.black,
                ),
                    ))
              ]),
              const SizedBox(
                height: 10,
              ),
               Text(
                Strings.bookFlight,
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/flight_icon.png",
                      height: 30,
                      width: 30,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      "Odessa,",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      "Ukraine",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 40,
                    ),
                    Container(
                      height: 1,
                      width: 130,
                      color: isLightTheme?Colors.grey.shade300:ColorsConstants.dividerColor,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: ColorsConstants.orange,
                          shape: BoxShape.circle),
                      child: Center(
                        child: Image.asset(
                          "assets/icon/sort_icon.png",
                          color: Colors.white,
                          height: 15,
                          width: 15,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/flight_icon.png",
                      height: 30,
                      width: 30,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      "Los Angeles,",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      "USA",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 85),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: const [
                            Text("Fr 6 Mar",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                )),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.calendar_today,
                              size: 20,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 1,
                          width: 100,
                          color: isLightTheme?Colors.grey.shade300:ColorsConstants.dividerColor,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text("Fr 6 Mar",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.grey.shade400)),
                            const SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.calendar_today,
                              color: Colors.grey.shade400,
                              size: 20,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 1,
                          width: 100,
                          color: isLightTheme?Colors.grey.shade300:ColorsConstants.dividerColor,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const BookFlightScreen()));
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 45),
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorsConstants.amberColor),
                  child:  Center(
                    child: Text(
                      Strings.findRoute,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
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
}

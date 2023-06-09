import 'package:flutter/material.dart';
import 'package:travel_app_template/models/car_model.dart';
import 'package:travel_app_template/utils/colors_const.dart';
import 'package:travel_app_template/utils/common_functions.dart';

import '../payment_screen.dart';
import '../show_dialog.dart';

class CarDetailsScreen extends StatefulWidget {
  final CarModel car;

  const CarDetailsScreen({Key? key, required this.car}) : super(key: key);

  @override
  _CarDetailsScreenState createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  int selectedIndex = 0;

  int _currentImage = 0;

  List<Widget> buildPageIndicator(isLightTheme) {
    List<Widget> list = [];
    for (var i = 0; i < widget.car.images.length; i++) {
      list.add(buildIndicator(i == _currentImage, isLightTheme));
    }
    return list;
  }

  Widget buildIndicator(bool isActive, isLightTheme) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 6),
      height: 8,
      width: isActive ? 20 : 8,
      decoration: BoxDecoration(
        color: isActive
            ? isLightTheme
                ? Colors.black
                : Colors.white
            : Colors.grey[400],
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = CommonFunctions.isLightTheme(context);
    return Scaffold(
      // backgroundColor: Colors.white,
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.arrow_back,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                    width: 45,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: ColorsConstants.amberColor,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.bookmark_border,
                                      color: Colors.white,
                                      size: 22,
                                    )),
                                const SizedBox(
                                  width: 16,
                                ),
                                Container(
                                    width: 45,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                      border: Border.all(
                                        color: Colors.grey[300]!,
                                        width: 1,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.share,
                                      size: 22,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          widget.car.model,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          widget.car.brand,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Expanded(
                        child: PageView(
                          physics: const BouncingScrollPhysics(),
                          onPageChanged: (int page) {
                            setState(() {
                              _currentImage = page;
                            });
                          },
                          children: widget.car.images.map((path) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Hero(
                                tag: widget.car.model,
                                child: Image.asset(
                                  path,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      widget.car.images.length > 1
                          ? Container(
                              margin: const EdgeInsets.symmetric(vertical: 16),
                              height: 30,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: buildPageIndicator(isLightTheme),
                              ),
                            )
                          : Container(),
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = 0;
                                  });
                                },
                                child: buildPricePerPeriod(0, "12", "4.350",
                                    selectedIndex, isLightTheme),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = 1;
                                  });
                                },
                                child: buildPricePerPeriod(
                                    1, "6", "4.800", selectedIndex, isLightTheme),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = 2;
                                  });
                                },
                                child: buildPricePerPeriod(
                                    2, "1", "5.100", selectedIndex, isLightTheme),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: isLightTheme ? Colors.grey[100] : Colors.black,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: Text(
                        "Specifications",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      padding: const EdgeInsets.only(
                        top: 12,
                        left: 16,
                      ),
                      margin: const EdgeInsets.only(bottom: 16),
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          buildSpecificationCar(
                              "Color", "White", isLightTheme, context),
                          buildSpecificationCar(
                              "Gearbox", "Automatic", isLightTheme, context),
                          buildSpecificationCar(
                              "Seat", "4", isLightTheme, context),
                          buildSpecificationCar(
                              "Motor", "v10 2.0", isLightTheme, context),
                          buildSpecificationCar("Speed (0-100)", "3.2 sec",
                              isLightTheme, context),
                          buildSpecificationCar(
                              "Top Speed", "121 mph", isLightTheme, context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isLightTheme ? Colors.white : Colors.black,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "12 Month",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: const [
                    Text(
                      "USD 4,350",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "per month",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PaymentScreen(
                          onTap: () async {
                            await showSuccessDialog(context,
                                title: const Text('Booked'),
                                content: Text(
                                  'Car Booked successfully',
                                  style: TextStyle(
                                      color: isLightTheme
                                          ? Colors.black
                                          : Colors.white),
                                ),
                                action: DialogAction(
                                    title: const Text('Success'),
                                    value: null,
                                    action: (BuildContext context) {
                                      Navigator.of(context).pop();
                                    }),
                                barrierColor: Colors.black.withOpacity(0.8));
                          },
                        )));
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: ColorsConstants.amberColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "Book this car",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Future<T?>> showSuccessDialog<T>(
    BuildContext context, {
    Widget icon = const Icon(Icons.check_circle),
    Widget? title,
    Widget? content,
    required DialogAction<T> action,
    bool barrierDismissible = false,
    required Color barrierColor,
    bool useSafeArea = true,
    bool useRootNavigator = true,
  }) {
    return showResultDialog(
      context,
      backgroundColor: ColorsConstants.amberColor,
      textColor: Colors.white,
      icon: icon,
      title: title,
      // ?? Text(StandardDialogsLocalizations.of(context)[ResultDialogLocalizationsEnum.success])),
      content: content!,
      action: action,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
    );
  }

  Future<Future<T?>> showResultDialog<T>(
    BuildContext context, {
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
            action: action);
      },
      barrierDismissible: true,
      barrierColor: barrierColor,
      useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
    );
  }

  Widget buildPricePerPeriod(
      int id, String months, String price, int index, isLightTheme) {
    return Container(
      height: 110,
      width: 110,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: id == index
            ? ColorsConstants.amberColor
            : isLightTheme
                ? Colors.white
                : Colors.black,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        border: Border.all(
          color: Colors.grey[300]!,
          width: id == index ? 0 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            months + " Month",
            style: TextStyle(
              color: id == index
                  ? Colors.white
                  : isLightTheme
                      ? Colors.black
                      : Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Text(
            price,
            style: TextStyle(
              color: id == index
                  ? Colors.white
                  : isLightTheme
                  ? Colors.black
                  : Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            "USD",
            style: TextStyle(
              color: id == index
                  ? Colors.white
                  : isLightTheme
                      ? Colors.black
                      : Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSpecificationCar(
      String title, String data, isLightTheme, context) {
    return Container(
      width: 130,
      decoration: BoxDecoration(
        color: isLightTheme ? Colors.white : Theme.of(context).backgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            data,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

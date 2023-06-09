import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travel_app_template/carousel/carousel_pro.dart';
import 'package:travel_app_template/models/popular_model.dart';
import 'package:travel_app_template/screens/hotel/hotel_booking.dart';
import 'package:travel_app_template/utils/colors_const.dart';
import 'package:travel_app_template/utils/common_functions.dart';

class HotelDetailScreen extends StatefulWidget {
  const HotelDetailScreen({Key? key, required this.model}) : super(key: key);
  final PopularModel model;

  @override
  _HotelDetailScreenState createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen>
    with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? controller;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: 0.0, end: 18.0).animate(controller!)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    bool isLightTheme = CommonFunctions.isLightTheme(context);
    Widget carousel = const Carousel(
      boxFit: BoxFit.cover,
      images: [
        NetworkImage(
            'https://travel.usnews.com/dims4/USNEWS/a798492/2147483647/resize/445x280%5E%3E/crop/445x280/quality/85/?url=https://travel.usnews.com/images/edited_south_island_nz_getty_irma_ferreira_445x280_dxgXWlc.jpg'),
        NetworkImage(
            'https://images.unsplash.com/photo-1564501049412-61c2a3083791?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1100&q=80'),
        NetworkImage(
            'https://images.unsplash.com/photo-1564013799919-ab600027ffc6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1100&q=80'),
        NetworkImage(
            'https://images.unsplash.com/photo-1613490493576-7fde63acd811?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1100&q=80'),
      ],
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(seconds: 1),
    );
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight / 2.5,
              child: ClipRRect(
                child: Stack(
                  children: [
                    carousel,
                    Container(
                      height: 350,
                      color: Colors.black12,
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                              left: 24,
                              right: 24,
                            ),
                            child: Row(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: 47.6,
                                      width: 47.6,
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey.withOpacity(0.5),
                                      ),
                                      child: const Icon(
                                        Icons.arrow_back,
                                        size: 24,
                                        color: Colors.white,
                                      ),
                                    )),
                                const Spacer(),
                                Container(
                                  height: 47.6,
                                  width: 47.6,
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  child: const Icon(
                                    Icons.favorite,
                                    size: 24,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 30,
                    ),
                    _buildTitle(isLightTheme, widget.model),
                    _buildLocation(isLightTheme, widget.model.tagLine),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Text(
                        'Amenities',
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            decoration: TextDecoration.none,

                            color: isLightTheme ? Colors.black : Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 17),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 50),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(left: 10),
                          scrollDirection: Axis.horizontal,
                          itemCount: listOfAmenities.length,
                          itemBuilder: (_, index) => _buildAmenitie(
                              listOfAmenities[index], isLightTheme),
                        ),
                      ),
                    ),
                    Divider(
                      height: 10,
                      thickness: 2,
                      color: isLightTheme
                          ? ColorsConstants.lightWhite
                          : ColorsConstants.lightBlack,
                    ),
                    _buildCheckOutDays(isLightTheme, widget.model),
                    _buildCheckOutTime(isLightTheme, widget.model),
                    Divider(
                      height: 30,
                      thickness: 2,
                      color: isLightTheme
                          ? ColorsConstants.lightWhite
                          : ColorsConstants.lightBlack,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Text(
                        "Where you'll be",
                        style: TextStyle(
                            decoration: TextDecoration.none,

                            color: isLightTheme ? Colors.black : Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 18),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      height: 220,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: NetworkImage(
                              "https://images.squarespace-cdn.com/content/v1/54ff63f0e4b0bafce6932642/1572988511564-XPIO8NOVBL7U5CQ1O1QY/Google+Maps.gif?format=750w"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: ImageIcon(
                          AssetImage( "assets/icon/location.png"),
                          color:ColorsConstants.darkBG,
                          size:50
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Text(
                        widget.model.location,
                        style: TextStyle(
                            decoration: TextDecoration.none,

                            color: isLightTheme ? Colors.black : Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ),
                    Divider(
                      height: 30,
                      thickness: 2,
                      color: isLightTheme
                          ? ColorsConstants.lightWhite
                          : ColorsConstants.lightBlack,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Text(
                        "About " + widget.model.name,
                        style: TextStyle(
                            decoration: TextDecoration.none,

                            color: isLightTheme ? Colors.black : Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 18),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Text(
                        widget.model.description,
                        style: TextStyle(
                            decoration: TextDecoration.none,

                            color: isLightTheme ? Colors.black : Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                )),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: const [
                    Text(
                      "45 \$",
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "/ night",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 15,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "4.66(577)",
                    )
                  ],
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HotelBookingScreen()));
              },
              child: Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColorsConstants.amberColor),
                child: const Center(
                  child: Text(
                    "Book Now",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildCheckOutTime(bool isLightTheme, PopularModel hotel) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Check-in:',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14.0,

                decoration: TextDecoration.none,
                color: isLightTheme ? Colors.black87 : Colors.white70),
            maxLines: 1,
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            "10 AM",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.0,

                decoration: TextDecoration.none,
                color: isLightTheme ? Colors.black87 : Colors.white70),
            maxLines: 1,
            textAlign: TextAlign.left,
          ),
          Text(
            ' | ',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.0,

                decoration: TextDecoration.none,
                color: isLightTheme ? Colors.black87 : Colors.white70),
            maxLines: 1,
            textAlign: TextAlign.left,
          ),
          Text(
            'Check-out:',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14.0,
                decoration: TextDecoration.none,

                color: isLightTheme ? Colors.black87 : Colors.white70),
            maxLines: 1,
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            "3.30 PM",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.0,

                decoration: TextDecoration.none,
                color: isLightTheme ? Colors.black87 : Colors.white70),
            maxLines: 1,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  _buildTitle(bool isLightTheme, PopularModel model) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Text(
            model.name,
            maxLines: 3,
            textAlign: TextAlign.left,
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                decoration: TextDecoration.none,
                color: isLightTheme ? Colors.black : Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 20),
          )),
          Row(
            children: [
              RatingBarIndicator(
                rating: model.rating,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: ColorsConstants.amberColor,
                ),
                itemCount: 5,
                itemSize: 15.0,
                unratedColor: ColorsConstants.amberColor.withAlpha(50),
                direction: Axis.horizontal,
              ),
              const SizedBox(
                width: 5.0,
              ),
              Text(
                model.price.toString() + ' Reviews',
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0,
                    decoration: TextDecoration.none,
                    color: ColorsConstants.lightGrey),
                maxLines: 1,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildLocation(bool isLightTheme, String location) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            location,
            maxLines: 3,
            style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                decoration: TextDecoration.none,
                color: ColorsConstants.lightGrey,
                fontWeight: FontWeight.w500,
                fontSize: 17),
          ),
          const SizedBox(
            width: 5.0,
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  'View On Map',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0,
                      decoration: TextDecoration.none,
                      color: ColorsConstants.amberColor),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  width: 1.0,
                ),
                Icon(
                  Icons.location_on,
                  color: ColorsConstants.amberColor,
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildAmenitie(Amenities amenitie, bool isLightTheme) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Image.asset(
            amenitie.image,
            height: 25,
            width: 25,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(amenitie.name,
              maxLines: 1,
              style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  decoration: TextDecoration.none,
                  color: ColorsConstants.lightGrey,
                  fontWeight: FontWeight.w500,
                  fontSize: 12)),
        ],
      ),
    );
  }

  _buildCheckOutDays(bool isLightTheme, PopularModel hotel) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        color: ColorsConstants.amberColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            width: 0.5, color: ColorsConstants.amberColor.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "03 Jan",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
                decoration: TextDecoration.none,
                letterSpacing: 1,
                color: isLightTheme ? Colors.black87 : Colors.white70),
            maxLines: 1,
            textAlign: TextAlign.left,
          ),
          Text(
            '-',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
                letterSpacing: 1,
                decoration: TextDecoration.none,
                color: isLightTheme ? Colors.black87 : Colors.white70),
            maxLines: 1,
            textAlign: TextAlign.left,
          ),
          Text(
            "10 Jan",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
                letterSpacing: 1,
                decoration: TextDecoration.none,
                color: isLightTheme ? Colors.black87 : Colors.white70),
            maxLines: 1,
            textAlign: TextAlign.left,
          ),
          Text(
            '•',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
                letterSpacing: 1,
                decoration: TextDecoration.none,
                color: isLightTheme ? Colors.black87 : Colors.white70),
            maxLines: 1,
            textAlign: TextAlign.left,
          ),
          Text(
            "4 Room",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
                letterSpacing: 1,
                decoration: TextDecoration.none,
                color: isLightTheme ? Colors.black87 : Colors.white70),
            maxLines: 1,
            textAlign: TextAlign.left,
          ),
          Text(
            '•',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
                letterSpacing: 1,
                decoration: TextDecoration.none,
                color: isLightTheme ? Colors.black87 : Colors.white70),
            maxLines: 1,
            textAlign: TextAlign.left,
          ),
          Text(
            "6 Adults",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
                letterSpacing: 1,
                decoration: TextDecoration.none,
                color: isLightTheme ? Colors.black87 : Colors.white70),
            maxLines: 1,
            textAlign: TextAlign.left,
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              'Modify',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0,
                  letterSpacing: 1,
                  decoration: TextDecoration.none,
                  color: ColorsConstants.amberColor),
              maxLines: 1,
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}

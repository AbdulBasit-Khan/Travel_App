import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_template/carousel_slider/carousel_slider.dart';
import 'package:travel_app_template/models/activity_model.dart';
import 'package:travel_app_template/models/hotel_list_data.dart';
import 'package:travel_app_template/models/interest_place_model.dart';
import 'package:travel_app_template/models/popular_model.dart';
import 'package:travel_app_template/models/recommended_model.dart';
import 'package:travel_app_template/utils/colors_const.dart';
import 'package:travel_app_template/utils/common_functions.dart';
import 'package:travel_app_template/utils/strings.dart';
import '../place_details.dart';

class InterestDetailPage extends StatefulWidget {
  const InterestDetailPage({Key? key}) : super(key: key);

  @override
  _InterestDetailPageState createState() => _InterestDetailPageState();
}

class _InterestDetailPageState extends State<InterestDetailPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = CommonFunctions.isLightTheme(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(

        backgroundColor: Theme.of(context).backgroundColor,
        title:  Text(Strings.details,style: themeTitleStyle,),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: const [
                Icon(Icons.search),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.bookmark_outline_rounded)
              ],
            ),
          )
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Divider(height: 1,color: Colors.grey.shade300,),
          const SizedBox(
            height: 20,
          ),
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 16 / 9,
              viewportFraction: 1.5,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: List.generate(
              recommendations.length,
              (int index) => GestureDetector(
                onTap: () {},
                child: Container(
                  width: 370,
                  height: 218.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.6),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                          recommendations[index].image),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: map<Widget>(recommendations, (index, url) {
              return Container(
                width: 7.0,
                height: 7.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 3.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? ColorsConstants.appColor
                      : Colors.grey.withAlpha(100),
                ),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  Strings.place,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 2,),
                 Text(Strings.interestLocation),
                const SizedBox(
                  height: 15,
                ),
                 Text(
                  Strings.overView,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                 Text(
                    Strings.interestDummy,style: const TextStyle( height: 1.5),),
                const SizedBox(
                  height: 15,
                ),
                 Text(
                  Strings.bestTimeVisit,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    children: [
                      SizedBox(
                        width: 300,
                        child: Card(
                          elevation: 2,
                          color: isLightTheme
                              ? Theme.of(context).backgroundColor
                              : Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Mar-Jun",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                                Text(
                                  Strings.peakPlace,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: ColorsConstants.appColor),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Divider(
                                  height: 2,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey.withAlpha(40)),
                                      child: const Center(
                                        child: Icon(
                                          Icons.people_rounded,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                     Text(
                                    Strings.moreCrowd,
                                      style: const TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey.withAlpha(40)),
                                      child: const Center(
                                        child: Icon(
                                          Icons.wb_sunny,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                     Expanded(
                                        child: Text(
                                      Strings.temp1,
                                      style: const TextStyle(fontSize: 15),
                                    ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey.withAlpha(40)),
                                      child: const Center(
                                        child: Icon(
                                          Icons.thumb_up,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                     Expanded(
                                        child: Text(
                                      Strings.sightSeen,
                                      style: const TextStyle(fontSize: 15),
                                    ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 300,
                        child: Card(
                          elevation: 2,
                          color: isLightTheme
                              ? Theme.of(context).backgroundColor
                              : Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Jul-Sep",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                                 Text(
                                  Strings.modRate,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: Colors.deepOrangeAccent),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Divider(
                                  height: 2,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey.withAlpha(40)),
                                      child: const Center(
                                        child: Icon(
                                          Icons.people_rounded,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                     Text(
                                      Strings.avgCrowd,
                                      style: const TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey.withAlpha(40)),
                                      child: const Center(
                                        child: Icon(
                                          Icons.wb_sunny,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                     Expanded(
                                        child: Text(
                                      Strings.temp2,
                                      style: const TextStyle(fontSize: 15),
                                    ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey.withAlpha(40)),
                                      child: const Center(
                                        child: Icon(
                                          Icons.thumb_up,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                     Expanded(
                                        child: Text(
                                      Strings.sceneries,
                                      style: const TextStyle(fontSize: 15),
                                    ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 300,
                        child: Card(
                          elevation: 2,
                          color: isLightTheme
                              ? Theme.of(context).backgroundColor
                              : Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Oct-Feb",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                                 Text(
                                  Strings.offSeason,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: Colors.red),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Divider(
                                  height: 2,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey.withAlpha(40)),
                                      child: const Center(
                                        child: Icon(
                                          Icons.people_rounded,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                     Text(
                                      Strings.lessCrowd,
                                      style: const TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey.withAlpha(40)),
                                      child: const Center(
                                        child: Icon(
                                          Icons.wb_sunny,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                     Expanded(
                                        child: Text(
                                        Strings.temp3,
                                      style: const TextStyle(fontSize: 15),
                                    ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey.withAlpha(40)),
                                      child: const Center(
                                        child: Icon(
                                          Icons.thumb_up,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                     Expanded(
                                        child: Text(
                                      Strings.lakes,
                                      style: const TextStyle(fontSize: 15),
                                    ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                 Text(
                  Strings.thingsToSee,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                GridView.count(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  childAspectRatio: 2 / 2.3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 5,
                  crossAxisCount: 2,
                  children:
                      List.generate(interestPlaceModelList.length, (index) {
                    InterestPlaceModel model = interestPlaceModelList[index];
                    return GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PlaceDetails(
                              rating: 4.2,
                              imgUrl: model.image,
                              placeName: model.name,
                            )));
                      },
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                  height: 150,
                                  child: ClipRRect(
                                    child: Image.network(
                                      model.image,
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                Positioned(
                                    top: 5,
                                    right: 8,
                                    child: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.5),
                                          shape: BoxShape.circle),
                                      child: const Center(
                                        child: Icon(
                                          Icons.bookmark_outline_rounded,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 3.0),
                              child: Text(
                                model.name,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(height: 1,),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 3.0),
                                child:  Text(
                                    model.tagLine,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                
                              ),
                            )
                          ]),
                    );
                  }),
                ),
                const SizedBox(
                  height: 15,
                ),
                 Text(
                  Strings.bookYourTrip,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                      text: "From ", style: TextStyle(color: Colors.grey)),
                  TextSpan(
                      text: "Mumbai ",
                      style: TextStyle(color: ColorsConstants.appColor)),
                ])),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  child: ExpansionTile(
                    title: Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.orange.withOpacity(0.5),
                              shape: BoxShape.circle),
                          child: Center(
                            child: Image.asset(
                              "assets/icon/travel_de.png",
                              height: 17,
                              width: 17,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Strings.travel,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: isLightTheme
                                      ? Colors.black
                                      : Colors.white),
                            ),
                            //  Text("Hotels,Villas,Homestays & more",style:  TextStyle(fontSize: 10),),
                          ],
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        const Text(
                          "from ₹3,338",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.blue),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 3),
                              child:  Text(
                                Strings.recommended1,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Strings.train,
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  "₹20",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "1h 28m",
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  "onward",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Strings.viewDetails,
                                  style: TextStyle(
                                      color: Colors.blue.shade600,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      color: Colors.orange.withOpacity(0.5),
                                      shape: BoxShape.circle),
                                  child: const Center(
                                    child: Icon(
                                      Icons.train,
                                      size: 17,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.blue),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 3),
                              child:  Text(
                                Strings.otherOption,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Bus to Lonavala",
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  "₹776",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "3h 38m",
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  "onward",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "VIEW DETAILS",
                                  style: TextStyle(
                                      color: Colors.blue.shade600,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      color: Colors.orange.withOpacity(0.5),
                                      shape: BoxShape.circle),
                                  child: const Center(
                                    child: Icon(
                                      Icons.car_rental,
                                      size: 17,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Card(
                  child: ExpansionTile(
                    title: Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.5),
                              shape: BoxShape.circle),
                          child: Center(
                            child: Image.asset(
                              "assets/icon/stay.png",
                              height: 17,
                              width: 17,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Stay",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: isLightTheme
                                      ? Colors.black
                                      : Colors.white),
                            ),
                            Text(
                              "Hotels,Villas,Homestays & more",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: isLightTheme
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    children: <Widget>[
                      ListView.builder(
                        itemBuilder: (context, index) {
                          HotelListData model = HotelListData.hotelList[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: ClipRRect(
                                    child: Image.network(
                                      model.imagePath,
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            model.titleTxt,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "₹" + model.perNight.toString(),
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            model.subTxt,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          const Text(
                                            "Avg Price",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: HotelListData.hotelList.length,
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Card(
                  child: ExpansionTile(
                    title: Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.5),
                              shape: BoxShape.circle),
                          child: Center(
                            child: Image.asset(
                              "assets/icon/activity.png",
                              height: 17,
                              width: 17,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Activity",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: isLightTheme
                                      ? Colors.black
                                      : Colors.white),
                            ),
                            Text(
                              "Hotels,Villas,Homestays & more",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: isLightTheme
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    children: <Widget>[
                      SizedBox(
                        height: 220,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            ActivityModel model = activityModelList[index];
                            return Container(
                              margin: const EdgeInsets.only(right: 10),
                              width: 200,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        SizedBox(
                                          height: 150,
                                          child: ClipRRect(
                                            child: Image.network(
                                              model.image,
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                        Positioned(
                                            top: 0,
                                            left: 0,
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: const BoxDecoration(
                                                  color: Colors.orange,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  15))),
                                              child: Center(
                                                child: Text(
                                                  model.id.toString(),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
                                                ),
                                              ),
                                            ))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 3.0),
                                      child: Text(
                                        model.intro,
                                        style: const TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 3.0, top: 5),
                                      child: Text(
                                        "₹" + model.price,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                  ]),
                            );
                          },
                          itemCount: activityModelList.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                        ),
                      ),
                      const SizedBox(height: 5,)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Popular Places :-",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      PopularModel model = popularModelList[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PlaceDetails(
                                rating: model.rating,
                                imgUrl: model.image,
                                placeName: model.name,
                              )));
                        },
                        child: Card(
                          margin:
                          const EdgeInsets.only(right: 10, bottom: 5),
                          elevation: 5,
                          color: Theme.of(context).backgroundColor,
                          child: Container(
                            margin: EdgeInsets.zero,
                            width: 180,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 120,
                                  margin: EdgeInsets.zero,
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 105.0,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                            NetworkImage(model.image),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                          const BorderRadius.only(
                                              topRight:
                                              Radius.circular(5.0),
                                              topLeft:
                                              Radius.circular(5.0)),
                                        ),
                                      ),
                                      Container(
                                        height: 105.0,
                                        decoration: BoxDecoration(
                                          // Box decoration takes a gradient
                                          gradient: LinearGradient(
                                            // Where the linear gradient begins and ends
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                            // Add one stop for each color. Stops should increase from 0 to 1
                                            colors: [
                                              Colors.black.withOpacity(0.4),
                                              Colors.black.withOpacity(0.1),
                                              Colors.black
                                                  .withOpacity(0.05),
                                              Colors.black
                                                  .withOpacity(0.025),
                                            ],
                                          ),
                                          borderRadius:
                                          const BorderRadius.only(
                                              topRight:
                                              Radius.circular(5.0),
                                              topLeft:
                                              Radius.circular(5.0)),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              right: 5, top: 5),
                                          child: CircleAvatar(
                                            backgroundColor: ColorsConstants
                                                .lightGrey
                                                .withOpacity(0.5),
                                            radius: 12,
                                            child: IconButton(
                                              padding: EdgeInsets.zero,
                                              icon: const Icon(
                                                Icons.favorite,
                                                size: 15,
                                              ),
                                              color: Colors.white,
                                              onPressed: () {},
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 10,
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              left: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                              BorderRadius.circular(5)),
                                          padding: const EdgeInsets.all(5),
                                          child: Row(
                                            children: [
                                              const SizedBox(
                                                width: 3,
                                              ),
                                              Text(
                                                model.rating.toString(),
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const Icon(
                                                Icons.star,
                                                size: 20,
                                                color: Colors.white,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    model.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.fade),
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    model.tagLine,
                                    style: const TextStyle(
                                        color: ColorsConstants.lightGrey,
                                        fontWeight: FontWeight.w500,
                                        overflow: TextOverflow.fade),
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(left: 10),
                                      child: Text(
                                        "\$" + model.price.toString(),
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Text(
                                        Strings.discountText,
                                        style: TextStyle(
                                            color: ColorsConstants.appColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: popularModelList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only( right: 10),
                  ),
                  height: 200,
                ),
                const SizedBox(height: 20,),
              ],
            ),
          )
        ],
      ),
    );
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
}

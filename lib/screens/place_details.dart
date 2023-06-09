import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_template/models/popular_model.dart';
import 'package:travel_app_template/screens/car_rental/car_rental.dart';
import 'package:travel_app_template/screens/hotel/hotel_screen.dart';
import 'package:travel_app_template/utils/colors_const.dart';
import 'package:travel_app_template/utils/common_functions.dart';
import 'package:travel_app_template/utils/strings.dart';

class PlaceDetails extends StatefulWidget {
  final String imgUrl;
  final String placeName;
  final double rating;

   const PlaceDetails(
      {Key? key, required this.rating, required this.imgUrl, required this.placeName}) : super(key: key);

  @override
  _PlaceDetailsState createState() => _PlaceDetailsState();
}

class _PlaceDetailsState extends State<PlaceDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isLightTheme=CommonFunctions.isLightTheme(context);
    return Scaffold(
      backgroundColor:Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Image.network(
                    widget.imgUrl,
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(height: 350,
                      color: Colors.black12,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                              left: 24,top: 40,
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
                                      borderRadius: BorderRadius.circular(9.6),
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                    child: const Icon(
                                      Icons.arrow_back,
                                      size: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  height: 47.6,
                                  width: 47.6,
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9.6),
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  child: const Icon(
                                    Icons.favorite_border_outlined,
                                    size: 24,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 24,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.placeName,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 23),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      "Koh Chang Tai, Thailand",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 17),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    RatingBar(widget.rating.round(), 20),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "${widget.rating}",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 17),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                        ],
                      ),),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        decoration:  BoxDecoration(
                                color: Theme.of(context).backgroundColor,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30))),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:  [
                            FeaturesTile(
                              icon: Icon(Icons.wifi, color: isLightTheme?ColorsConstants.iconLight:Colors.white),
                              label: Strings.freeWifi,
                            ),
                            FeaturesTile(
                              icon: Icon(Icons.beach_access, color: isLightTheme?ColorsConstants.iconLight:Colors.white),
                              label: Strings.beach,
                            ),
                            FeaturesTile(
                              icon: Icon(Icons.card_travel, color: isLightTheme?ColorsConstants.iconLight:Colors.white),
                              label: Strings.coastLine,
                            ),
                            FeaturesTile(
                              icon: Icon(Icons.local_drink, color: isLightTheme?ColorsConstants.iconLight:Colors.white),
                              label: Strings.barRestorent,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 24, bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const DetailsCard(
                              noOfReviews: '10',
                              title: 'test',
                              rating: 5,
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HotelScreen()));
                              },
                              child: Container(
                                padding:
                                     const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color:  isLightTheme?ColorsConstants.amberColor.withOpacity(0.06):ColorsConstants.amberColor.withOpacity(0.09),
                                    borderRadius: BorderRadius.circular(16)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color:
                                                  ColorsConstants.amberColor.withOpacity(0.1),
                                              borderRadius: BorderRadius.circular(10)),
                                          child: Image.asset(
                                            "assets/icon/hotel.png",
                                            height: 20,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Hotel",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                 ),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              "5.0/5.1",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: isLightTheme?Colors.black.withOpacity(0.5):Colors.white.withOpacity(0.5)),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const Text(
                                      " Based on 46 reviews",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff879D95)),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        margin: const EdgeInsets.only(bottom: 5),
                        child:  Align(
                          alignment: Alignment.centerLeft,
                            child: Text(
                          Strings.description1,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        )),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                         Strings.detailDes,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 15,
                            height: 1.5,
                            fontWeight: FontWeight.w400,

                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        margin: const EdgeInsets.only(bottom: 10),
                        child:  Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              Strings.otherImage,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            )),
                      ),
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            itemCount: popularModelList.length,
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return ImageListTile(
                                imgUrl: popularModelList[index].image,
                              );
                            }),
                      ),
                      const SizedBox(height: 20,)

                    ],
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class DetailsCard extends StatelessWidget {
  final String title;
  final String noOfReviews;
  final double rating;

   const DetailsCard(
      {Key? key, required this.rating, required this.title, required this.noOfReviews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLightTheme =CommonFunctions.isLightTheme(context);
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const CarRentalScreen()));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
            color: isLightTheme?ColorsConstants.amberColor.withOpacity(0.06):ColorsConstants.amberColor.withOpacity(0.09),
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: ColorsConstants.amberColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.asset(
                    "assets/icon/car.png",
                    height: 20,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Booking",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            )),
                    const SizedBox(
                      height: 3,
                    ),
                    Text("8.0/10",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: isLightTheme?Colors.black.withOpacity(0.5):Colors.white.withOpacity(0.5))),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              " Based on 30 reviews",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff879D95)),
            ),
          ],
        ),
      ),
    );
  }
}

class FeaturesTile extends StatelessWidget {
  final Icon icon;
  final String label;

   const FeaturesTile({Key? key, required this.label, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLightTheme=CommonFunctions.isLightTheme(context);
    return Opacity(
      opacity: 0.7,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border:
                    Border.all(color:isLightTheme?ColorsConstants.iconLight.withOpacity(0.5):Colors.white.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(40)),
            child: icon,
          ),
          const SizedBox(
            height: 9,
          ),
          SizedBox(
              width: 70,
              child: Text(
                label,
                textAlign: TextAlign.center,
                style:  TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isLightTheme?Colors.grey.shade700:Colors.white),
              ))
        ],
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  final int rating;
  final double size;

   const RatingBar(this.rating, this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          size: size,
          color: rating >= 1 ? ColorsConstants.amberColor : Colors.white70,
        ),
        const SizedBox(
          width: 1,
        ),
        Icon(
          Icons.star,
          size: size,
          color: rating >= 2 ? ColorsConstants.amberColor : Colors.white70,
        ),
        const SizedBox(
          width: 1,
        ),
        Icon(
          Icons.star,
          size: size,
          color: rating >= 3 ? ColorsConstants.amberColor : Colors.white70,
        ),
        const SizedBox(
          width: 1,
        ),
        Icon(
          Icons.star,
          size: size,
          color: rating >= 4 ? ColorsConstants.amberColor : Colors.white70,
        ),
        const SizedBox(
          width: 1,
        ),
        Icon(
          Icons.star,
          size: size,
          color: rating >= 5 ? ColorsConstants.amberColor : Colors.white70,
        ),
      ],
    );
  }
}

class ImageListTile extends StatelessWidget {
  final String imgUrl;

   const ImageListTile({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: imgUrl,
          height: 220,
          width: 150,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

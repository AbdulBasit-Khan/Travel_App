import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app_template/models/hotel_list_data.dart';
import 'package:travel_app_template/utils/colors_const.dart';
import 'package:travel_app_template/utils/common_functions.dart';


class HotelListView extends StatelessWidget {
  const HotelListView(
      {Key? key,
      this.hotelData,
        this.callback})
      : super(key: key);

  final VoidCallback? callback;
  final HotelListData? hotelData;

  @override
  Widget build(BuildContext context) {
    bool isLightTheme=CommonFunctions.isLightTheme(context);
    return Padding(
      padding: const EdgeInsets.only(
          left: 24, right: 24, top: 8, bottom: 16),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: callback,
        child: Card(
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(16)
         ),
          elevation: 8,
          color: Theme.of(context).backgroundColor,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 2,
                        child: Image.network(
                          hotelData!.imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        color: Theme.of(context)
                            .backgroundColor
                            .withOpacity(0.9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, top: 8, bottom: 8),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      hotelData!.titleTxt,
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          hotelData!.subTxt,
                                          style: TextStyle(
                                              fontSize: 13,
                                              color:isLightTheme? Colors.black
                                                  .withOpacity(0.5):Colors.white
                                                  .withOpacity(0.5),)
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Icon(
                                          FontAwesomeIcons.mapMarkerAlt,
                                          size: 12,
                                          color: ColorsConstants.amberColor,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Expanded(
                                          child: Text(
                                            '${hotelData!.dist.toStringAsFixed(1)} km to city',
                                            overflow:
                                            TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 13,
                                                color:isLightTheme? Colors.black
                                                    .withOpacity(0.5):Colors.white
                                                    .withOpacity(0.5)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(top: 6),
                                      child: Row(
                                        children: <Widget>[
                                          RatingBar(
                                            initialRating:
                                            hotelData!.rating,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemSize: 20,
                                            ratingWidget: RatingWidget(
                                              full: Icon(
                                                Icons.star_rate_rounded,
                                                color: ColorsConstants.amberColor,
                                              ),
                                              half: Icon(
                                                Icons.star_half_rounded,
                                                color: ColorsConstants.amberColor,
                                              ),
                                              empty: Icon(
                                                Icons.star_border_rounded,
                                                color: ColorsConstants.amberColor,
                                              ),
                                            ),
                                            itemPadding: EdgeInsets.zero,
                                            onRatingUpdate: (rating) {

                                            },
                                          ),
                                          Text(
                                            ' ${hotelData!.reviews} Reviews',
                                            style: TextStyle(
                                                fontSize: 13,
                                                color:isLightTheme? Colors.black
                                                    .withOpacity(0.5):Colors.white
                                                    .withOpacity(0.5)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 16, top: 8),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    '\$${hotelData!.perNight}',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(height: 3,),
                                  Text(
                                    'per night',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color:isLightTheme? Colors.black
                                            .withOpacity(0.5):Colors.white
                                            .withOpacity(0.5)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      margin: const EdgeInsets.only(
                          right: 5, top: 5),
                      child: CircleAvatar(
                        backgroundColor: ColorsConstants
                            .lightGrey
                            .withOpacity(0.5),
                        radius: 20,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            Icons.favorite,
                            size: 20,
                          ),
                          color: Colors.white,
                          onPressed: () {

                          },
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

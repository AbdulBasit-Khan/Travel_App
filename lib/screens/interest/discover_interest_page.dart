import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app_template/models/discover_interest_model.dart';
import 'package:travel_app_template/utils/common_functions.dart';
import 'package:travel_app_template/utils/strings.dart';

import 'interest_details.dart';

class DiscoverInterestPage extends StatefulWidget {
  const DiscoverInterestPage({Key? key}) : super(key: key);

  @override
  _DiscoverInterestPageState createState() => _DiscoverInterestPageState();
}

class _DiscoverInterestPageState extends State<DiscoverInterestPage> {
  @override
  Widget build(BuildContext context) {
    bool isLightTheme = CommonFunctions.isLightTheme(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title:  Text(Strings.fromMumbai),
        elevation: 3,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Wrap(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: isLightTheme ? Colors.black : Colors.white),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.theme,
                        style: TextStyle(
                            color: isLightTheme ? Colors.white : Colors.black,
                            fontSize: 12),
                      ),
                      Row(
                        children: [
                          Text(
                            Strings.weekEndGateways,
                            style: TextStyle(
                                color:
                                    isLightTheme ? Colors.white : Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 5),
                          Icon(
                            Icons.keyboard_arrow_down_sharp,
                            size: 20,
                            color: isLightTheme ? Colors.white : Colors.black,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                FilterOption(
                  onTap: () {},
                  filterDes: "₹5000 to ₹10,000",
                  filterName: "Budget",
                ),
                FilterOption(
                  onTap: () {},
                  filterDes: "upto 15 hours",
                  filterName: "Travel Duration",
                ),
                FilterOption(
                  onTap: () {},
                  filterDes: "anytime",
                  filterName: "Month",
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: discoverModelList.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 10, right: 10),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, item) {
                  DiscoverInterestModel model = discoverModelList[item];
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const InterestDetailPage()));
                    },
                    child: Card(
                      color: isLightTheme?Colors.white:Colors.black.withOpacity(0.3),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 150,
                              width: MediaQuery.of(context).size.width,
                              child: ClipRRect(
                                child: Image.network(
                                  model.image,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        model.name,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 1,
                                      ),
                                      Text(
                                        model.tagLine,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: isLightTheme
                                                ? Colors.black.withOpacity(0.6)
                                                : Colors.white.withOpacity(0.5)),
                                      ),
                                    ],
                                  ),
                                  const Icon(
                                    Icons.bookmark_outline_rounded,
                                    size: 25,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(
                                model.description,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: isLightTheme
                                        ? Colors.black.withOpacity(0.8)
                                        : Colors.white.withOpacity(0.5)),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    model.location,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: isLightTheme
                                            ? Colors.black.withOpacity(0.8)
                                            : Colors.white.withOpacity(0.5)),
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 25,
                                            width: 25,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: isLightTheme?Colors.black.withAlpha(70):Colors.white.withAlpha(20),
                                            ),
                                            child: const Center(
                                              child: Icon(FontAwesomeIcons.hotel,size: 10,),
                                            ),

                                          ),
                                          const SizedBox(width: 5,),
                                          Container(
                                            height: 25,
                                            width: 25,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: isLightTheme?Colors.black.withAlpha(70):Colors.white.withAlpha(20),
                                            ),
                                            child: const Center(
                                              child: Icon(FontAwesomeIcons.plane,size: 10,),
                                            ),

                                          ),
                                          const SizedBox(width: 5,),
                                          Text("₹"+model.price,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                                        ],
                                      ),
                                      const SizedBox(height: 3,),
                                       Text(Strings.approxTrip,style: const TextStyle(fontSize: 12),)
                                    ],
                                  )


                                ],
                              )
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class FilterOption extends StatelessWidget {
  final VoidCallback onTap;
  final String filterName;
  final String filterDes;

  const FilterOption(
      {Key? key,
      required this.onTap,
      required this.filterName,
      required this.filterDes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = CommonFunctions.isLightTheme(context);
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: isLightTheme
                ? Colors.black.withOpacity(0.4)
                : Colors.white.withOpacity(0.5)),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              filterName,
              style: TextStyle(
                  color: isLightTheme ? Colors.white : Colors.black,
                  fontSize: 12),
            ),
            Row(
              children: [
                Text(
                  filterDes,
                  style: TextStyle(
                      color: isLightTheme ? Colors.white : Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 5),
                Icon(
                  Icons.keyboard_arrow_down_sharp,
                  size: 20,
                  color: isLightTheme ? Colors.white : Colors.black,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

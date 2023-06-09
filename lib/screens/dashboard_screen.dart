import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:travel_app_template/carousel_slider/carousel_slider.dart';
import 'package:travel_app_template/models/home_category_model.dart';
import 'package:travel_app_template/models/hotel_list_data.dart';
import 'package:travel_app_template/models/popular_model.dart';
import 'package:travel_app_template/models/recommended_model.dart';
import 'package:travel_app_template/screens/place_details.dart';
import 'package:travel_app_template/screens/profile/notification_screen.dart';
import 'package:travel_app_template/utils/colors_const.dart';
import 'package:travel_app_template/utils/common_functions.dart';
import 'package:travel_app_template/utils/strings.dart';
import 'package:travel_app_template/widgets/custom_tab_indicator.dart';
import 'calendar_popup_view.dart';
import 'filters_screen.dart';
import 'hotel_home_screen.dart';
import 'hotel_list_view.dart';
import 'hotel_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  final ScrollController _scrollController = ScrollController();
  List<HotelListData> hotelList = HotelListData.hotelList;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = CommonFunctions.isLightTheme(context);
    return SafeArea(
      child: NestedScrollView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverList(
            
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color:ColorsConstants.amberColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      
                      height: 57.6,
                      margin: const EdgeInsets.only(
                          top: 10.8, left: 16, right: 16),
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                            child: Container(
                              height: 47.6,
                              width: 47.6,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9.6),
                                // color: const Color(0x080a0928),
                              ),
                              child: SvgPicture.asset(
                                  'assets/svg/icon_drawer.svg',color:ColorsConstants.darkBG),
                            ),
                            onTap: () {
                              Navigator.push<dynamic>(
                                context,
                                MaterialPageRoute<dynamic>(
                                    builder: (BuildContext context) =>
                                        const FiltersScreen(),
                                    fullscreenDialog: true),
                              );
                            },
                          ),
                           Expanded(
                            child: Center(
                              child: Text(
                                Strings.exploreNature,
                                style: themeTitleStyle,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap:(){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const NotificationScreen()));
                              },
                            child: Container(
                              height: 47.6,
                              width: 47.6,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9.6),
                                // color: const Color(0x080a0928),
                              ),
                              child: Icon(FontAwesomeIcons.bell,color:ColorsConstants.darkBG,)
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 30,
                      margin: const EdgeInsets.only(left: 14.4, top: 18.8),
                      child: DefaultTabController(
                        length: 4,
                        child: TabBar(
                            labelPadding:
                                const EdgeInsets.only(left: 14.4, right: 14.4),
                            indicatorPadding:
                                const EdgeInsets.only(left: 14.4, right: 14.4),
                            isScrollable: true,
                             labelColor: isLightTheme
                             ? Colors.black
                                 : Colors.white,
                            unselectedLabelColor: const Color(0xFF8a8a8a),
                            labelStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700,color: Colors.red),
                            unselectedLabelStyle: GoogleFonts.lato(
                                fontSize: 14, fontWeight: FontWeight.w700),
                            indicator: RoundedRectangleTabIndicator(
                                color: isLightTheme
                                    ? Colors.black
                                    : Colors.white,
                                weight: 2.4,
                                width: 14.4),
                            tabs:  [
                              Tab(
                                child: Text(Strings.recommended),
                              ),
                              Tab(
                                child: Text(Strings.popular),
                              ),
                              Tab(
                                child: Text(Strings.newDestination),
                              ),
                              Tab(
                                child: Text(Strings.hiddenGems),
                              )
                            ]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2 / 1,
                        viewportFraction: 0.8,
                        enlargeCenterPage: true,
                      ),
                      items: List.generate(
                        recommendations.length,
                        (int index) => GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(right: 0),
                            width: 333.6,
                            height: 218.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.6),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: CachedNetworkImageProvider(
                                    recommendations[index].image),
                              ),
                            ),
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4.8),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaY: 4.2, sigmaX: 4.2),
                                      child: Container(
                                        height: 36,
                                        padding: const EdgeInsets.only(
                                            left: 16.72, right: 14.4),
                                        alignment: Alignment.centerLeft,
                                        child: Row(
                                          children: <Widget>[
                                            SvgPicture.asset(
                                                'assets/svg/icon_location.svg'),
                                            const SizedBox(
                                              width: 9.52,
                                            ),
                                            Text(
                                              recommendations[index].name,
                                              style: GoogleFonts.lato(
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                  fontSize: 16.8),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          CategoryModel model = categoryModelList[index];
                          return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => model.className));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  // ignore: avoid_unnecessary_containers
                                  Container(
                                    child: Center(
                                      child: Image.asset(
                                        model.image,
                                        height: model.size,
                                        width: model.size,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(50.0)),
                                        color: Colors.grey.withOpacity(0.08)),
                                    height: 70,
                                    width: 70,
                                    margin: const EdgeInsets.only(
                                        left: 5, right: 5),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    model.name,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ));
                        },
                        itemCount: categoryModelList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.only(left: 10, right: 10),
                      ),
                      height: 100,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    HeaderView(
                      header: Strings.popularPlace,
                      isShowAll: false,
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          PopularModel model = popularModelList[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(CommonFunctions.pushWithTopAnimation(child:
                                  PlaceDetails(
                                    rating: model.rating,
                                    imgUrl: model.image,
                                    placeName: model.name,
                                  ), duration: const Duration(milliseconds: 500)));
                            },
                            child: Card(
                              margin:
                                  const EdgeInsets.only(left: 10, bottom: 5),
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
                                                  color:ColorsConstants.amberColor,
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
                                      height: 8,
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
                                      height: 8,
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
                                                color: ColorsConstants.amberColor,
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
                        padding: const EdgeInsets.only(left: 10, right: 10),
                      ),
                      height: 200,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    HeaderView(
                      header: Strings.bestHotels,
                      isShowAll: false,
                      onTap: () {},
                    ),
                    getSearchBarUI(),
                    getTimeDateUI(),
                  ],
                );
              }, childCount: 1),
            ),
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: ContestTabHeader(
                getFilterBarUI(),
              ),
            ),
          ];
        },
        body: Container(
          color: Theme.of(context).backgroundColor,
          child: ListView.builder(
            itemCount: hotelList.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 8),
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return HotelListView(
                callback: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HotelDetailScreen(
                            model: popularModelList[2],
                          )));
                },
                hotelData: hotelList[index],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget getTimeDateUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 18, bottom: 16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      // setState(() {
                      //   isDatePopupOpen = true;
                      // });
                      showDemoDialog(context: context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 4, bottom: 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                           Text(
                            Strings.chooseDate,
                            style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                                color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            '${DateFormat("dd, MMM").format(startDate)} - ${DateFormat("dd, MMM").format(endDate)}',
                            style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              width: 1,
              height: 42,
              color: Colors.grey.withOpacity(0.8),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 4, bottom: 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  <Widget>[
                          Text(
                            Strings.numbersOfRooms,
                            style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                                color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            '1 Room - 2 Adults',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getSearchBarUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                elevation: 3,
                color: Theme.of(context).backgroundColor,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(38.0),
                    ),

                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 4, bottom: 4),
                    child: TextField(
                      onChanged: (String txt) {},
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      cursorColor: ColorsConstants.amberColor,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'London...',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: ColorsConstants.amberColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(38.0),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    offset: const Offset(0, 2),
                    blurRadius: 8.0),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(32.0),
                ),
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(FontAwesomeIcons.search,
                      size: 20,color: Colors.white,)
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getFilterBarUI() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          left: 0,
          right: 0,

          child: Card(
            color: Theme.of(context).backgroundColor,
            elevation: 3,
            child: Container(
              height: 24,
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,

              ),
            ),
          ),
        ),
        Container(
          color: Theme.of(context).backgroundColor,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
            child: Row(
              children: <Widget>[
                 Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      Strings.hotelFound,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      Navigator.push<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) =>
                                const FiltersScreen(),
                            fullscreenDialog: true),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: <Widget>[
                           Text(
                            Strings.filter,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.sort,
                                color:ColorsConstants.amberColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Divider(

            height: 1,
          ),
        )
      ],
    );
  }

  void showDemoDialog({BuildContext? context}) {
    showDialog<dynamic>(
      context: context!,
      builder: (BuildContext context) => CalendarPopupView(
        barrierDismissible: true,
        minimumDate: DateTime.now(),
        //  maximumDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 10),
        initialEndDate: endDate,
        initialStartDate: startDate,
        onApplyClick: (DateTime startData, DateTime endData) {
          setState(() {
            startDate = startData;
            endDate = endData;
          });
        },
        onCancelClick: () {},
      ),
    );
  }
}

class HeaderView extends StatefulWidget {
  const HeaderView(
      {Key? key,
      required this.header,
      required this.isShowAll,
      required this.onTap})
      : super(key: key);

  final String header;
  final bool isShowAll;
  final VoidCallback onTap;

  @override
  _HeaderViewState createState() => _HeaderViewState();
}

class _HeaderViewState extends State<HeaderView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 22.8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.header,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          widget.isShowAll
              ? InkWell(
                  onTap: () => widget.onTap,
                  child:  Text(
                    Strings.viewAll,
                    style: const TextStyle(
                        decoration: TextDecoration.underline, fontSize: 16),
                  ))
              : Container()
        ],
      ),
    );
  }
}

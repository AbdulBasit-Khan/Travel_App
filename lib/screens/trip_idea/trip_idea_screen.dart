import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:travel_app_template/models/fav_place_video_model.dart';
import 'package:travel_app_template/models/interest_model.dart';
import 'package:travel_app_template/models/mountain_model.dart';
import 'package:travel_app_template/models/top_destination_model.dart';
import 'package:travel_app_template/screens/interest/discover_interest_page.dart';
import 'package:travel_app_template/screens/interest/interest_details.dart';
import 'package:travel_app_template/screens/place_details.dart';
import 'package:travel_app_template/utils/colors_const.dart';
import 'package:travel_app_template/utils/common_functions.dart';
import 'package:travel_app_template/utils/strings.dart';
import 'package:video_player/video_player.dart';

class TripIdeaScreen extends StatefulWidget {
  const TripIdeaScreen({Key? key}) : super(key: key);

  @override
  _TripIdeaScreenState createState() => _TripIdeaScreenState();
}

class _TripIdeaScreenState extends State<TripIdeaScreen>
    with TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 4);

    super.initState();
  }

  int selected = 0;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    bool isLightTheme= CommonFunctions.isLightTheme(context);
    Color oppositeColor =isLightTheme?Colors.black:Colors.white;
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const RotatedBox(
                            quarterTurns: 1,
                            child: Icon(Icons.bar_chart_outlined)),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                      ],
                    ),
                     Text(
                      Strings.userText,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children:  [
                        Text(
                          Strings.exploreWorld,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Icon(
                            Icons.emoji_emotions,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TabBar(
                      controller: tabController,
                      unselectedLabelColor: Colors.grey,
                      labelPadding: const EdgeInsets.all(0),
                      labelColor: Theme.of(context).backgroundColor,
                      isScrollable: true,
                      onTap: (value) {
                        setState(() {
                          selected = value;
                        });
                      },
                      indicatorColor: Colors.transparent,
                      tabs: <Container>[
                        Container(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          alignment: Alignment.topLeft,
                          decoration: BoxDecoration(
                              color: selected == 0 ?  oppositeColor: null,
                              borderRadius: BorderRadius.circular(20)),
                          child:  Tab(
                            text: Strings.popular,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          decoration: BoxDecoration(
                              color: selected == 1 ? oppositeColor : null,
                              borderRadius: BorderRadius.circular(20)),
                          child:  Tab(
                            text: Strings.newWord,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          decoration: BoxDecoration(
                              color: selected == 2 ? oppositeColor : null,
                              borderRadius: BorderRadius.circular(20)),
                          child:  Tab(
                            text: Strings.nearby,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          decoration: BoxDecoration(
                              color: selected == 3 ? oppositeColor : null,
                              borderRadius: BorderRadius.circular(20)),
                          child:  Tab(
                            text: Strings.recommended,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      height: 265,
                      width: double.infinity,
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: tabController,
                        children: [
                          const PopularPlacesTab(),
                          _tabBarItem(
                              "https://wallpaperaccess.com/full/4802530.jpg",
                              "https://i0.wp.com/oibnews.com/wp-content/uploads/2021/06/hill.jpeg?fit=500%2C625&ssl=1"),
                          _tabBarItem(
                              "https://dynamic.tourtravelworld.com/blog_images/50-must-visit-hill-stations-in-india-20161111053746.jpg",
                              "http://static.businessworld.in/article/article_extra_large_image/1531477733_5WhWnM_cropped_(16).png"),
                          _tabBarItem(
                              "https://silvertrips.in/wp-content/uploads/2019/05/hill-station.jpg",
                              "https://www.oyorooms.com/travel-guide/wp-content/uploads/2020/01/Naini-Lake-Nainital.jpg"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      Strings.topDestination,
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 90,
                      width: double.infinity,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: topDestinationModelList.length,
                        itemBuilder: (ctx, index) {
                          TopDestinationModel model =
                              topDestinationModelList[index];
                          return GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PlaceDetails(rating: model.rating, imgUrl: model.image, placeName: model.name)));
                            },
                            child: Container(
                              padding: const EdgeInsets.only(left: 15, right: 15),
                              margin: const EdgeInsets.only(right: 10),
                              height: 80,
                              decoration: BoxDecoration(
                                  color: ColorsConstants.appColor.withAlpha(15),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(model.image),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(15)),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        model.name,
                                        style: TextStyle(
                                            color: Colors.grey[700],
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        model.location,
                                        style: TextStyle(
                                            color: Colors.grey[700],
                                            fontSize: 11,
                                            fontFamily: "Poppins"),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.star_rate,
                                            color: Colors.orange,
                                            size: 20,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(model.rating.toString(),
                                              style: TextStyle(
                                                color: Colors.grey[700],
                                              ))
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      Strings.discoverInterest,
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 160,
                      width: double.infinity,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: interestModelList.length,
                        itemBuilder: (ctx, index) {
                          InterestModel model = interestModelList[index];
                          return GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const DiscoverInterestPage()));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      height: 120,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(model.image),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    ),
                                    Positioned(
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.white),
                                        child: Center(
                                          child: Text(
                                            model.name,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                      top: 10,
                                      left: 5,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 3),
                                  child: SizedBox(
                                    child: Text(
                                      model.intro,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    width: 120,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                     HeadView(
                      isViewAll: true,
                      title: Strings.hiddenDes,
                      description: Strings.longHiddenDes,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 280,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: favPlaceVideoModelList.length,
                          itemBuilder: (cxt, index) {
                            FavPlaceVideoModel model =
                                favPlaceVideoModelList[index];
                            return GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const InterestDetailPage()));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  VideoWidgetView(
                                    videoUrl: model.videoUri,
                                    imageUrl: model.image,
                                  ),
                                  const SizedBox(height: 5,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children:  [
                                        Container(
                                        height:50,
                                        width:50,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(model.image), fit: BoxFit.cover),
                                            borderRadius: BorderRadius.circular(15)),
                                      ),
                                        const SizedBox(width: 10,),
                                        Column(
                                          children:  [
                                            Text(model.name,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
                                            Text(model.intro,style: const TextStyle(color: Colors.grey,fontSize: 14),),
                                          ],
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start
                                          ,

                                        ),


                                    ],),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 40,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _tabBarItem(String images, String images2) {
    return SizedBox(
      width: double.infinity,

      child: Column(
        children:
        [
          HeadView(
            isViewAll: true,
            title: Strings.gatewayMountains,
            description: Strings.visitMountain,
          ),
          const SizedBox(height: 10,),
          SizedBox(
            height: 220,
            child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              Container(
                height: 220,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(images), fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 80,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      margin:
                          const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.8),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Strings.iceLand,
                            style: TextStyle(color: Colors.grey[800], fontSize: 18),
                          ),
                          Row(
                            children:  [
                              const Icon(
                                Icons.location_on,
                                size: 15,
                                color: Colors.blue,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                Strings.bali,
                                style: const TextStyle(color: Colors.grey, fontSize: 13),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                height: 220,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(images2), fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 80,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      margin:
                          const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.8),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Strings.iceLand,
                            style: TextStyle(color: Colors.grey[800], fontSize: 18),
                          ),
                          Row(
                            children:  [
                              const Icon(
                                Icons.location_on,
                                size: 15,
                                color: Colors.blue,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                Strings.bali,
                                style: const TextStyle(color: Colors.grey, fontSize: 13),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
        ),
          ),
      ]
      ),
    );
  }
}

class PopularPlacesTab extends StatefulWidget {
  const PopularPlacesTab({Key? key}) : super(key: key);

  @override
  _PopularPlacesTabState createState() => _PopularPlacesTabState();
}

class _PopularPlacesTabState extends State<PopularPlacesTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0),
      child: Column(
        children: [
           HeadView(
            isViewAll: true,
            title: Strings.gatewayMountains,
            description: Strings.visitMountain,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 220,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: mountainModelList.length,
                itemBuilder: (cxt, index) {
                  MountainModel model = mountainModelList[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const InterestDetailPage()));
                    },
                    child: Container(
                      width: 250,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: NetworkImage(model.image),
                              fit: BoxFit.cover)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 20, right: 20,top: 10,bottom: 10),
                            margin: const EdgeInsets.only(
                                bottom: 20, right: 20, left: 20),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.8),
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  model.tagLine,
                                  style: TextStyle(
                                      color: Colors.grey[800], fontSize: 15),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: 15,
                                      color: ColorsConstants.appColor,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      model.location,
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 13),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
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

class HeadView extends StatefulWidget {
  const HeadView(
      {Key? key,
      required this.title,
      required this.description,
      required this.isViewAll})
      : super(key: key);
  final String title;
  final String description;
  final bool isViewAll;

  @override
  _HeadViewState createState() => _HeadViewState();
}

class _HeadViewState extends State<HeadView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.title,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                )),
            widget.isViewAll
                ? Text(
                    Strings.viewAll,
                    style: TextStyle(
                        color: ColorsConstants.appColor, fontSize: 15),
                  )
                : Container(),
          ],
        ),
        Text(widget.description,
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 12,
            )),
      ],
    );
  }
}

class VideoWidgetView extends StatefulWidget {
  const VideoWidgetView(
      {Key? key, required this.videoUrl, required this.imageUrl})
      : super(key: key);
  final String videoUrl;
  final String imageUrl;

  @override
  _VideoWidgetViewState createState() => _VideoWidgetViewState();
}

class _VideoWidgetViewState extends State<VideoWidgetView> {
  VideoPlayerController? videoPlayerController;
  bool isClicked = false;
  bool isShowIcon=false;

  @override
  void initState() {
    videoPlayerController = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {

      });

    videoPlayerController!.addListener(() {
      setState(() {
        if (!videoPlayerController!.value.isPlaying &&
            videoPlayerController!.value.isInitialized &&
            (videoPlayerController!.value.duration == videoPlayerController!.value
                .position)) {

          isShowIcon=true;

          setState(() {});
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 200,
      width: 320,
      margin: const EdgeInsets.only(left: 10),
      child: videoPlayerController!.value.isInitialized
          ? Stack(fit: StackFit.expand, children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: VideoPlayer(videoPlayerController!)),
            Center(
                  child: AnimatedOpacity(
                    opacity:isClicked ? 0.0 : 1.0,
                    duration: const Duration(milliseconds:500),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isClicked = true;
                          videoPlayerController!.value.isPlaying
                              ? videoPlayerController!.pause()
                              : videoPlayerController!.play();
                        });
                      },
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorsConstants.appColor,
                            shape: BoxShape.circle
                          ),

                          child: Center(
                            child: Icon(
                              videoPlayerController!.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,color: Colors.white,
                            ),
                          ),


                        ),
                      ),
                    ),
                ),
              ),
            ])
          : Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.imageUrl), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(15)),
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController!.dispose();
  }
}

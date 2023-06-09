
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:travel_app_template/models/event_type_model.dart';
import 'package:travel_app_template/models/near_by_model.dart';
import 'package:travel_app_template/utils/colors_const.dart';
import 'package:travel_app_template/utils/common_functions.dart';
import 'package:travel_app_template/utils/date_time_picker/date_picker_widget.dart';
import 'package:travel_app_template/utils/datetime_utils.dart';
import 'package:travel_app_template/utils/strings.dart';

import 'event_detail_page.dart';
import 'nearby_event_card.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> with TickerProviderStateMixin {
  AnimationController ?controller;
  @override
  void initState() {
    controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 1))
      ..forward();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    bool isLightTheme=CommonFunctions.isLightTheme(context);
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsConstants.amberColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white ),
        title:  Text(Strings.events,style: const TextStyle(color: Colors.white),),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.notifications,color: Colors.white,),
          )
        ],
      ),
      backgroundColor: ColorsConstants.amberColor,
      body:  Column(
        children:  [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: MediaQuery.of(context).size.height*0.1,
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  <Widget>[
                    const   Text("Hello, Sanskar!", style:  TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 21
                    ),),
                    const SizedBox(height: 6,),
                    Text(Strings.exploreNear,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15
                      ),)
                  ],
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg"),
                          fit: BoxFit.cover)),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
              width: MediaQuery.of(context).size.width,
              decoration:  BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(30))
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                     Text(
                      Strings.schedule,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    _buildCalendar(),
                    const SizedBox(height: 10,),
                     Text(
                      Strings.allEvent,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                          itemCount: eventTypeModelList.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                            EventTypeModel model=eventTypeModelList[index];
                            return Column(
                              children: [
                                Container(
                                  width: 90,
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(right: 10),
                                  padding: const EdgeInsets.symmetric(vertical: 20),
                                  decoration: BoxDecoration(
                                      color: isLightTheme?ColorsConstants.eventGrey.withAlpha(80):Colors.black.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(model.image, height: 27,color: isLightTheme?Colors.black87:Colors.white,),
                                      const SizedBox(height: 12,),
                                      Text(model.name,)
                                    ],
                                  ),
                                ),

                              ],

                            );
                          }),
                    ),
                    const SizedBox(height: 10,),
                    buildUpComingEventList(),
                    const SizedBox(height: 15,),
                    buildNearbyConcerts(isLightTheme)



                  ],
                ),
              ),


            ),
          )

        ],

      ),
    );
  }
  Widget buildNearbyConcerts(isLightTheme) {
    return Container(
      decoration:  BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        color:Theme.of(context).backgroundColor
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:  <Widget>[
              Text(Strings.nearbyConcert, style: headerStyle),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.more_horiz),
              ),

            ],
          ),
          const SizedBox(height: 10,),
          ListView.builder(
            itemCount: nearByConcertModelList.length,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              EventModel model = nearByConcertModelList[index];
              var animation = Tween<double>(begin: 800.0, end: 0.0).animate(
                CurvedAnimation(
                  parent: controller!,
                  curve: Interval((1 / nearByConcertModelList.length) * index, 1.0,
                      curve: Curves.decelerate),
                ),
              );
              return AnimatedBuilder(
                animation: animation,
                builder: (context, child) => Transform.translate(
                  offset: Offset(animation.value, 0.0),
                  child: NearbyEventCard(
                    event:model,
                    onTap: () {
                      viewEventDetail(nearByConcertModelList[index]);


                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
  void viewEventDetail(EventModel event) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (BuildContext context, animation, __) {
          return FadeTransition(
            opacity: animation,
            child: EventDetailPage(event),
          );
        },
      ),
    );
  }
  Widget _buildCalendar() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: DatePicker(
        DateTime.now(),
        width: 50,
        height: 75,
        initialSelectedDate: DateTime.now(),
        selectionColor: ColorsConstants.amberColor,
        selectedTextColor: Colors.white,
        dayTextStyle: const TextStyle(fontSize: 10),
        monthTextStyle: const TextStyle(fontSize: 10),
        dateTextStyle: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold),
        onDateChange: (date) {
          // New date selected
          setState(() {

          });
        },
      ),
    );
  }

  Widget buildUpComingEventList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
         Text(Strings.upcomingEvent,
            style: headerStyle),
        const SizedBox(height: 16,),
        SizedBox(
          height: 250,
          child: ListView.builder(
            itemCount: upComingEventModelList.length,
            shrinkWrap: true,
            padding: const EdgeInsets.all(0),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              EventModel event = upComingEventModelList[index];
              return UpComingEventCard(
                  onTap: (){
                    viewEventDetail(upComingEventModelList[index]);
                  }, event: event,);
            },
          ),
        ),
      ],
    );
  }
}

class UpComingEventCard extends StatelessWidget {
  final EventModel event;
  final VoidCallback onTap;
   const UpComingEventCard(  {Key? key, required this.event,required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.8;
    return Container(
      width: width,
      color: Theme.of(context).backgroundColor,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: <Widget>[
          Expanded(child: buildImage()),
          const SizedBox(height: 10,),
          buildEventInfo(context),
        ],
      ),
    );
  }

  Widget buildImage() {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          width: double.infinity,
          child: Hero(
            tag: event.image,
            child: Image.network(
              event.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEventInfo(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: ColorsConstants.eventGrey.withAlpha(60),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(DateTimeUtils.getMonth(event.eventDate), style: TextStyle(color: ColorsConstants.amberColor, fontSize: 16, fontWeight: FontWeight.w500)),
              Text(DateTimeUtils.getDayOfMonth(event.eventDate), style: titleStyle),
            ],
          ),
        ),
       const SizedBox(width: 10,),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(event.name, style: titleStyle),
            const SizedBox(height: 4,),
            Row(
              children: <Widget>[
                Icon(Icons.location_on, size: 16, color: ColorsConstants.amberColor),
                const SizedBox(height: 4,),
                Text(event.location.toUpperCase(), style: subtitleStyle),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

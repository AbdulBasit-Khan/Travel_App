import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:travel_app_template/models/near_by_model.dart';
import 'package:travel_app_template/utils/colors_const.dart';
import 'package:travel_app_template/utils/common_functions.dart';
import 'package:travel_app_template/utils/datetime_utils.dart';
import 'package:travel_app_template/utils/strings.dart';

import '../payment_screen.dart';
import '../show_dialog.dart';

class EventDetailPage extends StatefulWidget {
  final EventModel event;

  const EventDetailPage(this.event, {Key? key}) : super(key: key);

  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage>
    with TickerProviderStateMixin {
  EventModel? event;
  AnimationController? controller;
  AnimationController? bodyScrollAnimationController;
  ScrollController? scrollController;
  Animation<double>? scale;
  Animation<double>? appBarSlide;
  double headerImageSize = 0;
  bool isFavorite = false;

  @override
  void initState() {
    event = widget.event;
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    bodyScrollAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController!.offset >= headerImageSize / 2) {
          if (!bodyScrollAnimationController!.isCompleted) {
            bodyScrollAnimationController!.forward();
          }
        } else {
          if (bodyScrollAnimationController!.isCompleted) {
            bodyScrollAnimationController!.reverse();
          }
        }
      });
    appBarSlide = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      parent: bodyScrollAnimationController!,
    ));

    scale = Tween(begin: 1.0, end: 0.5).animate(CurvedAnimation(
      curve: Curves.linear,
      parent: controller!,
    ));
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    bodyScrollAnimationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    headerImageSize = MediaQuery.of(context).size.height / 2.5;
    bool isLightTheme = CommonFunctions.isLightTheme(context);
    return ScaleTransition(
      scale: scale!,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 22, sigmaY: 22),
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildHeaderImage(),
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          buildEventTitle(),
                          const SizedBox(
                            height: 16,
                          ),
                          buildEventDate(),
                          const SizedBox(
                            height: 24,
                          ),

                          buildAboutEvent(),
                          const SizedBox(
                            height: 24,
                          ),
                          buildOrganizeInfo(),
                          const SizedBox(
                            height: 24,
                          ),
                          buildEventLocation(),
                          const SizedBox(
                            height: 124,
                          ),
                          //...List.generate(10, (index) => ListTile(title: Text("Dummy content"))).toList(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                child: buildPriceInfo(isLightTheme),
                alignment: Alignment.bottomCenter,
              ),
              AnimatedBuilder(
                animation: appBarSlide!,
                builder: (context, snapshot) {
                  return Transform.translate(
                    offset: Offset(0.0, -1000 * (1 - appBarSlide!.value)),
                    child: Material(
                      elevation: 2,
                      color: ColorsConstants.amberColor,
                      child: buildHeaderButton(hasTitle: true),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeaderImage() {
    double maxHeight = MediaQuery.of(context).size.height;
    double minimumScale = 0.8;
    return GestureDetector(
      onVerticalDragUpdate: (detail) {
        controller!.value += detail.primaryDelta! / maxHeight * 2;
      },
      onVerticalDragEnd: (detail) {
        if (scale!.value > minimumScale) {
          controller!.reverse();
        } else {
          Navigator.of(context).pop();
        }
      },
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: headerImageSize,
            child: Hero(
              tag: event!.image,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(32)),
                child: Image.network(
                  event!.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          buildHeaderButton(),
        ],
      ),
    );
  }

  Widget buildHeaderButton({bool hasTitle = false}) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 0,
              child: InkWell(
                onTap: () {
                  if (bodyScrollAnimationController!.isCompleted) {
                    bodyScrollAnimationController!.reverse();
                  }
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 8.0, top: 8.0, bottom: 8.0, left: 8),
                  child: Icon(
                    Icons.arrow_back,
                    color: hasTitle ? Colors.white : Colors.black,
                  ),
                ),
              ),
              color: hasTitle ? ColorsConstants.amberColor : Colors.white,
            ),
            if (hasTitle)
              Text(event!.name,
                  style: titleStyle.copyWith(color: Colors.white)),
            Card(
              shape: const CircleBorder(),
              elevation: 0,
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: () => setState(() => isFavorite = !isFavorite),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.white),
                ),
              ),
              color:ColorsConstants.amberColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEventTitle() {
    return Text(
      event!.name,
      style: headerStyle.copyWith(fontSize: 25),
    );
  }

  Widget buildEventDate() {
    return Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: ColorsConstants.eventGrey.withAlpha(70),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(DateTimeUtils.getMonth(event!.eventDate),
                  style: TextStyle(
                      color: ColorsConstants.amberColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
              Text(DateTimeUtils.getDayOfMonth(event!.eventDate),
                  style: titleStyle),
            ],
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(DateTimeUtils.getDayOfWeek(event!.eventDate),
                style: titleStyle),
            const SizedBox(
              height: 4,
            ),
            const Text("10:00 - 12:00 PM", style: subtitleStyle),
          ],
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(2),
          decoration: ShapeDecoration(
              shape: const StadiumBorder(),
              color: ColorsConstants.amberColor.withOpacity(0.05)),
          child: Row(
            children: <Widget>[
              const SizedBox(
                width: 8,
              ),
              Text(Strings.addCalender,
                  style: subtitleStyle.copyWith(
                      color: ColorsConstants.amberColor)),
              FloatingActionButton(
                backgroundColor: ColorsConstants.amberColor,
                mini: true,
                onPressed: () {},
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildAboutEvent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
         Text(Strings.about, style: headerStyle),
        Text(event!.description, style: subtitleStyle),
        const SizedBox(
          height: 8,
        ),
        InkWell(
          child: Text(
            Strings.readMore,
            style: TextStyle(
                color: ColorsConstants.amberColor,
                decoration: TextDecoration.underline),
          ),
          onTap: () {},
        ),
      ],
    );
  }

  Widget buildOrganizeInfo() {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: ColorsConstants.amberColor.withOpacity(0.7),
          child: Text(
            event!.organizer[0],
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(event!.organizer, style: titleStyle),
            const SizedBox(
              height: 4,
            ),
             Text(Strings.organization, style: subtitleStyle),
          ],
        ),
        const Spacer(),
        Container(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Text(Strings.follow,
              style: TextStyle(color: ColorsConstants.amberColor)),
          decoration: ShapeDecoration(
              shape: const StadiumBorder(),
              color: ColorsConstants.amberColor.withOpacity(0.05)),
        )
      ],
    );
  }

  Widget buildEventLocation() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          'https://images.squarespace-cdn.com/content/v1/54ff63f0e4b0bafce6932642/1572988511564-XPIO8NOVBL7U5CQ1O1QY/Google+Maps.gif?format=750w',
          height: MediaQuery.of(context).size.height / 3.5,
          fit: BoxFit.cover,
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

  Widget buildPriceInfo(isLightTheme) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Theme.of(context).backgroundColor,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
               Text(Strings.price, style: subtitleStyle),
              const SizedBox(
                height: 8,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "\$${event!.price}",
                        style: titleStyle.copyWith(
                            color: ColorsConstants.amberColor)),
                     TextSpan(
                      text: Strings.perPerson,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          MaterialButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PaymentScreen(
                        onTap: () async {
                          await showSuccessDialog(context,
                              title:  Text(Strings.booked),
                              content: Text(
                                'Event Booked successfully',
                                style: TextStyle(
                                    color: isLightTheme
                                        ? Colors.black
                                        : Colors.white),
                              ),
                              action: DialogAction(
                                  title:  Text(Strings.success),
                                  value: null,
                                  action: (BuildContext context) {
                                    Navigator.of(context).pop();
                                  }),
                              barrierColor: Colors.black.withOpacity(0.8));
                        },
                      )));
            },
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            color: ColorsConstants.amberColor,
            child: Text(
              Strings.bookTicket,
              style: titleStyle.copyWith(
                  color: Colors.white, fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}

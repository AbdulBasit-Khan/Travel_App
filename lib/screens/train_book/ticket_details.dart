import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:travel_app_template/utils/colors_const.dart';
import 'package:travel_app_template/utils/common_functions.dart';

import '../payment_screen.dart';
import '../show_dialog.dart';

class TrainTicketDetails extends StatefulWidget {
  const TrainTicketDetails({Key? key}) : super(key: key);

  @override
  _TrainTicketDetailsState createState() => _TrainTicketDetailsState();
}

class _TrainTicketDetailsState extends State<TrainTicketDetails> {

  Future<Future<T?>> showSuccessDialog<T>(BuildContext context, {
    Widget icon = const Icon(Icons.check_circle),
    Widget ?title,
    Widget? content,
    required DialogAction<T> action,
    bool barrierDismissible = false,
    required Color barrierColor,
    bool useSafeArea = true,
    bool useRootNavigator = true,
  }) {

    return showResultDialog(context,
      backgroundColor: ColorsConstants.amberColor,
      textColor: Colors.white,
      icon: icon,
      title: title,// ?? Text(StandardDialogsLocalizations.of(context)[ResultDialogLocalizationsEnum.success])),
      content: content!,
      action: action,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
    );

  }

  Future<Future<T?>> showResultDialog<T>(BuildContext context, {
    required Color backgroundColor,
    required Color textColor,
    required Widget icon,
    title,
    required Widget content,
    required DialogAction<T> action,
    required Color barrierColor,
    bool barrierDismissible = true,
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
            action: action
        );

      },
      barrierDismissible: true,
      barrierColor: barrierColor,
      useSafeArea: useSafeArea,

      useRootNavigator: useRootNavigator,
    );

  }
  @override
  Widget build(BuildContext context) {
    bool isLightTheme=CommonFunctions.isLightTheme(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      bottomNavigationBar: GestureDetector(
        onTap: (){
          Navigator.of(context).push( MaterialPageRoute(builder: (context) => PaymentScreen(onTap: () async {
           await showSuccessDialog(context,
               title: const Text('Booked'),
               content:  Text('Ticket Booked successfully',style: TextStyle(color: isLightTheme?Colors.black:Colors.white),),
               action: DialogAction(
                   title: const Text('Success'),
                   value: null, action: (BuildContext context) {
                 Navigator.of(context).pop();
               }), barrierColor: Colors.black.withOpacity(0.8));
         },)));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
            height: 50,
            decoration:BoxDecoration (
                borderRadius: BorderRadius.circular(20),
                color: ColorsConstants.amberColor
            ),
          child: const Center(
            child: Text("Book ticket now",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.grey[400]),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: ColorsConstants.amberColor,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Image.asset('assets/icon/invoice.png'),
                    ),
                    const SizedBox(width: 15.0),
                    Flexible(
                      flex: 3,
                      child: Column(
                        children: const <Widget>[
                          Text(
                            "Buying tickets is now much more comfortable.",
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            "Buy a ticket now and get 50% discount.",
                            style: TextStyle(color: Colors.white70),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ColorsConstants.amberColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 25,),
              Container(
                height: 220,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage("https://images.squarespace-cdn.com/content/v1/54ff63f0e4b0bafce6932642/1572988511564-XPIO8NOVBL7U5CQ1O1QY/Google+Maps.gif?format=750w"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius:  BorderRadius.circular(20),
                ),
                child: Center(
                  child: ImageIcon(
                    AssetImage("assets/icon/location.png",),
                    color:Colors.amber,
                    size:40
                  ),
                ),
              ),
              const SizedBox(height: 25,),
              Row(
                children: <Widget>[
                  const Expanded(child: PlacesWidget()),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(9.0),
                      decoration: BoxDecoration(
                        color:isLightTheme?  const Color(0xfffcfcfd):Colors.black,
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color: isLightTheme?Colors.grey[200]!:ColorsConstants.dividerColor,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            "05",
                            style: TextStyle(fontWeight: FontWeight.w500,
                                fontSize: 30),
                          ),
                          const Text(
                            "minute",
                            style:
                            TextStyle( fontSize: 20),
                          ),
                          const SizedBox(
                            height: 9.0,
                          ),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "Travel Time: ",

                                ),
                                TextSpan(
                                  text: "15 min",
                                  style: TextStyle(fontWeight: FontWeight.bold)
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 9.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "07:05",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                "07:23",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                   Icon(
                                    Icons.directions_bus,
                                    color: isLightTheme?Colors.black54:Colors.white,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2.0, horizontal: 9.0),
                                    decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius:
                                      BorderRadius.circular(9.0),
                                    ),
                                    child: const Text(
                                      "20",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                   Icon(
                                    Icons.directions_bus,
                                    color: isLightTheme?Colors.black54:Colors.white
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2.0, horizontal: 9.0),
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius:
                                      BorderRadius.circular(9.0),
                                    ),
                                    child: const Text(
                                      "20",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )


                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: <Widget>[
                          //     Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: <Widget>[
                          //         const Text(
                          //           "07:05",
                          //           style: TextStyle(color: Colors.grey),
                          //         ),
                          //         const SizedBox(
                          //           height: 3.0,
                          //         ),
                          //         Row(
                          //           mainAxisAlignment: MainAxisAlignment.start,
                          //           children: <Widget>[
                          //             const Icon(
                          //               Icons.directions_bus,
                          //               color: Colors.black54,
                          //             ),
                          //             Container(
                          //               padding: const EdgeInsets.symmetric(
                          //                   vertical: 2.0, horizontal: 9.0),
                          //               decoration: BoxDecoration(
                          //                 color: Colors.orange,
                          //                 borderRadius:
                          //                 BorderRadius.circular(9.0),
                          //               ),
                          //               child: const Text(
                          //                 "20",
                          //                 style: TextStyle(color: Colors.white),
                          //               ),
                          //             ),
                          //           ],
                          //         )
                          //       ],
                          //     ),
                          //     const SizedBox(width: 9),
                          //     Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: <Widget>[
                          //         Text(
                          //           "07:23",
                          //           style: TextStyle(color: Colors.grey),
                          //         ),
                          //         SizedBox(
                          //           height: 3.0,
                          //         ),
                          //         Row(
                          //           children: <Widget>[
                          //             Icon(
                          //               Icons.directions_bus,
                          //               color: Colors.black54,
                          //             ),
                          //             Container(
                          //               padding: EdgeInsets.symmetric(
                          //                   vertical: 2.0, horizontal: 9.0),
                          //               decoration: BoxDecoration(
                          //                 color: Colors.blue,
                          //                 borderRadius:
                          //                 BorderRadius.circular(9.0),
                          //               ),
                          //               child: Text(
                          //                 "20",
                          //                 style: TextStyle(color: Colors.white),
                          //               ),
                          //             ),
                          //           ],
                          //         )
                          //       ],
                          //     )
                          //   ],
                          // )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15,),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Image.asset("assets/images/upccode.png",height: 60,color: isLightTheme?Colors.black:Colors.white,),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PlaceModel{
  String name;
  Color color;

  PlaceModel({required this.name, required this.color});
}

class PlacesWidget extends StatefulWidget {
  const PlacesWidget({Key? key}) : super(key: key);

  @override
  _PlacesWidgetState createState() => _PlacesWidgetState();
}

class _PlacesWidgetState extends State<PlacesWidget> {
  List<PlaceModel> list = [];
  @override
  void initState() {
    super.initState();
    list.add(PlaceModel(name:"Marszalkowska", color:Colors.blue));
    list.add(PlaceModel(name:"Hotel Bristol",color: Colors.grey));
    list.add(PlaceModel(name:"Stare Miasto",color: Colors.orange));
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
            padding: const EdgeInsets.all(15),
            color: Theme.of(context).backgroundColor,
            child: ListView.builder(
                itemCount: list.length,
                shrinkWrap: true,
                itemBuilder: (con, ind) {
                  return ind != 0
                      ? Column(mainAxisSize: MainAxisSize.min, children: [
                    Row(children: [
                      Column(
                        children: List.generate(
                          3,
                              (ii) => Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              child: Container(
                                height: 3,
                                width: 2,
                                color: Colors.grey,
                              )),
                        ),
                      ),

                    ]),
                    Row(children: [
                      Icon(Icons.location_on, color: list[ind].color),
                      Text(list[ind].name,
                          style: TextStyle(color: list[ind].color))
                    ])
                  ])
                      : Row(children: [
                    Icon(Icons.location_on, color: list[ind].color),
                    Text(list[ind].name,
                        style: TextStyle(color: list[ind].color))
                  ]);
                }));
  }



}


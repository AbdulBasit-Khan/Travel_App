import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_template/screens/flight/flight_ticket_screen.dart';

import 'package:travel_app_template/utils/colors_const.dart';
import 'package:travel_app_template/utils/common_functions.dart';
import '../payment_screen.dart';

class TicketCard extends StatefulWidget {
  final int price;
  final String destinationCode;
  final String originCode;
  final String arrivalTime;
  final String departureTime;
  final String totalTime;
  final bool ticketType;
   const TicketCard(
      {Key? key, required this.price,
        required   this.arrivalTime,
        required  this.departureTime,
        required  this.destinationCode,
        required  this.originCode,
        required  this.totalTime,
        required  this.ticketType}) : super(key: key);
  @override
  _TicketCardState createState() => _TicketCardState();
}

class _TicketCardState extends State<TicketCard> {
  @override
  Widget build(BuildContext context) {
    bool isLightTheme= CommonFunctions.isLightTheme(context);
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
          child: Stack(
            children: <Widget>[
              Card(
                color: Theme.of(context).backgroundColor,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 15.0, bottom: 15.0, left: 35.0, right: 35.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('\$${widget.price}',
                              style: TextStyle(
                                color: ColorsConstants.orange,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w900,
                              ))
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          Text('Fr 6 Mar.', style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0,
                          )),
                          Text('Fr 6 Mar.', style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0,
                          )),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(widget.originCode,
                              style: const TextStyle(

                                fontSize: 20.0,
                              )),
                          Text(widget.destinationCode,
                              style: const TextStyle(

                                fontSize: 25.0,
                              ))
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(widget.departureTime,
                              style: const TextStyle(

                                fontSize: 15.0,
                              )),
                          Text(widget.arrivalTime,
                              style: const TextStyle(

                                fontSize: 15.0,
                              )),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      Row(
                        children:   <Widget>[
                          const Icon(Icons.blur_on, color: Colors.grey),
                          Expanded(child: MySeparator(color: isLightTheme?Colors.black:Colors.white)),
                          const Icon(Icons.flight_takeoff, color: Colors.grey),
                          Expanded(child: MySeparator(color: isLightTheme?Colors.black:Colors.white)),
                          const Icon(Icons.blur_on, color: Colors.grey),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(widget.totalTime,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: const EdgeInsets.only(right: 3,top: 3),
                  decoration: BoxDecoration(
                    color: widget.ticketType ? ColorsConstants.orange : Colors.grey,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        topRight: Radius.circular(20.0)),
                  ),
                  height: 40.0,
                  width: 70.0,
                  child: widget.ticketType
                      ? const Center(
                          child: Text(
                            'Top',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : const Center(
                          child: Text(
                            'Med',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 0,
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PaymentScreen(onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const TicketScreen()));
                    },)));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 3,top: 3),
                    decoration: BoxDecoration(
                      color:  ColorsConstants.appColor,
                      borderRadius:  const BorderRadius.only(bottomRight:Radius.circular(20),topLeft:  Radius.circular(10))
                    ),
                    height: 35.0,
                    width: 70.0,
                    child:  const Center(
                      child: Text(
                        'Book',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    )


                  ),
                ),
              ),
            ],
          ),
        ),




      ],
    );
  }
}

class MySeparator extends StatelessWidget {
  final double height;
  final Color color;

   const MySeparator({Key? key, this.height = 1, this.color = Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 4.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}

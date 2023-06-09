import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:travel_app_template/models/train_ticket_model.dart';
import 'package:travel_app_template/screens/train_book/ticket_details.dart';
import 'package:travel_app_template/utils/colors_const.dart';
import 'package:travel_app_template/utils/common_functions.dart';

class TicketContainer extends StatelessWidget {
  final TrainTicketModel model;

  const TicketContainer({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLightTheme=CommonFunctions.isLightTheme(context);
    return Container(
        padding: const EdgeInsets.all(15.0),
        margin:  const EdgeInsets.symmetric(vertical: 15.0),
        decoration: BoxDecoration(
            border: Border.all(
              color:isLightTheme? Colors.grey[300]!:ColorsConstants.dividerColor,
            ),
            borderRadius: BorderRadius.circular(25.0)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Departure In:"),
                RichText(
                  text: TextSpan(
                    children: [
                       TextSpan(
                          text: "Travel Time: ",
                          style: TextStyle(color: isLightTheme?Colors.black87:Colors.white)),
                      TextSpan(
                          text: model.travelTime.toString() + " ",
                          style:  TextStyle(
                              fontWeight: FontWeight.bold,
                              color:isLightTheme? Colors.black87:Colors.white)),
                       TextSpan(
                          text: "min",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isLightTheme?Colors.black87:Colors.white)),
                    ],
                  ),
                ),
                Text(
                    model.currentTime
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: model.departTime.toString(),
                          style:  TextStyle(
                            fontSize: 22,
                            color: isLightTheme?Colors.black:Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                       TextSpan(
                          text: "min",
                           style: TextStyle(fontSize: 15,color:isLightTheme?Colors.black:Colors.white)),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.train,
                      size: 15,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    Text(
                      model.inTime.toString(),
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.train,
                      size: 15,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    Text(
                      model.outTime,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                const Icon(
                  Icons.emoji_food_beverage,
                  size: 15,
                  color: Colors.grey,
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 60,
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue.withOpacity(.3),
                          border: Border.all(color: Colors.blue, width: 3.0),
                        ),
                      ),
                      Expanded(
                        child: CustomPaint(
                            size: const Size(1, double.infinity),
                            painter: DashedLineVerticalPainter()),
                      ),
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orange.withOpacity(.3),
                          border: Border.all(color: Colors.orange, width: 3.0),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.sourcePlace,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      Expanded(child: Container()),
                      Text(
                        model.destinationPlacel,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  Column(
                    children: [
                      Expanded(child: Container()),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const TrainTicketDetails()));
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 7),
                            decoration: BoxDecoration(
                                color: ColorsConstants.amberColor,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.confirmation_number,
                                    color: Colors.white),
                                const SizedBox(width: 5,),
                                RichText(text: TextSpan(
                                    children: [
                                      const TextSpan(
                                          text: "Ticket: ",
                                          style: TextStyle(
                                              color: Colors.white,
                                            fontWeight: FontWeight.bold
                                          )
                                      ),
                                      TextSpan(text: model.ticketNumber,style: const TextStyle(color: Colors.white))
                                    ]
                                ))


                              ],
                            )),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class   DashedLineVerticalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 5,
        dashSpace = 3,
        startY = 0;
    final paint = Paint()
      ..color = Colors.grey[300]!
      ..strokeWidth = 1;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}




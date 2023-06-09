import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_app_template/models/train_ticket_model.dart';
import 'package:travel_app_template/screens/train_book/ticket_container.dart';
import 'package:travel_app_template/utils/colors_const.dart';
import 'package:travel_app_template/utils/date_time_picker/date_picker_widget.dart';
import 'departure_selector.dart';
import 'location_selector_container.dart';


class TrainBookingScreen extends StatefulWidget {
  const TrainBookingScreen({Key? key}) : super(key: key);

  @override
  _TrainBookingScreenState createState() => _TrainBookingScreenState();
}

class _TrainBookingScreenState extends State<TrainBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.amberColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children:  [
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                          child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 25,
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Book train ticket",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Depart at: ",
                        style: TextStyle(
                            color: Colors.white.withOpacity(.79),
                            fontSize: 15.0),
                      ),
                      const DepartureSelector(),
                      const Spacer(),
                      Row(children: [
                        Icon(
                          Icons.settings,
                          color: Colors.white.withOpacity(.85),
                        ),
                        const SizedBox(width: 8,),
                        Text(
                          "Filters",
                          style:
                          TextStyle(color: Colors.white.withOpacity(.85)),
                        ),
                        const SizedBox(width: 2,),
                      ],)

                    ],
                  ),
                  const LocationSelectorContainer(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Choose Date",
                    style: TextStyle(
                        color: Colors.white.withOpacity(.79), fontSize: 15.0),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 15,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: DatePicker(
                        DateTime.now(),
                        initialSelectedDate: DateTime.now(),
                        selectionColor: ColorsConstants.amberColor,
                        selectedTextColor: Colors.white,
                        dayTextStyle: const TextStyle(fontSize: 10,color: Colors.black),
                        monthTextStyle: const TextStyle(fontSize: 10,color: Colors.black),
                        dateTextStyle: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),
                        onDateChange: (date) {
                          // New date selected
                          setState(() {
                            //  _selectedValue = date;
                          });
                        },
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15, top: 10, bottom: 15),
                decoration:  BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, -5),
                      blurRadius: 9,
                    ),
                  ],
                  color: Theme.of(context).backgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(35.0),
                    topRight: Radius.circular(35.0),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 5,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.withAlpha(150),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: trainTicketModelList.length,
                        itemBuilder: (ctx, i) {
                          return TicketContainer(model: trainTicketModelList[i],);
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

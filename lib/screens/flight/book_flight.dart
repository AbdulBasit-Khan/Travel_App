import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_template/screens/flight/tabs.dart';
import 'package:travel_app_template/utils/colors_const.dart';

import 'flight_tickets.dart';

class BookFlightScreen extends StatefulWidget {
  const BookFlightScreen({Key? key}) : super(key: key);

  @override
  _BookFlightScreenState createState() => _BookFlightScreenState();
}

class _BookFlightScreenState extends State<BookFlightScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.2,
            decoration: BoxDecoration(
                color: ColorsConstants.appColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(45.0),
                    bottomRight: Radius.circular(45.0))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                          child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                      const Icon(
                        Icons.menu,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                const FlyingDetails(),
                const SizedBox(height: 10.0),
                const SortingDetails(),
                const SizedBox(height: 5.0),
                const MyTabs(),
                const SizedBox(
                  height: 30,
                ),
                const FlightTickets()
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FlyingDetails extends StatefulWidget {
  const FlyingDetails({Key? key}) : super(key: key);

  @override
  _FlyingDetailsState createState() => _FlyingDetailsState();
}

class _FlyingDetailsState extends State<FlyingDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0, left: 20.0, right: 20.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text('Odessa',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  )),
              Text('Fr 6 Mar.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w100,
                  ))
            ],
          ),
          const SizedBox(height: 5.0),
          Row(
            children: const <Widget>[
              Text('Los Angeles',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w700,
                  ))
            ],
          )
        ],
      ),
    );
  }
}

class SortingDetails extends StatefulWidget {
  const SortingDetails({Key? key}) : super(key: key);

  @override
  _SortingDetailsState createState() => _SortingDetailsState();
}

class _SortingDetailsState extends State<SortingDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children:  <Widget>[
                  const Text('Sort by:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      )),
                  const SizedBox(width: 10.0),
                  DropDown(dropDownValue: 'Price')
                ],
              )
            ],
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          color: ColorsConstants.appColor.withAlpha(40),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                      Positioned(
                        left: 20.0,
                        child: Container(
                          height: 16.0,
                          width: 16.0,
                          decoration: BoxDecoration(
                            color: ColorsConstants.orange,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Center(
                            child: Text(
                              '1',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 10.0),
                  Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        color: ColorsConstants.appColor.withAlpha(40),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class DropDown extends StatefulWidget {
  late  String? dropDownValue;

   DropDown({Key? key,this.dropDownValue,}) : super(key: key);

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white12, borderRadius: BorderRadius.circular(15.0)),
      height: 30.0,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            dropdownColor: ColorsConstants.appColor2,
            value: widget.dropDownValue,
            icon: const Icon(
              Icons.arrow_drop_down,
              size: 30.0,
              color: Colors.white,
            ),
            onChanged: (String? newValue) {
              setState(() {
                widget.dropDownValue = newValue!;
              });
            },
            items: <String>['Price', 'Stops', 'Arrival', 'Departure']
                .map<DropdownMenuItem<String>>((String newValue) {
              return DropdownMenuItem<String>(
                value: newValue,
                child: Text(
                  newValue,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

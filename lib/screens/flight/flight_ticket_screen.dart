import 'package:flutter/material.dart';
import 'package:travel_app_template/utils/strings.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.4,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/worldmap.jpg'),
                            fit: BoxFit.cover)),
                  ),
                ),
                 Positioned(
                  top: 50.0,
                  left: 160.0,
                  child: Text(
                    Strings.eTicket,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ),
                 Positioned(
                    top: 50.0,
                    left: 20,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                    )),
                Positioned(
                    top: 200.0,
                    left: 60.0,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 6.0,
                          height: 6.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.0),
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          width: 120.0,
                          height: 1.0,
                          color: Colors.white,
                        ),
                        const Icon(
                          Icons.flight_takeoff,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        Container(
                          width: 120.0,
                          height: 1.0,
                          color: Colors.white,
                        ),
                        Container(
                          width: 8.0,
                          height: 8.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.0),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )),
                Positioned(
                  top: 225.0,
                  left: 40.0,
                  child: Column(
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 4.0),
                        child: Text(
                          'ODS',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 4.0),
                        child: Text(
                          'Sleman',
                          style: TextStyle(color: Colors.white, fontSize: 14.0),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 225.0,
                  left: 310.0,
                  child: Column(
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 4.0),
                        child: Text(
                          'CA(LXS)',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 4.0),
                        child: Text(
                          'Mbantul',
                          style: TextStyle(color: Colors.white, fontSize: 14.0),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 300.0,
                  left: 30.0,
                  right: 30.0,
                  child: ClipPath(
                    clipper: MyClipper(),
                    child: Container(
                      width: 200.0,
                      height: 450.0,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    width: 120.0,
                                    height: 25.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      border: Border.all(
                                          width: 1.0, color: Colors.green),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Business Class',
                                        style: TextStyle(color: Colors.green),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: const <Widget>[
                                      Text(
                                        'ODS',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: Icon(
                                          Icons.flight_takeoff,
                                          color: Colors.pink,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          'CA(LXS)',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: Text(
                                  '4 Flight Tickets',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 25.0),
                                child: Column(
                                  children: <Widget>[
                                    ticketDetailsWidget('Passengers', 'Ilona',
                                        'Date', '24-12-2018'),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12.0, right: 40.0),
                                      child: ticketDetailsWidget(
                                          'Flight', '76836A45', 'Gate', '66B'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12.0, right: 40.0),
                                      child: ticketDetailsWidget(
                                          'Class', 'Business', 'Seat', '21B'),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 25.0),
                                child: Container(
                                  width: 300.0,
                                  height: 1.0,
                                  color: Colors.grey,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Container(
                                  width: 250.0,
                                  height: 60.0,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/barcode.png'),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    top: 10.0, left: 75.0, right: 75.0),
                                child: Text(
                                  '9824 0972 1742 1298',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget ticketDetailsWidget(String firstTitle, String firstDesc,
      String secondTitle, String secondDesc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                firstTitle,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  firstDesc,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                secondTitle,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  secondDesc,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.addOval(Rect.fromCircle(
        center: Offset(0.0, size.height / 2 + 50.0), radius: 20.0));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height / 2 + 50.0), radius: 20.0));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

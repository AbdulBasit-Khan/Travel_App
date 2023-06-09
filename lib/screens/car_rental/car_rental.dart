import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app_template/models/car_dealer.dart';
import 'package:travel_app_template/models/car_model.dart';
import 'package:travel_app_template/screens/car_rental/car_details.dart';
import 'package:travel_app_template/utils/colors_const.dart';
import 'package:travel_app_template/utils/common_functions.dart';
import 'package:travel_app_template/utils/strings.dart';
import 'available_cars.dart';

class CarRentalScreen extends StatefulWidget {
  const CarRentalScreen({Key? key}) : super(key: key);

  @override
  _CarRentalScreenState createState() => _CarRentalScreenState();
}

class _CarRentalScreenState extends State<CarRentalScreen> {

  List<CarModel> cars = carModelList;
  List<CarDealer> dealers = getDealerList();
  @override
  Widget build(BuildContext context) {
    bool isLightTheme=CommonFunctions.isLightTheme(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title:  Text(
          Strings.carRental,
          style: themeTitleStyle,
        ),
        centerTitle: false,

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: Strings.search,
                  hintStyle: const TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor:isLightTheme? Colors.grey[100]:Colors.black45,
                  contentPadding: const EdgeInsets.only(left: 30,),
                  suffixIcon: const Padding(
                    padding: EdgeInsets.only(right: 24.0, left: 16.0),
                    child: Icon(
                      Icons.search,

                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                decoration: BoxDecoration(
                  color: isLightTheme?Colors.grey[100]:  Theme.of(context).backgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text(
                            Strings.topDeals,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600],
                            ),
                          ),

                          Row(
                            children: [
                              Text(
                                Strings.viewAll,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsConstants.amberColor,
                                ),
                              ),

                              const SizedBox(
                                width: 8,
                              ),

                              Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                                color: ColorsConstants.amberColor,
                              ),

                            ],
                          ),

                        ],
                      ),
                    ),
                    SizedBox(
                      height: 255,
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: buildDeals(isLightTheme),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        print('hi');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AvailableCars()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorsConstants.amberColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          padding: const EdgeInsets.all(24),
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:  [

                                  Text(
                                    Strings.availableCars,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),

                                  Text(
                                    Strings.longTerm,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),

                                ],
                              ),

                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                height: 50,
                                width: 50,
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: ColorsConstants.amberColor,
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text(
                            Strings.topDeals,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600],
                            ),
                          ),

                          Row(
                            children: [

                              Text(
                               Strings.viewAll,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsConstants.amberColor,
                                ),
                              ),

                              const SizedBox(
                                width: 8,
                              ),

                              Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                                color: ColorsConstants.amberColor,
                              ),

                            ],
                          ),

                        ],
                      ),
                    ),

                    Container(
                      height: 150,
                      margin: const EdgeInsets.only(bottom: 16),
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: buildDealers(isLightTheme),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),

        ],
      ),

    );
  }


  List<Widget> buildDeals(isLightTheme){
    List<Widget> list = [];
    for (var i = 0; i < cars.length; i++) {
      list.add(
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CarDetailsScreen(car: cars[i])),
                );
              },
              child: buildCar(cars[i], i,isLightTheme)
          )
      );
    }
    return list;
  }

  List<Widget> buildDealers(isLightTheme){
    List<Widget> list = [];
    for (var i = 0; i < dealers.length; i++) {
      list.add(buildDealer(dealers[i], i,isLightTheme));
    }
    return list;
  }
}

Widget buildCar(CarModel car, int index,isLightTheme){
  return Card(
    color: isLightTheme?Colors.white:Colors.black,
    elevation: isLightTheme?0:10,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    child: Container(
      padding: const EdgeInsets.all(15),
      margin: EdgeInsets.only(right:  16 , left: index == 0 ? 16 : 0),
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                color: ColorsConstants.amberColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  car.condition,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 8,
          ),

          SizedBox(
            height: 100,
            child: Center(
              child: Hero(
                tag: car.model,
                child: Image.asset(
                  car.images[0],
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 24,
          ),


          Text(
            car.model,
            style: const TextStyle(
                fontSize: 16
            ),
          ),

          const SizedBox(
            height: 4,
          ),

          Text(
            car.brand,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              height: 1,
            ),
          ),

          Text(
            "per " + (car.condition == "Daily" ? "day" : car.condition == "Weekly" ? "week" : "month"),
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),

        ],
      ),
    ),
  );
}

Widget buildDealer(CarDealer dealer, int index,isLightTheme){
  return Container(
    decoration:  BoxDecoration(
      color: isLightTheme?Colors.white:Colors.black,
      borderRadius: const BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    padding: const EdgeInsets.all(16),
    margin: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0),
    width: 150,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[

        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(dealer.image),
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          height: 60,
          width: 60,
        ),

        const SizedBox(
          height: 16,
        ),

        Text(
          dealer.name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
        ),

        Text(
          dealer.offers.toString() + " offers",
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),

      ],
    ),
  );
}

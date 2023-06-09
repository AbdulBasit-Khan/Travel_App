
import 'package:flutter/material.dart';
import 'package:travel_app_template/models/car_dealer.dart';
import 'package:travel_app_template/models/car_model.dart';
import 'package:travel_app_template/screens/car_rental/car_details.dart';
import 'package:travel_app_template/utils/colors_const.dart';
import 'package:travel_app_template/utils/common_functions.dart';

class AvailableCars extends StatefulWidget {
  const AvailableCars({Key? key}) : super(key: key);

  @override
  _AvailableCarsState createState() => _AvailableCarsState();
}

class _AvailableCarsState extends State<AvailableCars> {

  List<Filter> filters = getFilterList();
  late Filter selectedFilter;

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedFilter = filters[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isLightTheme=CommonFunctions.isLightTheme(context);
    return Scaffold(
      backgroundColor:isLightTheme? Colors.grey[100]:Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,

                    ),
                  ),
                  const SizedBox(width: 10,),
                  Text(
                    "Available Cars (" + carModelList.length.toString() + ")",
                    style: themeTitleStyle
                  ),
                ],

              ),

              const SizedBox(
                height: 16,
              ),

              Expanded(
                child: GridView.count(
                  physics: const BouncingScrollPhysics(),
                  childAspectRatio: 1 / 1.29,
                  crossAxisCount: 2,

                  children: carModelList.map((item) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CarDetailsScreen(car: item)),
                        );
                      },
                      child: buildAvailableCar(item, 0,isLightTheme)
                    );
                  }).toList(),
                ),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        decoration:  BoxDecoration(
          color:isLightTheme? Colors.white:Theme.of(context).backgroundColor,
        ),
        child: Row(
          children: [
            buildFilterIcon(),
            Row(
              children: buildFilters(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFilterIcon(){
    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: ColorsConstants.amberColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.filter_list,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }

  List<Widget> buildFilters(){
    List<Widget> list = [];
    for (var i = 0; i < filters.length; i++) {
      list.add(buildFilter(filters[i]));
    }
    return list;
  }

  Widget buildFilter(Filter filter){
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = filter;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Text(
          filter.name,
          style: TextStyle(
            color: selectedFilter == filter ? ColorsConstants.amberColor : Colors.grey[300],
            fontSize: 16,
            fontWeight: selectedFilter == filter ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
Widget buildAvailableCar(CarModel car, int index,isLightTheme){
  return Container(
    decoration:  BoxDecoration(
      color: isLightTheme?Colors.white:Colors.black,
      borderRadius: const BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.only(right: 5 , left: 5,bottom: 10),

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
          height: 80,
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
          height: 10,
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
  );
}
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_template/screens/weather_forecast/weather_details.dart';
import 'package:travel_app_template/screens/weather_forecast/weather_status_config.dart';
import 'package:travel_app_template/utils/common_functions.dart';
import 'package:http/http.dart' as http;
import '../../models/weather_model.dart';
import '../../utils/colors_const.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
String currentLocation='';
double latitude=0,longitude=0;
 late WeatherModel weather;
 bool temperature=false;
 late Placemark place;
 _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((value) async {
        List<Placemark> p = await placemarkFromCoordinates(
         value.latitude, value.longitude);
       place = p[0];
            
            currentLocation= "${place.locality}";
           latitude=value.latitude;
           longitude=value.latitude;
       
      });
      setState(() {
        
      });
      }
      getForecast() async {
        
       String url='https://api.open-meteo.com/v1/forecast?latitude=${latitude}&longitude=${longitude}&daily=weathercode&timezone=GMT&current_weather=true&hourly=visibility,relativehumidity_2m,pressure_msl';
        final response = await http.get(Uri.parse(url)) ;
          var data = jsonDecode(response.body.toString());
          
          if(response.statusCode == 200){
      weather= WeatherModel.fromJson(data);
    }
    temperature=true;
    setState(() {
      
    });
      } 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentLocation();
    getForecast();

   
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: ColorsConstants.lightWhite,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorsConstants.amberColor.withOpacity(0.7),
              ),
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(children: [
                  AppBar(
                    iconTheme: IconThemeData(color: Colors.white),
                    centerTitle: true,
                    title: Text('Manage Location',
                        style: TextStyle(color: Colors.white)),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                      width: double.infinity,
                      height: 32,
                      child: Container(
                        width: double.infinity,
                        height: 32,
                        decoration: BoxDecoration(
                            color: ColorsConstants.lightWhite,
                            borderRadius: BorderRadius.circular(16)),
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 14),
                              hintText: 'Search Your City',
                              hintStyle: TextStyle(color: Colors.grey),
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(top: 1.5),
                                child: Icon(CupertinoIcons.search),
                              ),
                              filled: true,
                              fillColor: Colors.transparent,
                              border: InputBorder.none),
                        ),
                      )),
                  SizedBox(height: 40),
                  InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>WeatherDetailsScreen(weather: weather,place:place)));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: ColorsConstants.lightWhite,
                          borderRadius: BorderRadius.circular(16)),
                         child:temperature? Padding(
                           padding: const EdgeInsets.symmetric(horizontal:16),
                           child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                              Row(children: [
                                 Text(currentLocation,
                                 style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                                 Icon(Icons.location_pin,color: ColorsConstants.grey,)
                              ],),
                              
                              
                              Text(temperature?weather.currentWeather!.temperature.toString():"00.0",style: TextStyle(color: ColorsConstants.grey),)
                             
                             ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment:MainAxisAlignment.center,
                              children: [
                                                    
                              Text(WeatherStatusConfig.getCurrentWeatherStatus(weather.currentWeather!.weathercode!),style:TextStyle(color:ColorsConstants.darkBG,fontSize: 20),)
                            ],)
                            
                            
                            ],
                           ),
                         ):CircularProgressIndicator(),
                    ),
                  )
                ]),
              ),
            ),
          ),
        ));
  }
}

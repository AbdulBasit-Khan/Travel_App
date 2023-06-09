import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:travel_app_template/screens/weather_forecast/weather_status_config.dart';
import '../../models/weather_model.dart';
import '../../utils/colors_const.dart';

class WeatherDetailsScreen extends StatefulWidget {
   Placemark place;
   int i=1;
   WeatherModel weather;
   WeatherDetailsScreen({Key? key,required this.weather,required this.place}) : super(key: key);

  @override
  State<WeatherDetailsScreen> createState() => _WeatherDetailsScreenState();
}

class _WeatherDetailsScreenState extends State<WeatherDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.amberColor.withOpacity(0.9),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView(children: [
              AppBar(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Center(
                    child: Text(
                  'Today, ${DateFormat.MMMMEEEEd('en_US').format(DateTime.parse(widget.weather!.currentWeather!.time!.substring(0,10)))}',
                  style: TextStyle(
                      color: ColorsConstants.lightWhite, fontSize: 14),
                )),
                Text(
                  widget.place.subAdministrativeArea!,
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: ColorsConstants.lightWhite),
                ),
                Text(
                  widget.place.administrativeArea!,
                  style: TextStyle(
                      fontSize: 20, color: ColorsConstants.lightWhite),
                ),
                SizedBox(height: 18),
                CircleAvatar(
                    radius: 120,
                    backgroundColor: ColorsConstants.lightWhite,
                    child: Text(
                      '${widget.weather.currentWeather!.temperature}°C',
                      style: TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.w300,
                          color: ColorsConstants.lightBlack),
                    )),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 57),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('Wind status',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorsConstants.lightWhite)),
                          SizedBox(height: 3),
                          Text('${widget.weather.currentWeather!.windspeed} kmh',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: ColorsConstants.lightWhite)),
                          SizedBox(height: 20),
                          Text('Humidity',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorsConstants.lightWhite)),
                          SizedBox(height: 3),
                          Text('${widget.weather.hourly!.relativehumidity2m![0]}%',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: ColorsConstants.lightWhite)),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Visibility',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorsConstants.lightWhite)),
                          SizedBox(height: 3),
                          Text('${widget.weather.hourly!.visibility![0]*0.00062}',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: ColorsConstants.lightWhite)),
                          SizedBox(height: 20),
                          Text('Sea level pressure',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorsConstants.lightWhite)),
                          SizedBox(height: 3),
                          Text('${widget.weather.hourly!.pressureMsl![0]} hPa',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: ColorsConstants.lightWhite)),
                        ],
                      )
                    ],
                  ),
                )
              ]),
              SizedBox(height: 20)
            ]),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                  color: ColorsConstants.lightWhite),
                  child: Padding(
                    padding: const EdgeInsets.only(left:15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      SizedBox(height:60),
                      Text('The Next 5 days',style:TextStyle(fontWeight: FontWeight.bold,color: ColorsConstants.lightBlack)),
                      SizedBox(
                        height: 16,
                      ),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:5,
                          itemBuilder: (context,index){
                          return Padding(
                            padding: const EdgeInsets.only(right: 9),
                            child: Container(
                              height:93,
                              width:70,
                              child:Column(children: [
                                Text("${DateFormat('EEEE').format(DateTime.parse(widget.weather.daily!.time![widget.i++]))}",style:TextStyle(fontSize:10,fontWeight:FontWeight.w500)),
                                SizedBox(
                                  height:5
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color:ColorsConstants.veryLightGrey),
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  height:75, width:70,
                                  child: Center(child: Text(WeatherStatusConfig.getCurrentWeatherStatus(widget.weather.daily!.weathercode![widget.i]),)),
                                )
                              ],)
                            ),
                          );
                        }),
                      )
                    ]),
                  ),
            ),
          )
        ],
      ),
    );
  }
}

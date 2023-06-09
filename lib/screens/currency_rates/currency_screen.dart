import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_template/provider/app_provider.dart';
import 'package:travel_app_template/provider/app_state.dart';

import 'package:travel_app_template/utils/common_functions.dart';
import 'package:travel_app_template/utils/strings.dart';
import 'package:travel_app_template/widgets/custom_textField.dart';
import 'package:http/http.dart' as http;
import '../../utils/colors_const.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({Key? key}) : super(key: key);

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
List<String> suggestions = [];
var data;
var amountController=TextEditingController();
var baseController=TextEditingController();
var exchangeController=TextEditingController();
var resultController=TextEditingController();
var convertedData;

void getCurrencies(Map<dynamic, dynamic> map) {
  map.keys.forEach((key) {
  suggestions.add(key);
  });
}
 
 fetchExchangeRates() async {
  var requestURL = 'https://api.exchangerate.host/latest';

  var response = await http.get(Uri.parse(requestURL));

  if (response.statusCode == 200) {
    data = await jsonDecode(response.body.toString());
    getCurrencies(data['rates']);
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
}
void convert() async {
  resultController.text="loading...";
  setState(() {
    
  });
  var requestURL = Uri.parse('https://api.exchangerate.host/convert?amount=${amountController.text}&from=${baseController.text.toUpperCase()}&to=${exchangeController.text.toUpperCase()}');
  var response = await http.get(requestURL);
  if (response.statusCode == 200) {
    convertedData = jsonDecode(response.body);
  
    resultController.text=convertedData['result'].toString()+" "+exchangeController.text;
      setState(() {
                    
                  });   
  } else {
    // print('Request failed with status: ${response.statusCode}');
  }
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();

   fetchExchangeRates() ;
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        title: Text(Strings.currencyRates,style:themeTitleStyle),
        backgroundColor: ColorsConstants.amberColor,
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment:MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height:10),
              CustomTextField(suggestions: suggestions,hintText: Strings.baseCurrency,controller: baseController,),
          
        SizedBox(
          height:60,
          child: Row(
            children:[
              SizedBox(width:5),
               VerticalDivider(
                  color: ColorsConstants.lightGrey, 
                  width: 10, 
                  thickness: 3,   indent: 5, 
                   endIndent: 0,
                ),]
          ),
        ),
        Text('To',style: TextStyle(color: ColorsConstants.amberColor,fontSize: 20,fontWeight: FontWeight.bold)),
         SizedBox(
          height:60,
          child: Row(
            children:[
              SizedBox(width:5),
               VerticalDivider(
                  color: ColorsConstants.lightGrey, 
                  width: 10, 
                  thickness: 3,   indent: 0, 
                   endIndent: 5,
                ),]
          ),
        ),
        CustomTextField(suggestions: suggestions,hintText: Strings.exchangeCurrency,controller: exchangeController,),
        
        SizedBox(height:10),
        TextFormField(
         controller: amountController,
          decoration: InputDecoration(
            border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                     ) ,
            hintText:Strings.enterAmount
          ),
        ),
        
             SizedBox(height:10),
             InkWell(
              onTap: (){
                if(amountController.text.isEmpty){
                  resultController.text='Please enter amount first';
                }
               else{
                 
                  convert();
                                     
               }
              },
              child:  Center(
                child: Container(
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorsConstants.amberColor,    
                  ),
                  height:40,
                  width:110,
                  child:resultController.text=="loading..."?Center(child:SizedBox(
                    height:30, width:30,
                    child: CircularProgressIndicator(color:ColorsConstants.lightWhite))):
                  Center(child:Text(Strings.convert,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
                ),
              )
             ),
             SizedBox(height:10),
             TextField( 
              enabled: false,
              controller:resultController,
              decoration: InputDecoration(
                                             
            border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                     ) ,
            
          ),)
          ],),
        ),
      )
    );
  }
}
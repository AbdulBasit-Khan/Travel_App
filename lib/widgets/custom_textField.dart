import 'package:flutter/material.dart';
import 'package:travel_app_template/screens/currency_rates/currency_screen.dart';

import '../utils/strings.dart';

class CustomTextField extends StatefulWidget {
  List<String> suggestions;
  String hintText;
  TextEditingController controller;  
   CustomTextField({Key? key,required this.suggestions,required this.hintText,required this.controller}) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}


class _CustomTextFieldState extends State<CustomTextField> {

  @override
  Widget build(BuildContext context) {
    return     RawAutocomplete(
          optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }else{
            List<String> matches = <String>[];
            matches.addAll(widget.suggestions);
      
            matches.retainWhere((s){
              return s.toLowerCase().contains(textEditingValue.text.toLowerCase());
            });
            return matches;
        }
          },
      
          onSelected: (String selection) {

          widget.controller.text=selection;
          }, 
      
          fieldViewBuilder: (BuildContext context,TextEditingController textEditingController,
          FocusNode focusNode,
          VoidCallback onFieldSubmitted) {
            return TextField(
              decoration: InputDecoration(
                 hintText:widget.hintText,
                 border: OutlineInputBorder(
                  
                  borderRadius: BorderRadius.circular(10)
                 )
              ),
              controller:textEditingController,
              focusNode: focusNode,
              onSubmitted: (String value) {
                          },
            );
          },
      
          optionsViewBuilder: (BuildContext context, void Function(String) onSelected, 
                           Iterable<String> options) { 
          return Material(
            child:SizedBox(
              height: 200,
              child:SingleChildScrollView(
                child: Column(
                  children: options.map((opt){
                    return InkWell(
                      onTap: (){
                         onSelected(opt);
                                     
                      },
                      child:Container(
                          padding: EdgeInsets.only(right:60),
                          child:Card(
                              child: Container( 
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                child:Text(opt),
                              )
                          )
                      )
                    );
                  }).toList(),
                )
              )
            )
          );
          },
      );
  }
}
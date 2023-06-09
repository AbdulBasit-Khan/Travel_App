import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_template/models/address_model.dart';
import 'package:travel_app_template/utils/colors_const.dart';
import 'package:travel_app_template/utils/common_functions.dart';
import 'package:travel_app_template/utils/strings.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        title:  Text(Strings.address,style: themeTitleStyle,),
      ),
      body: Column(
          children:[
          Divider(color: Colors.grey.shade300,),
          Expanded(
            child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            itemCount: addressModelList.length,
            itemBuilder: (context, index) {
              AddressModel model=addressModelList[index];
              return Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 20),
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300),
                    color:  Colors.grey.withAlpha(30)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(model.icon),
                        const SizedBox(width: 8,),
                        Text(model.type,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        const SizedBox(width: 8,),
                        model.isDefault?Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: ColorsConstants.appColor
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          child: const Text("Default",style: TextStyle(color: Colors.white),),
                        ):Container()
                      ],
                    ),
                    const SizedBox(height: 5,),
                    Text(model.aria,style: const TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
                    const SizedBox(height: 5,),
                    Text(model.landline,style: const TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
                    const SizedBox(height: 10,),
                    Text(model.address,style: const TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.grey),),
                  ],
                ),
              );
            },
        ),
          ),
    ]
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddressModel {

  IconData icon;
  String type;
  String aria;
  String landline;
  String address;
  bool isDefault;

  AddressModel(this.icon, this.type, this.aria, this.landline, this.address,this.isDefault);

}
List<AddressModel> addressModelList = addressDataList.map((item) => AddressModel( item['icon'] as IconData,item['type'].toString(),item['aria'].toString(),item['landline'] as String,item['address'] as String,item['isDefault'] as bool
))
    .toList();


var addressDataList = [
  {
    "icon": FontAwesomeIcons.briefcase,
    "type": "Office",
    "aria" : "Mahmad Raze",
    "landline" : "+971-50-1234567",
    "address":"Room # 1 - Ground Flour, Al Najoum Building ,24 B Street, Dubai - United Arab Emirates",
    "isDefault": true
  },
  {
    "icon": FontAwesomeIcons.home,
    "type": "Home",
    "aria" : "Mahmad Raze",
    "landline" : "+971-50-1234567",
    "address":"Abu Dhabi mall - 10th st- Al zahyain, Abu Dhabi united arab emirates",
    "isDefault": false
  },
];



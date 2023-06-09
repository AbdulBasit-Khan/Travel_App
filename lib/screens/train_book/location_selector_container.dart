import 'package:flutter/material.dart';
import 'package:travel_app_template/utils/colors_const.dart';

class LocationSelectorContainer extends StatefulWidget {
  const LocationSelectorContainer({Key? key}) : super(key: key);

  @override
  State<LocationSelectorContainer> createState() => _LocationSelectorContainerState();
}

class _LocationSelectorContainerState extends State<LocationSelectorContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue.withOpacity(.3),
                        border: Border.all(color: Colors.blue, width: 3.0),
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "From",style: TextStyle(color: Colors.black),
                        ),

                        GestureDetector(
                            child: const Text(
                              "Your Location",style: TextStyle(color: Colors.black),

                            ),
                            onTap: () {}),
                      ],
                    )
                  ],
                ),
                 Divider(
                  height: 25,
                  color: ColorsConstants.dividerColor.withAlpha(25),
                  thickness: .7,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange.withOpacity(.3),
                        border: Border.all(color: Colors.orange, width: 3.0),
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "To",style: TextStyle(color: Colors.black),

                        ),
                        GestureDetector(
                            child: const Text(
                              "Choose A Destination",style: TextStyle(color: Colors.black),
                            ),
                            onTap: () {}),
                      ],
                    )
                  ],
                ),


              ],
            ),
          ),
          const SizedBox(
            width: 15.0,
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xfff0f3f7),
                borderRadius: BorderRadius.circular(5.0)),
            child: IconButton(
              icon: const Icon(
                Icons.import_export,
                color: Colors.black54,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}

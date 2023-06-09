import 'package:flutter/material.dart';


class LocationRow extends StatelessWidget {
  final Color color;
  final Icon icon;
  final String location, time;
  const LocationRow({
    Key ?key,
    required this.icon,
    required this.location,
    required this.time,
    required this.color,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              border:  const Border(),
            ),
            alignment: Alignment.center,
            child: icon,
          ),
          const SizedBox(width: 5.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                location,

              ),
              const SizedBox(height: 2.0),
              Text(
                time,

              )
            ],
          )
        ],
      ),
    );
  }
}

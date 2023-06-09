import 'package:flutter/material.dart';
import 'package:travel_app_template/models/near_by_model.dart';
import 'package:travel_app_template/utils/colors_const.dart';
import 'package:travel_app_template/utils/common_functions.dart';
import 'package:travel_app_template/utils/datetime_utils.dart';

class NearbyEventCard extends StatelessWidget {
  final EventModel event;
  final VoidCallback onTap;
  const NearbyEventCard( {Key? key, required this.event,required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: <Widget>[
            buildImage(),
            buildEventInfo(context),
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: 80,
        height: 80,
        child: Hero(
          tag: event.image,
          child: Image.network(
            event.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildEventInfo(context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(DateTimeUtils.getFullDate(event.eventDate), style: TextStyle(color: ColorsConstants.amberColor, fontSize: 14, fontWeight: FontWeight.w500)),
          const SizedBox(height: 4,),
          Text(event.name, style: const TextStyle( fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 4,),
          Row(
            children: <Widget>[
              Icon(Icons.location_on, size: 16, color: ColorsConstants.amberColor),
              const SizedBox(width: 4,),
              Text(event.location.toUpperCase(), style: subtitleStyle),
            ],
          ),
        ],
      ),
    );
  }
}

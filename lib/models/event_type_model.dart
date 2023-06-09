

class EventTypeModel {
  String name;
  String image;
  String intro;

  EventTypeModel(  this.name,  this.image,this.intro);
}
List<EventTypeModel> eventTypeModelList = eventTypeDataList
    .map((item) => EventTypeModel( item['name'].toString(),item['image'].toString(),item['intro'].toString()
   ))
    .toList();

var eventTypeDataList = [
  {
    "name": "Concert",
    "image": "assets/icon/concert.png",
    "intro" : "Weekend adventure sports"

  },
  {
    "name": "Sports",
    "image": "assets/icon/sports.png",
    "intro" : "Relax on the beach",


  },
  {
    "name": "Education",
    "image": "assets/icon/education.png",
    "intro" : "Honeymoon destination",


  },
  {
    "name": "Fashion",
    "image": "assets/icon/fashion.png",
    "intro" : "Getaway for the weekend",

  },

];


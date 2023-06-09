class EventModel {
  String name;
  String description;
  DateTime eventDate;
  String image;
  String location;
  String organizer;
  int price;
  EventModel({ required this.eventDate, required this.image,required  this.location,required this.name,required this.organizer,required this.price,required this.description});
}
List<EventModel> nearByConcertModelList = nearByConcertEventDataList
    .map((item) => EventModel(name: item['name'].toString(),eventDate: item["eventDate"] as DateTime,description: item["description"].toString(),image: item["image"].toString(),location: item["location"].toString(),organizer: item["organizer"].toString(),price: item["price"] as int
)).toList();
List<EventModel> upComingEventModelList = upComingEventDataList
    .map((item) => EventModel(name: item['name'].toString(),eventDate: item["eventDate"] as DateTime,description: item["description"].toString(),image: item["image"].toString(),location: item["location"].toString(),organizer: item["organizer"].toString(),price: item["price"] as int
)).toList();



var upComingEventDataList = [
  {
    "name": "The Pretty Reckless",
    "eventDate": DateTime.now().add(const Duration(days: 24)),
    "image": "https://source.unsplash.com/800x600/?concert",
    "description": "The pretty reckless is an American rock band from New york city, Formed in 2009. The",
    "location": "Fairview Gospel Church",
    "organizer": "Westfield Centre",
    "price" : 30,
  },
  {
    "name": "Live Orchestra",
    "eventDate": DateTime.now().add(const Duration(days: 33)),
    "image": "https://source.unsplash.com/800x600/?band",
    "description": "The pretty reckless is an American rock band from New york city, Formed in 2009. The",
    "location": "David Geffen Hall",
    "organizer": "Westfield Centre",
    "price" : 30,
  },
  {
    "name": "Local Concert",
    "eventDate": DateTime.now().add(const Duration(days: 12)),
    "image": "https://source.unsplash.com/800x600/?music",
    "description": "The pretty reckless is an American rock band from New york city, Formed in 2009. The",
    "location": "The Cutting room",
    "organizer": "Westfield Centre",
    "price" : 30,
  },


];
var nearByConcertEventDataList = [
  {
    "name": "The Pretty Reckless",
    "eventDate": DateTime.now().add(const Duration(days: 1)),
    "image": 'https://source.unsplash.com/600x800/?concert',
    "description": "The pretty reckless is an American rock band from New york city, Formed in 2009. The",
    "location": "Fairview Gospel Church",
    "organizer": "Westfield Centre",
    "price": 30,
  },
  {
    "name": "New Thread Quartet",
    "eventDate": DateTime.now().add(const Duration(days: 4)),
    "image": 'https://source.unsplash.com/600x800/?live',
    "description": "The pretty reckless is an American rock band from New york city, Formed in 2009. The",
    "location": "David Geffen Hall",
    "organizer": "Westfield Centre",
    "price": 30,
  },
  {
    "name": "Songwriters in Concert",
    "eventDate": DateTime.now().add(const Duration(days: 2)),
    "image": 'https://source.unsplash.com/600x800/?orchestra',
    "description": "The pretty reckless is an American rock band from New york city, Formed in 2009. The",
    "location": "The Cutting room",
    "organizer": "Westfield Centre",
    "price": 30,
  },
  {
    "name": "Rock Concert",
    "eventDate": DateTime.now().add(const Duration(days: 21)),
    "image": 'https://source.unsplash.com/600x800/?music',
    "description": "The pretty reckless is an American rock band from New york city, Formed in 2009. The",
    "location": "The Cutting room",
    "organizer": "Westfield Centre",
    "price": 32,
  },
  {
    "name": "Songwriters in Concert",
    "eventDate": DateTime.now().add(const Duration(days: 16)),
    "image": 'https://source.unsplash.com/600x800/?rock_music',
    "description": "The pretty reckless is an American rock band from New york city, Formed in 2009. The",
    "location": "David Field",
    "organizer": "Westfield Centre",
    "price": 14,
  }
  ];





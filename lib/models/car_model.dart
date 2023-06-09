class CarModel {

  String brand;
  String model;
  int price;
  String condition;
  List<String> images;

  CarModel(this.brand, this.model, this.price, this.condition, this.images);

}

List<CarModel> carModelList = carDataList.map((item) => CarModel( item['brand'].toString(),item['model'].toString(),item['price'] as int,item['condition'] as String,item['images'] as List<String>
))
    .toList();


var carDataList = [
  {
    "brand": "Land Rover",
    "model": "Discovery",
    "price" : 2580,
    "condition" : "Weekly",
    "images":[
      "assets/images/land_rover_0.png",
      "assets/images/land_rover_1.png",
      "assets/images/land_rover_2.png",
    ]
  },
  {
    "brand": "Alfa Romeo",
    "model": "C4",
    "price" : 3580,
    "condition" : "Monthly",
    "images":[
      "assets/images/alfa_romeo_c4_0.png",
    ]
  },
  {
    "brand": "Nissan",
    "model": "GTR",
    "price" : 1100,
    "condition" : "Daily",
    "images":[
      "assets/images/nissan_gtr_0.png",
      "assets/images/nissan_gtr_1.png",
      "assets/images/nissan_gtr_2.png",
      "assets/images/nissan_gtr_3.png",
    ]
  },
  {
    "brand": "Acura",
    "model": "MDX 2020",
    "price" : 2200,
    "condition" : "Monthly",
    "images":[
      "assets/images/acura_0.png",
      "assets/images/acura_1.png",
      "assets/images/acura_2.png",
    ]
  },
  {
    "brand": "Chevrolet",
    "model": "Camaro",
    "price" : 3400,
    "condition" : "Weekly",
    "images":[
      "assets/images/camaro_0.png",
      "assets/images/camaro_1.png",
      "assets/images/camaro_2.png",
    ]
  },
  {
    "brand": "Ferrari",
    "model": "Spider 488",
    "price" : 4200,
    "condition" : "Weekly",
    "images":[
      "assets/images/ferrari_spider_488_0.png",
      "assets/images/ferrari_spider_488_1.png",
      "assets/images/ferrari_spider_488_2.png",
      "assets/images/ferrari_spider_488_3.png",
      "assets/images/ferrari_spider_488_4.png",
    ]
  },
  {
    "brand": "Ford",
    "model": "Focus",
    "price" : 2300,
    "condition" : "Weekly",
    "images":[
      "assets/images/ford_0.png",
      "assets/images/ford_1.png",
    ]
  },
  {
    "brand": "Fiat",
    "model": "500x",
    "price" : 1450,
    "condition" : "Weekly",
    "images":[
      "assets/images/fiat_0.png",
      "assets/images/fiat_1.png",
    ]
  },
  {
    "brand": "Honda",
    "model": "Civic",
    "price" : 900,
    "condition" : "Daily",
    "images":[
      "assets/images/honda_0.png",
    ]
  },
  {
    "brand": "Citroen",
    "model": "Picasso",
    "price" : 1200,
    "condition" : "Monthly",
    "images":[
      "assets/images/citroen_0.png",
      "assets/images/citroen_1.png",
      "assets/images/citroen_2.png",
    ]
  },
];



class CarDealer {
  String name;
  int offers;
  String image;


  CarDealer(this.name, this.offers, this.image);

}

List<CarDealer> getDealerList(){
  return <CarDealer>[
    CarDealer(
      "Hertz",
      174,
      "assets/images/hertz.png",
    ),
    CarDealer(
      "Avis",
      126,
      "assets/images/avis.png",
    ),
    CarDealer(
      "Tesla",
      89,
      "assets/images/tesla.jpg",
    ),
  ];
}

class Filter {

  String name;

  Filter(this.name);

}
List<Filter> getFilterList(){
  return <Filter>[
    Filter("Best Match"),
    Filter("High Price"),
    Filter("Low Price"),
  ];
}


class InterestModel {
  String name;
  String image;
  String intro;

  InterestModel(  this.name,  this.image,this.intro);
}
List<InterestModel> interestModelList = interestDataList
    .map((item) => InterestModel( item['name'].toString(),item['image'].toString(),item['intro'].toString()
   ))
    .toList();

var interestDataList = [
  {
    "name": "Adventure",
    "image": "https://images.unsplash.com/photo-1541542684-be0c46417a12?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=715&q=80",
    "intro" : "Weekend adventure sports"

  },
  {
    "name": "Beach",
    "image": "https://images.unsplash.com/photo-1519046904884-53103b34b206?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80",
    "intro" : "Relax on the beach",


  },
  {
    "name": "Honeymoon",
    "image": "https://images.unsplash.com/photo-1605101943206-05c8f4e64598?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80",
    "intro" : "Honeymoon destination",


  },
  {
    "name": "Weekend",
    "image": "https://images.unsplash.com/photo-1595198498092-5209c7e638a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80",
    "intro" : "Getway for the weekend",

  },
  {
    "name": "Trek",
    "image": "https://images.unsplash.com/photo-1533446083008-d30308b67b55?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1074&q=80",
    "intro" : "Trek this weekends"
  },
];


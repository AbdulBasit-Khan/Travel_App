class PopularModel {
  String name;
  String tagLine;
  String image;
  String location;
  List<String> images;
  String description;
  int price;
  double rating;

  PopularModel(  this.name,  this.tagLine,  this.image, this.location, this.images,
     this.description, this.price,this.rating);
}
List<PopularModel> popularModelList = popularDataList
    .map((item) => PopularModel( item['name'].toString(),item['tagLine'].toString(),
    item['image'].toString(),item['location'].toString(), item['images'] as List<String>, item['description'].toString(), item['price'] as int,item["rating"] as double))
    .toList();

var popularDataList = [
  {
    "name": "South Island",
    "tagLine": "Semarang Variety of Culture",
    "location":"Hayle, Cornwall",
    "image": "https://travel.usnews.com/dims4/USNEWS/a798492/2147483647/resize/445x280%5E%3E/crop/445x280/quality/85/?url=https://travel.usnews.com/images/edited_south_island_nz_getty_irma_ferreira_445x280_dxgXWlc.jpg",
    "rating":2.1,
    "images": [
      "https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80",
      "https://images.unsplash.com/photo-1577791465485-b80039b4d69a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80",
      "https://images.unsplash.com/photo-1577404699057-04440b45986f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=752&q=80",
      "https://images.unsplash.com/photo-1549973890-38d08b229439?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=642&q=80",
      "https://images.unsplash.com/photo-1622263096760-5c79f72884af?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80"
    ],
    "description":
    "Semarang City is the capital city of Central Java Province, Indonesia as well as the fifth largest metropolitan city in Indonesia",
    "price": 100
  },
  {
    "name": "Paris",
    "tagLine": "Raja Ampat The Hidden Place",
    "location":"Hayle, Cornwall",
    "rating":4.1,
    "image":
    "https://travel.usnews.com/dims4/USNEWS/c5a8f6d/2147483647/resize/445x280%5E%3E/crop/445x280/quality/85/?url=https://travel.usnews.com/images/gettyimages-532590277_2ZNe4ra.jpg",
    "images": [
      "https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
      "https://images.unsplash.com/photo-1570789210967-2cac24afeb00?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
      "https://images.unsplash.com/photo-1516690561799-46d8f74f9abf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
      "https://live.staticflickr.com/1449/23852180634_54f8aa0404_b.jpg",
      "https://cdn.pixabay.com/photo/2017/08/09/12/05/piaynemo-2614341_960_720.jpg"
    ],
    "description":
    "Raja Ampat is one of the favorite tourist destination, you can feel cultural tourism and history to explore exotic beaches in Raja Ampat",
    "price": 130
  },
  {
    "name": "Maui",
    "tagLine": "Bali The Beautiful Heaven",
    "location":"Hayle, Cornwall",
    "rating":4.1,
    "image": "https://travel.usnews.com/dims4/USNEWS/070489a/2147483647/resize/445x280%5E%3E/crop/445x280/quality/85/?url=https://travel.usnews.com/images/GettyImages-117211856_TeGITRy.jpg",
    "images": [
      "https://images.unsplash.com/photo-1539367628448-4bc5c9d171c8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80",
      "https://images.unsplash.com/photo-1542897644-e04428948020?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80",
      "https://images.unsplash.com/photo-1546845776-dcdf70fd09e3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
      "https://images.unsplash.com/photo-1517480448885-d5c53555ba8c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1034&q=80",
      "https://images.unsplash.com/photo-1524675053444-52c3ca294ad2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    ],
    "description":
    "Bali, the famed Island of the Gods, with its varied landscape of hills and mountains, rugged coastlines and sandy beaches, lush rice terraces and barren volcanic hillsides all providing a picturesque backdrop to its colourful, deeply spiritual and unique culture, stakes a serious claim to be paradise on earth.",
    "price": 120
  },
  {
    "name": "Tahiti",
    "tagLine": "Yogyakarta Istimewa",
    "location":"Hayle, Cornwall",
    "rating":5.0,
    "image":
    "https://travel.usnews.com/dims4/USNEWS/a600cb2/2147483647/resize/445x280%5E%3E/crop/445x280/quality/85/?url=https://travel.usnews.com/images/tahiti_main_getty_samantha_t_photography_edited_445x280_v43QKbF.jpg",
    "images": [
      "https://images.unsplash.com/photo-1584810359583-96fc3448beaa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
      "https://images.unsplash.com/photo-1551018612-9715965c6742?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1354&q=80",
      "https://images.unsplash.com/photo-1561100344-0cce8621ca6c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
      "https://images.unsplash.com/photo-1529680218503-29abd728bef5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=679&q=80",
      "https://images.unsplash.com/photo-1566559532512-004a6df74db5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1489&q=80"
    ],
    "description":
    "Yogyakarta is a bustling town of some half a million people and the most popular tourist destination on Java, largely thanks to its proximity to the temples of Borobudur and Prambanan.",
    "price": 110
  },
  {
    "name": "London",
    "tagLine": "The Amazing Thailand",
    "location":"Hayle, Cornwall",
    "rating":3.4,
    "image":
    "https://travel.usnews.com/dims4/USNEWS/0e6734a/2147483647/resize/445x280%5E%3E/crop/445x280/quality/85/?url=https://travel.usnews.com/images/482151882_HjS9rWb.jpg",
    "images": [
      "https://images.unsplash.com/photo-1528181304800-259b08848526?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
      "https://images.unsplash.com/photo-1519451241324-20b4ea2c4220?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
      "https://images.unsplash.com/photo-1552465011-b4e21bf6e79a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1323&q=80",
      "https://images.unsplash.com/photo-1552550018-5253c1b171e1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
      "https://images.unsplash.com/photo-1562602833-0f4ab2fc46e3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1952&q=80"
    ],
    "description":
    "Thailand is a Southeast Asian country. It's known for tropical beaches, opulent royal palaces, ancient ruins and ornate temples displaying figures of Buddha.",
    "price": 180
  },
  {
    "name": "Rome",
    "tagLine": "Singapore Tourism Board",
    "location":"Hayle, Cornwall",
    "rating":1.1,
    "image":
    "https://travel.usnews.com/dims4/USNEWS/981979e/2147483647/resize/445x280%5E%3E/crop/445x280/quality/85/?url=https://travel.usnews.com/images/main_image_cropped_rome_445x280_f0qQD4i.jpg",
    "images": [
      "https://images.unsplash.com/photo-1506351421178-63b52a2d2562?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2089&q=80",
      "https://images.unsplash.com/photo-1516496636080-14fb876e029d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
      "https://images.unsplash.com/photo-1525625293386-3f8f99389edd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1249&q=80",
      "https://images.unsplash.com/photo-1555912881-1ecd82307e0e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
      "https://images.unsplash.com/photo-1499359875449-10bbeb21501e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"
    ],
    "description":
    "Singapore is more than its tourist attractions. It’s constantly evolving, reinventing, and reimagining itself, with people who are passionate about creating new possibilities.",
    "price": 200
  },
];


class Amenities {
  String name;
  String image;

  Amenities({required this.name, required this.image});
}
List<Amenities> listOfAmenities = [
  Amenities(name: "WiFi", image: 'assets/icon/wifi.png'),
  Amenities(name: "Parking", image: 'assets/icon/parking.png'),
  Amenities(name: "50 Rooms", image: 'assets/icon/room.png'),
  Amenities(name: "Pets", image: 'assets/icon/dog.png'),
  Amenities(name: "Breakfast", image: 'assets/icon/breakfast.png'),
  Amenities(name: "Dining", image: 'assets/icon/dining.png'),
  Amenities(name: "Security", image: 'assets/icon/shield.png'),
];

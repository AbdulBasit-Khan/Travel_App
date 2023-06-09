class ActivityModel {
  int id;
  String price;
  String image;
  String intro;

  ActivityModel(this.id,  this.price,  this.image,this.intro);
}
List<ActivityModel> activityModelList = activityDataList
    .map((item) => ActivityModel(item['id']as int, item['price'].toString(),item['image'].toString(),item['intro'].toString()
   ))
    .toList();

var activityDataList = [
  {
    "id":1,
    "price": "399",
    "image": "https://images.thrillophilia.com/image/upload/s--ok_ET9C3--/c_fill,h_775,q_auto,w_1600/f_auto,fl_strip_profile/v1/images/photos/000/230/353/original/1587052572_banner-img-2.jpg.jpg?1587052572",
    "intro" : "Jakhu Ropeway,Shimla-Roundtrip Entry Ticket"

  },
  {
    "id":2,
    "price": "1,980",
    "image": "https://images-acme.mmtcdn.com/prod-acme-image/system/product_media/c/70656/media7UPSS5926M9CI.jpg?imwidth=274",
    "intro" : "Shimla to Kufri and Narkanda - Day Trip with Transfers Option",
  },
  {
    "id":3,
    "price": "2,310",
    "image": "https://images-acme.mmtcdn.com/prod-acme-image/system/product_media/c/65398/media8AHVLFCJUZYGR.jpg?imwidth=520&quality=70",
    "intro" : "Kufri & Naldhera from Shimla - Full Day Tour with Private Transfers Option",
  },
  {
    "id":4,
    "price": "1,980",
    "image": "https://images-acme.mmtcdn.com/prod-acme-image/system/product_media/c/67058/media53N2UXLZ4Q1TB.jpg?imwidth=520&quality=70",
    "intro" : "Kufri & Chail from Shimla - Full Day Tour with Private Transfers Option",

  },

];


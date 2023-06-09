class TrainTicketModel {

  int travelTime;
  String currentTime;
  int departTime;
  String  inTime;
  String outTime;
  String sourcePlace;
  String destinationPlacel;
  String ticketNumber;

  TrainTicketModel({
    required  this.travelTime,
    required   this.currentTime,
    required this.departTime,
    required this.inTime,
    required  this.outTime,
    required  this.sourcePlace,
    required  this.destinationPlacel,
    required this.ticketNumber});
}

List<TrainTicketModel> trainTicketModelList = trainTicketDataList.map((item) => TrainTicketModel(travelTime: item["travelTime"] as int,currentTime: item["currentTime"] as String,departTime: item["departTime"] as int,inTime: item["inTime"] as String ,outTime: item["outTime"] as String ,destinationPlacel: item["destinationPlace"] as String,sourcePlace:  item["sourcePlace"] as String, ticketNumber: item["ticketNumber"] as String ))
    .toList();


var trainTicketDataList = [
  {
    "travelTime": 15,
    "currentTime": "19:57",
    "departTime" : 30,
    "inTime" : "13:00",
    "outTime" : "15:00",
    "destinationPlace" : "Imperia Park",
    "sourcePlace" : "New Trikon Baug",
    "ticketNumber" : "70 DA",
  },
  {
    "travelTime": 21,
    "currentTime": "18:57",
    "departTime" : 43,
    "inTime" : "09:00",
    "outTime" : "09:21",
    "destinationPlace" : "Jaipur",
    "sourcePlace" : "Maharashtra",
    "ticketNumber" : "55 DA",
  },
  {
    "travelTime": 14,
    "currentTime": "12:57",
    "departTime" : 8,
    "inTime" : "08:00",
    "outTime" : "12:00",
    "destinationPlace" : "Mumbai Central",
    "sourcePlace" : "New Delhi",
    "ticketNumber" : "51 DA",
  },
  {
    "travelTime": 6,
    "currentTime": "13:53",
    "departTime" : 45,
    "inTime" : "02:00",
    "outTime" : "04:00",
    "destinationPlace" : "Vapi",
    "sourcePlace" : "Surat",
    "ticketNumber" : "31 DA",
  },
  {
    "travelTime": 17,
    "currentTime": "21:43",
    "departTime" : 41,
    "inTime" : "06:00",
    "outTime" : "06:45",
    "destinationPlace" : "New Delhi",
    "sourcePlace" : "Jaipur",
    "ticketNumber" : "80 DA",
  },
  {
    "travelTime": 29,
    "currentTime": "23:57",
    "departTime" : 35,
    "inTime" : "12:16",
    "outTime" : "15:08",
    "destinationPlace" : "Taj Mahel",
    "sourcePlace" : "Pune",
    "ticketNumber" : "50 DA",
  },
  {
    "travelTime":17,
    "currentTime": "16:37",
    "departTime" : 50,
    "inTime" : "14:11",
    "outTime" : "16:22",
    "destinationPlace" : "Rajasthan",
    "sourcePlace" : "Bombay",
    "ticketNumber" : "73 DA",
  },
  {
    "travelTime": 10,
    "currentTime": "12:57",
    "departTime" : 60,
    "inTime" : "13:00",
    "outTime" : "15:00",
    "destinationPlace" : "Ahmedabad",
    "sourcePlace" : "Surat",
    "ticketNumber" : "17 DA",
  },
  {
    "travelTime": 51,
    "currentTime": "21:57",
    "departTime" : 20,
    "inTime" : "16:00",
    "outTime" : "17:00",
    "destinationPlace" : "Khapoli",
    "sourcePlace" : "Lonavala",
    "ticketNumber" : "88 DA",
  },

];



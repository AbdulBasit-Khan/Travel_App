import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:travel_app_template/utils/common_functions.dart';

import '../utils/colors_const.dart';

class EventCalendarScreen extends StatefulWidget {
  const EventCalendarScreen({Key? key}) : super(key: key);

  @override
  State<EventCalendarScreen> createState() => _EventCalendarScreenState();
}

class _EventCalendarScreenState extends State<EventCalendarScreen> {
  CalendarFormat _calendarFormat=CalendarFormat.month;
  DateTime _focusedDay=DateTime.now();
  DateTime? _selectedDate;
  final titleController=TextEditingController();
  final descpController=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDate=_focusedDay;
  }
  _showAddEventDialog()async{
await showDialog(context: context, builder:(context) => AlertDialog(
  title: Text('Add New Event',textAlign: TextAlign.center,),
  content: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisSize: MainAxisSize.min,
    children: [
    TextField(controller: titleController,
    textCapitalization: TextCapitalization.words,
    decoration:InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10)
      ),
       
      labelText:'Title'
    )
    ),
    SizedBox(height:10),
     TextField(controller: descpController,
    textCapitalization: TextCapitalization.words,
    decoration:InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10)
      ),
       
      labelText:'Description'
    )
    )
  ],),
  actions: [
    TextButton(onPressed: ()=>Navigator.pop(context),
    child: Text('Cancel'),
    ),
    TextButton(
    child: Text('Add Event'),
    onPressed:() {
      if(titleController.text.isEmpty && descpController.text.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: ColorsConstants.amberColor,
            content: Text('Required title and description'),
          duration: Duration(seconds: 2),
          )
        );
        return;
      }
      else{}
      
    },
    )
  ],
  
));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Event Calendar',style:themeTitleStyle),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        TableCalendar(focusedDay: _focusedDay
        , firstDay: DateTime(2023), lastDay: DateTime(2024),
        onDaySelected: ((selectedDay, focusedDay) {
          if(!isSameDay(_selectedDate,selectedDay)){
          setState(() {
            _selectedDate=selectedDay;
            _focusedDay=focusedDay;
          });}
        }),
        calendarFormat:_calendarFormat,
        
        selectedDayPredicate: (day){
          return isSameDay(_selectedDate, day);
        },
        onFormatChanged: (format) {
  setState(() {
    _calendarFormat = format;
  });
},
onPageChanged: (focusedDay) {
  _focusedDay = focusedDay;
},
        )
      ]),
      floatingActionButton: FloatingActionButton.extended(onPressed: () =>_showAddEventDialog(), label:Text('Add Event'),backgroundColor: ColorsConstants.amberColor,),
    );
  }
}
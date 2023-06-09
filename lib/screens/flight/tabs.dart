import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_template/provider/app_state.dart';

import 'category_widget.dart';
import 'flight_type.dart';

class MyTabs extends StatefulWidget {
  const MyTabs({Key? key}) : super(key: key);

  @override
  _MyTabsState createState() => _MyTabsState();
}

class _MyTabsState extends State<MyTabs> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      create: (_) => AppState(),
      child: Padding(
        padding: const EdgeInsets.only(top: 20,bottom: 0,left: 0,right: 0),
        child: Consumer<AppState>(
          builder: (context, appState, _) => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              height: 45.0,
              width: MediaQuery.of(context).size.width - 42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0),
                border: Border.all(
                  color: Colors.white.withOpacity(0.4),
                ),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    for (final category in categories)
                      CategoryWidget(
                        category: category,
                      )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

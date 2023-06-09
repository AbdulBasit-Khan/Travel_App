import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_template/utils/common_functions.dart';
import 'package:travel_app_template/utils/strings.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  _PrivacyPolicyScreenState createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        title:  Text(Strings.privacyPolicy,style: themeTitleStyle,),
      ),
      body: Column(

        children:[
          Divider(color: Colors.grey.shade300,),
          const Expanded(
            child: WebView(
            initialUrl: 'https://www.google.com/',
            javascriptMode: JavascriptMode.unrestricted,
        ),
          ),
      ]
      ),

    );
  }
}

import 'package:analytics_crashlytics/analytics_service.dart';
import 'package:analytics_crashlytics/third_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key,required this.observer,required this.analytics}) : super(key: key);

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  Future<void> _currentScreen() async {
    await widget.analytics.setCurrentScreen(
        screenName: 'Screen 2',screenClassOverride: "Screen2");
  }

  @override
  void initState() {
    _currentScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text("Screen 2"),
      ),
      body: Center(
        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            ElevatedButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: const Text("Back")),


            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ThirdScreen(analytics: widget.analytics,observer: widget.observer,),
                  settings: const RouteSettings(name: "Screen 3")));
            }, child: const Text("Goto Screen 3")),


          ],
        ),
      ),

    );
  }
}

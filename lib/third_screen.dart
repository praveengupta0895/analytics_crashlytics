
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key,required this.observer,required this.analytics}) : super(key: key);
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}



class _ThirdScreenState extends State<ThirdScreen> {

  Future<void> _currentScreen() async {
    await widget.analytics.setCurrentScreen(
        screenName: 'Screen 3',screenClassOverride: "Screen3");
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

        title:const Text("Screen 3"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: <Widget>[
            ElevatedButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: const Text("Back")),
            ElevatedButton(onPressed: (){
              FirebaseCrashlytics.instance.crash();
            }, child: const Text("Crash"))
          ],
        ),
      ),

    );
  }
}

import 'package:analytics_crashlytics/second_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  static FirebaseAnalytics _analytics = new FirebaseAnalytics();
  static FirebaseAnalyticsObserver _observer = new FirebaseAnalyticsObserver(analytics: _analytics);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Analytics and Crashlytics',
      navigatorObservers: <NavigatorObserver>[
          _observer
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: MyHomePage(title: 'Screen 1',analytics: _analytics,observer: _observer,),
    );
  }
}

class MyHomePage extends StatefulWidget {


  const MyHomePage({Key? key, required this.title,required this.observer,required this.analytics}) : super(key: key);


  final String title;
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<void> _currentScreen() async {
    await widget.analytics.setCurrentScreen(
        screenName: 'Screen 1',screenClassOverride: "Screen1");
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

        title: Text(widget.title),
      ),
      body: Center(
        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondScreen(analytics: widget.analytics,observer: widget.observer,),
              settings: const RouteSettings(name: "Screen 2")));
            }, child: const Text("Goto Screen 2"))
          ],
        ),
      ),

    );
  }
}

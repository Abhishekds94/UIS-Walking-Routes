import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:uis_walking_routes/states/app_state.dart';
import 'package:uis_walking_routes/timer_service.dart';
import 'package:uis_walking_routes/home_page.dart';
import 'states/location_data_app_state.dart';


const kGoogleApiKey = "AIzaSyDG8BCumNkWfZEUpuOIFfY1JMUPWtys4k8";
void main(){
  WidgetsFlutterBinding.ensureInitialized();
final timerService = TimerService();
 /* runApp(
    TimerServiceProvider( // provide timer service to all widgets of your app
      service: timerService,
      child: MyApp(),
    ),
  );*/
   return runApp(MultiProvider(providers: [
      ChangeNotifierProvider<AppState>.value(value: AppState(),),
     ChangeNotifierProvider<TimerService>.value(value: timerService,),
     ChangeNotifierProvider<AppLocationState>.value(value: AppLocationState())
  ],
  child: MyApp(),));


}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UIS Walking Routes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
    
  }
}

/*class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

@override
  void initState() {
    //Init 3 seconds Delay for Splash
    super.initState();
    Future.delayed(Duration(seconds: 3),
        (){
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => HomePage(),
          ),
          );
        },
      ); 
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/uislogo.png'),
          ],
        ),
      ),
    );
  }
}*/
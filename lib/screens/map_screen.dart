import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:uis_walking_routes/states/app_state.dart';
import 'package:uis_walking_routes/states/location_data_app_state.dart';
import 'package:uis_walking_routes/timer_service.dart';
import 'package:uis_walking_routes/Map/utiles/utiles.dart';

class MapScreen extends StatefulWidget {
  MapScreen({Key key, this.title, this.position,this.latLongList}) : super(key: key);
  final String title;
  final int position;
  final List<LatLng> latLongList;

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<MapScreen> {
  LatLngBounds bound;
  String timerText = "Start Timer";
  bool running = false;
  bool showp = false;
  Stopwatch stopwatch = new Stopwatch();

//  static var caloriesBurnt;

  double _weight = 0.0;
  double totalDistance = 0;

  void leftButtonPressed() {
    setState(() {
      if (stopwatch.isRunning) {
        print("${stopwatch.elapsedMilliseconds}");
      } else {
        stopwatch.reset();
      }
    });
  }
  void rightButtonPressed() {
    setState(() {
      if (stopwatch.isRunning) {
        stopwatch.stop();
      } else {
        stopwatch.start();
      }
    });
  }
  ///           Add Email addresses
  ///
  static var emailData;
  static var receiverEmail = "avidprogrammers@gmail.com";

  void _showDialog() {
    // flutter defined function
    double textSize = 17;
    Color color = Colors.black;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
         elevation: 5, 
          title: Card(child: Center(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                "Walking Routes Detail", style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w500)),
          )),),
          backgroundColor: Colors.grey[200],
          content: Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width ,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Travel time",
                              style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontSize: textSize,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                          Text(
                            "$travellingTime",
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: textSize,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Distance: ",
                              style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontSize: textSize,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                          Container(
                            child: Text(getTotalMiles().toString() + " m",
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontSize: textSize,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Calories Burnt",
                              style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontSize: textSize,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                          Text(caloriesBurnFormula()??"",
                              style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontSize: textSize,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ),
                ],
              )
              
              ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("Close"),
                ),elevation: 5,
              ),
              onPressed: () {
                AppState.totalDistance = 0;
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  String caloriesBurnFormula() {
    print("start caloriesBurnFormula");
    String burn = "0.0";
    var doubleRE = RegExp(r"-?(?:\d*\.)?\d+(?:[eE][+-]?\d+)?");
    if (int.parse(minutes) > 0 || int.parse(sec) > 0){
      timeInSec = int.parse(minutes) * 60 + timeInSec;
      var d1 = 0.000277778 * timeInSec * totalDistance;
      burn = d1.toString().substring(0, 4);
    }else {
      burn = "0.0";
    }

    return burn;
  }

  double getTotalMiles(){
    if(totalDistance > 0){
      return ((totalDistance/1609*100).ceil())/100;
    }else{
      return totalDistance.toDouble();
    }
  }

  Widget buildFloatingButton(String text, VoidCallback callback) {
    TextStyle roundTextStyle =
        const TextStyle(fontSize: 16.0, color: Colors.white);
    return new FloatingActionButton(
        child: new Text(text, style: roundTextStyle), onPressed: callback);
  }

  _showPrpgree(){
    showDialog(context: context,
    builder: (context){
      return AlertDialog(
        content: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width*.4,
          height: MediaQuery.of(context).size.height*.5,
          child: Center(
            child: Text(
             "Processing",
            ),
          ),
        ),
      );
    }
    );
  }

  _showDialogWight(){
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Enter your Weight Should be grater than zero"),
            content: Container(
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Weight",
                  hintText:'your weight',
                  labelStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.green),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancel", style: TextStyle(color: Colors.red),),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("OK", style: TextStyle(color: Colors.green),),
                onPressed:(){
                  Navigator.pop(context);
                },
              ),

            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
          );
        }
    );
  }

  static AppState appState;
  static TimerService timerService;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
    print("Dispose called");
    TimerService().disposeEveryThing();
    AppState().disposeEverything();
  }
  int timeInSec = 0;
  static var travellingTime;
  String hours, minutes, sec;
  @override
  Widget build(BuildContext context) {
    appState = Provider.of<AppState>(context);
    timerService = Provider.of<TimerService>(context);
    Future.delayed(const Duration(seconds: 1), () {
      appState.sendRequest(widget.latLongList,widget.position);
    });
    return
      appState.initialPosition == null
        ? Container(
            alignment: Alignment.center,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        :
      Scaffold(
            appBar: AppBar(
              title: Text("UIS Walking Routes"),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  size: MediaQuery.of(context).size.height / 30,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Utiles.appColors[widget.position],
              elevation: 0.0,
              automaticallyImplyLeading: false,
            ),
            body: Stack(
              children: <Widget>[
                GoogleMap(
                  initialCameraPosition:
                      CameraPosition(target: widget.latLongList[0], zoom: 18.0),
                  onMapCreated: appState.onCreated,
                  myLocationEnabled: true,
                  mapType: MapType.satellite,
                  compassEnabled: true,
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 1.3,
                  ),
                  markers: appState.markers,
                  onCameraMove: appState.onCameraMove,
                  polylines: appState.polyLines,
                ),

                Positioned(
                  width: MediaQuery.of(context).size.width,
                  bottom: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 40,
                          child: RaisedButton(
                            onPressed: showp ? null : () {
                                if (!timerService.isRunning) {
                                  timerService.start();
                                  appState.myLocationPolyLines(widget.position);
                                } else {
                                  setState(() {
                                    showp = true;
                                  });
                                  travellingTime = timerService.currentDuration
                                      .toString()
                                      .substring(0, 7);
                                  timeInSec =
                                      timerService.currentDuration.inSeconds;
                                  hours = timerService.currentDuration.inHours
                                      .toString();
                                  minutes = timerService.currentDuration.inMinutes
                                      .toString();
                                  sec = timerService.currentDuration.inSeconds
                                      .toString();
                                  appState.distanceFindder().then((distance) {
                                    appState.clearPolylines();
                                    print("total ditsance--44");
                                    print(distance.toString());
                                    setState(() {
                                      showp = false;
                                      totalDistance = distance;
//                                    caloriesBurnt = caloriesBurnFormula();
                                    });
                                    _showDialog();
                                  });
                                  timerService.reset();
                                }
                            },
                            child: Text(
                              !timerService.isRunning ? 'Start' : 'Stop',
                            ),
                          )),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        color: Colors.indigo,
                        alignment: Alignment.center,
                        height: 40,
                        child: Text(
                          '0${timerService.currentDuration.toString().substring(0, 7)}',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),

                !showp ? Container() :
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          color: Colors.white,
                          width: MediaQuery.of(context).size.longestSide/10,
                          height: MediaQuery.of(context).size.longestSide/10,
                          child: Center(
                            child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black),),
                          ),
                        ),
                      ),
                    ),
              ],
            ),
          );
  }
}

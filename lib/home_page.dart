import 'dart:convert';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:uis_walking_routes/post.dart';
import 'package:uis_walking_routes/screens/feedback.dart';
import 'package:uis_walking_routes/screens/map_screen.dart';

import 'package:http/http.dart' as http;
import 'package:uis_walking_routes/states/location_data_app_state.dart';

import 'Map/utiles/utiles.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Walking Routes',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var cardIndex = 0;
  ScrollController scrollController;
  var currentColor = Color.fromRGBO(0, 51, 102, 1.0);
  AnimationController animationController;
  ColorTween colorTween;
  CurvedAnimation curvedAnimation;
  Map<String, String> weatherMap = Map();
  Location _location = Location();
  @override
  void initState() {
    Utiles.addingListLatLong();
    scrollController = new ScrollController();
    scrollController.addListener(_scrollListener);
    super.initState();
//    _location.onLocationChanged().listen((locationData)async{
//      print("latlng");
//      print(locationData.latitude);
//      Future.delayed(Duration(seconds:10),(){
//        internetCheck(locationData.longitude.toString(),locationData.longitude.toString());
//      });
//    });
  }

  @override
  void dispose() {
    super.dispose();
    final data = Provider.of<AppLocationState>(context);
    data.stopGettingLocation();
  }

  Post weatherData;
  int index = 0;
  _scrollListener() {
    print(index);
    setState(() {
      currentColor = Utiles.array[index];
    });
  }

  Future<void> _neverSatisfied() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Internet issue'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Please connect to internet and try again!'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('close'),
              onPressed: () {
                Navigator.of(context).pop();
                exit(0);
              },
            ),
          ],
        );
      },
    );
  }

  void internetCheck(lat,lng) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      _neverSatisfied();
    } else {
      fetchPost(lat,lng).then((onValue) {
        setState(() {
          weatherData = onValue;
        });
      });
    }
  }

  Future<Post> fetchPost(lat,lng) async {
//    Position position = await Geolocator()
//        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    //  var location = new Location();
//var myLocation =await location.getLocation();
//myLat=myLocation.latitude.toString();
//myLong=myLocation.longitude.toString();
    myLat = "39.7301376";
    myLong = "-89.6185269";
    final response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=' +
            myLat.toString() +
            '&lon=' +
            myLong.toString() +
            '&appid=d68009c618c378e814f463913a2d8efd');
//'&appid=55517c3ae2db47c6872ca1fc451e016a');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      return Post.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  String myLat, myLong;
  Future _moveToNextScreen(BuildContext context, int pos) async {
    var location = new Geolocator();
    // Platform messages may fail, so we use a try/catch PlatformException.
    Future<bool> isGpsEnabled = location.isLocationServiceEnabled();

    if (await isGpsEnabled) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        print("positioned");
        print(pos);
        if (pos == 11)
          return FeedBack(
            title: 'Submit your Feedback',
          );
        else
          return MapScreen(
            title: 'Walking Routes',
            position: pos,
            latLongList: Utiles.all_points_List[pos],
          );
      }));
    } else {
      Fluttertoast.showToast(
          msg: "Please, turn on your GPS",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }



  @override
  Widget build(BuildContext context) {
    final data = Provider.of<AppLocationState>(context);
    String weatherApi() {
      weatherMap.clear();
//      String type = "" + weatherData.weather[0]['main'];
      String type = "" + data.dataWhether.weather[0]['main'];
      weatherMap['type'] = type;
      double farhenhiet =
          (double.parse(data.dataWhether.main['temp'].toString()) - 273.15) * 1.8000 +
              32.00;
      weatherMap['temp'] = farhenhiet.toStringAsFixed(2);
      return  weatherMap['type'].toString();
    }
    Widget weatherIconWidget() {
      return data.dataWhether != null
          ? Image.network(
        'http://openweathermap.org/img/wn/' +
            data.dataWhether.weather[0]['icon'] +
            '@2x.png',
      )
          : Icon(
        Icons.account_circle,
        size: MediaQuery.of(context).size.height / 20,
        color: Colors.white,
      );
    }
    var mediaQuery = MediaQuery;

    return OfflineBuilder(
      debounceDuration: Duration.zero,
      connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
          ) {
        if (connectivity == ConnectivityResult.none) {
          _location?.onLocationChanged()?.listen((_){})?.cancel();
          return Scaffold(
            body: Center(child: Text('Please check your internet connection!')),
          );
        }
        data.getLocation();
        return child;
      },
      child: Scaffold(
        backgroundColor: currentColor,
        appBar: new AppBar(
          leading: new Container(),
          title: new Text(
            "UIS WALKING ROUTES",
            style: TextStyle(fontSize: 20.0),
          ),
          backgroundColor: currentColor,
          centerTitle: true,
          elevation: 0.0,
          automaticallyImplyLeading: false,
        ),
        body: new Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 64.0,
                      vertical: MediaQuery.of(context).size.height / 30),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: MediaQuery.of(context).size.height / 45),
                          child: weatherIconWidget(),
//                        child: data.dataWhether != null ? Image.network(
//                          'http://openweathermap.org/img/wn/' +
//                              data.dataWhether.weather[0]['icon'] +
//                              '@2x.png',
//                        )
//                            : Icon(
//                          Icons.account_circle,
//                          size: MediaQuery.of(context).size.height / 20,
//                          color: Colors.white,
//                        ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              0.0,
                              MediaQuery.of(context).size.height / 50,
                              0.0,
                              MediaQuery.of(context).size.height / 50),
                          child: Text(
                            data.dataWhether != null ? weatherApi() : "Good day,",
                            style: TextStyle(
                                fontSize: data.dataWhether != null ? 20.0 : 30.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Text(
                          data.dataWhether != null
                              ? weatherMap['temp']+"°F "
                              : "Looks like feel good.",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "\nSelect the route you would like to use.",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.height / 20,
                        vertical: MediaQuery.of(context).size.height / 40),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2.4,
                    child: ListView.builder(
                      itemCount: 12,
                      controller: scrollController,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, position) {
                        index = position;
                        return GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: <Widget>[
                                Center(
                                    child: Card(
                               //   borderRadius: new BorderRadius.circular(8.0),

                                  child: Image.asset(
                                    'images/' + Utiles.imagesBg[index],
                                    height: 500.0,
                                    width: 250.0,
                                    fit: BoxFit.cover,
                                  ),
                                )),
                                Card(
                                  color: Colors.transparent,
                                  child: Container(
                                    width: 250.0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0,
                                                        vertical: 4.0),
                                                child: Text(
                                                  "${Utiles.cardsList[position].cardTitle}",
                                                  style:
                                                      TextStyle(fontSize: 26.0),
                                                ),
                                              ),
                                              // Padding(
                                              //   padding:
                                              //       const EdgeInsets.all(8.0),
                                              //   child: LinearProgressIndicator(
                                              //       value: 100),
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // shape: RoundedRectangleBorder(
                                  //     borderRadius: BorderRadius.circular(0.0)),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            _moveToNextScreen(context, position);
                          },
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

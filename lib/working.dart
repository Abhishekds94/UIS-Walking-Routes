import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uis_walking_routes/CardItemModel.dart';
import 'package:uis_walking_routes/post.dart';
import 'package:uis_walking_routes/screens/map_screen.dart';

import 'package:http/http.dart' as http;

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
  static List<LatLng> latlngStartingPoints = List();

  static List<LatLng> point_I_List = List();
  static List<List<LatLng>> all_points_List = List();

  var appColors = [
    Color.fromRGBO(56, 142, 60, 1), //Green
    Color.fromRGBO(189, 189, 189, 1), //Grey
    Color.fromRGBO(121, 85, 72, 1), //Brown
    Color.fromRGBO(96, 125, 139, 1), //Blue Grey
    Color.fromRGBO(142, 36, 170, 1), //Purple
    Color.fromRGBO(48, 63, 159, 1), //Blue
    Color.fromRGBO(255, 249, 196, 1), //Yellow
    Color.fromRGBO(239, 154, 154, 1), //Red
    Color.fromRGBO(159, 168, 218, 1), //Indigo
    Color.fromRGBO(255, 171, 145, 1), //Orange
    Color.fromRGBO(77, 182, 172, 1), //Teal
  ];
  var cardIndex = 0;
  ScrollController scrollController;
  var currentColor = Color.fromRGBO(56, 142, 60, 1);

  var cardsList = [
    CardItemModel("0.25 Mile loop", Icons.account_circle, 9, 0.83),
    CardItemModel("0.5 Mile loop", Icons.work, 12, 0.24),
    CardItemModel("0.8 Mile loop", Icons.home, 7, 0.32),
    CardItemModel("1 Mile loop", Icons.work, 12, 0.24),
    CardItemModel("1 Mile loop (2)", Icons.work, 12, 0.24),
    CardItemModel("1.5 Mile loop", Icons.work, 12, 0.24),
    CardItemModel("1.5 Mile loop (2)", Icons.work, 12, 0.24),
    CardItemModel("2 Mile loop", Icons.home, 7, 0.32),
    CardItemModel("2.3 Mile loop", Icons.work, 12, 0.24),
    CardItemModel("3.1 Mile loop (5k)", Icons.work, 12, 0.24),
    CardItemModel("6.2 Mile loop (10k)", Icons.work, 12, 0.24)
  ];

  AnimationController animationController;
  ColorTween colorTween;
  CurvedAnimation curvedAnimation;
  List<String> imagesBg=["bg.jpeg","bg.jpeg","bg.jpeg","bg.jpeg","bg.jpeg","bg.jpeg","bg.jpeg","bg.jpeg","bg.jpeg","bg.jpeg","bg.jpeg","bg.jpeg"];
  List<Color> array = [
   Color.fromRGBO(56, 142, 60, 1), //Green
    Color.fromRGBO(189, 189, 189, 1), //Grey
    Color.fromRGBO(121, 85, 72, 1), //Brown
    Color.fromRGBO(96, 125, 139, 1), //Blue Grey
    Color.fromRGBO(142, 36, 170, 1), //Purple
    Color.fromRGBO(48, 63, 159, 1), //Blue
    Color.fromRGBO(255, 249, 196, 1), //Yellow
    Color.fromRGBO(239, 154, 154, 1), //Red
    Color.fromRGBO(159, 168, 218, 1), //Indigo
    Color.fromRGBO(255, 171, 145, 1), //Orange
    Color.fromRGBO(77, 182, 172, 1), //Teal

  ];
  @override
  void initState() {
    scrollController = new ScrollController();
    scrollController.addListener(_scrollListener);
    super.initState();
  
  }
int index=0;
  
  _scrollListener() {
    print("first called");
  print(index);
  setState(() {
   currentColor=array[index]; 
  });
 

    /***************************** */
   /* setState(() {
      currentColor=array[0];
      scrollController.animateTo((cardIndex) * 256.0,
          duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
    });*/
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery;

    return SafeArea(
      top: false,
      right: false,
      left: false,
      child: new Scaffold(
        backgroundColor: currentColor,
        appBar: new AppBar(
          leading: new Container(),
          title: new Text(
            "WALKING ROUTES",
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
                        Text(
                          "Select the route that you would like to use today.",
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
                      itemCount: 11,
                      controller: scrollController,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, position) {
                            index=position;
                        return Stack(
                          children: <Widget>[
                           Center(
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(8.0),
                                child: Image.asset(
                                     'images/'+imagesBg[index],
                                    height: 300.0,
                                    width: 250.0,
                                    fit: BoxFit.cover,
                                ),
                              )
                          ),
                           Card(
                            color: Colors.transparent,
                              child: Container(
                                width: 250.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0, vertical: 4.0),
                                            child: Text(
                                              "${cardsList[position].cardTitle}",
                                              style: TextStyle(fontSize: 28.0),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:
                                                LinearProgressIndicator(value: 100),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            )
                          ],
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

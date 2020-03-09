import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:uis_walking_routes/Map/utiles/network.dart';
import 'package:uis_walking_routes/requests/google_maps_requests.dart';
import 'package:uis_walking_routes/Map/utiles/utiles.dart';

import '../main.dart';
import 'dart:math' show cos, sqrt, asin;


class Pointposition {
  double latitude;
  double longitude;

  Pointposition({
    this.latitude,
    this.longitude,
  });

  factory Pointposition.fromJson(Map<String, dynamic> json) => Pointposition(
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}

class AppState with ChangeNotifier {

  static LatLng _initialPosition;
  LatLng _lastPosition = _initialPosition;
   Set<Marker> _markers = {};
   Set<Polyline> _polyLines = {};
  GoogleMapController _mapController;
//  GoogleMapsServices _googleMapsServices = GoogleMapsServices();
  TextEditingController locationController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  LatLng get initialPosition => _initialPosition;
  LatLng get lastPosition => _lastPosition;
//  GoogleMapsServices get googleMapsServices => _googleMapsServices;
  GoogleMapController get mapController => _mapController;
  Set<Marker> get markers => _markers;
  Set<Polyline> get polyLines => _polyLines;
  List<Pointposition> point_list=[];

  AppState() {
    _getUserLocation();
  }
  List<LatLng> latlongArray = List();
//! get distance between points.
  double calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p)/2 +
        c(lat1 * p) * c(lat2 * p) *
            (1 - c((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));
  }

// ! TO GET THE USERS LOCATION
  void _getUserLocation() async {

    Location _location = Location();
    _location.getLocation().then((position)async{
      _initialPosition = LatLng(position.latitude, position.longitude);
      notifyListeners();
    });
  }

  List<PatternItem> patterns = <PatternItem>[
    PatternItem.gap(5.0),
    PatternItem.dot,
  ];
  List<PatternItem> patterns2 = <PatternItem>[
    PatternItem.gap(3.0),
    PatternItem.dash(4),
  ];
  static LatLng point_1_start = LatLng(40.603087, -74.091924);
  List<LatLng> sdf = [];
  // ! TO CREATE ROUTE
  void createRoute(List<LatLng> list,int pos) {
    if (_polyLines != null)
      //   _polyLines.clear();
      _polyLines.add(Polyline(
          patterns: patterns,
          polylineId: PolylineId(list[0].toString()),
          width: 10,

          //  points: _convertToLatLng(_decodePoly(encondedPoly)),
          points: list,
          color: Utiles.appColors[pos]));
    notifyListeners();
  }

  void myLocationPolyLines(int position)async{
    Location _location = Location();
    bool enabled = await _location.serviceEnabled();
    if(enabled){
      _location.onLocationChanged().listen((locationData)async{
        var pointaa={"latitude":locationData.latitude,"longitude":locationData.longitude};
        Pointposition eachpoint;
        eachpoint=Pointposition.fromJson(pointaa);
        LatLng latlong = LatLng(locationData.latitude, locationData.longitude);
        latlongArray.add(latlong);
        if (_polyLines != null)
          _polyLines.add(Polyline(
              patterns: patterns2,
              polylineId: PolylineId(latlongArray[0].toString()),
              width: 4,
              //  points: _convertToLatLng(_decodePoly(encondedPoly)),
              points: latlongArray,
              color: Utiles.appColors[position]));
        notifyListeners();
      });

    }else{
      await _location.requestService();
    }
//    var geolocator = Geolocator();
//    var locationOptions =
//        LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
//    StreamSubscription<Position> positionStream = geolocator
//        .getPositionStream(locationOptions)
//        .listen((Position position) {
//      print(position == null
//          ? 'Unknown'
//          : position.latitude.toString() +
//              ',>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ' +
//              position.longitude.toString());
//      latlongArray.clear();
//      LatLng latlong = LatLng(position.latitude, position.longitude);
//      latlongArray.add(latlong);
//      if (_polyLines != null)
//        _polyLines.add(Polyline(
//            patterns: patterns2,
//            polylineId: PolylineId(latlongArray[0].toString()),
//            width: 4,
//            //  points: _convertToLatLng(_decodePoly(encondedPoly)),
//            points: latlongArray,
//            color: Colors.red));
//      notifyListeners();
//    });
  }
  NetworkUtil network = new NetworkUtil();

  static double totalDistance = 0;
  Future<double> distanceFindder() async {
    if (latlongArray.length > 1) {
      try{
        await network
            .get("origin=" +
            latlongArray[0].latitude.toString() +
            "," +
            latlongArray[0].longitude.toString() +
            "&destination=" +
            latlongArray[latlongArray.length -1].latitude.toString() +
            "," +
            latlongArray[latlongArray.length - 1].longitude.toString() +
            "&mode=walking&key=$kGoogleApiKey")
            .then((dynamic res){
          print("this is distance");
          print(res["distance"]);
          totalDistance = res["distance"];
        });
//        double distanceInMeters = await Geolocator().distanceBetween(
//            latlongArray[i].latitude,
//            latlongArray[i].longitude,
//            latlongArray[i + 1].latitude,
//            latlongArray[i + 1].longitude
//        );
//        totalDistance = totalDistance + distanceInMeters;

      }catch(e){
        print(e);
        totalDistance=0;
//        if (point_list.length>1)
//        {
//          for(int ii=0;ii<point_list.length-1;ii++)
//          {
//            totalDistance += calculateDistance(point_list[ii].latitude, point_list[ii].longitude, point_list[ii+1].latitude, point_list[ii+1].longitude);
//          }
//        }
//        totalDistance=((totalDistance*100).ceil())/100;
//
//        print(["totaldistance---11:",totalDistance]);
        if (latlongArray.length>1)
        {
          for(int ii=0;ii<latlongArray.length-1;ii++)
          {
            totalDistance += calculateDistance(latlongArray[ii].latitude, latlongArray[ii].longitude, latlongArray[ii+1].latitude, latlongArray[ii+1].longitude);
          }
        }
        totalDistance=((totalDistance*1000).ceil()).toDouble();

      }
    }
    return totalDistance;
  }

  void clearPolylines() {
    Location _location = Location();
    _location.onLocationChanged().listen((_){}).cancel();
    _polyLines.clear();
    latlongArray.clear();
    notifyListeners();
  }

  // ! ADD A MARKER ON THE MAO
  void _addMarker(LatLng location, String address, int index) {
    _markers.add(Marker(
        markerId: MarkerId(_lastPosition.toString()),
        position: location,
        infoWindow: InfoWindow(title: address, snippet: "go here"),
        icon: index == 0
            ? BitmapDescriptor.defaultMarker
            : BitmapDescriptor.defaultMarkerWithHue(95)));
    notifyListeners();
  }

  // ! CREATE LAGLNG LIST
  List<LatLng> _convertToLatLng(List points) {
    List<LatLng> result = <LatLng>[];
    for (int i = 0; i < points.length; i++) {
      if (i % 2 != 0) {
        result.add(LatLng(points[i - 1], points[i]));
      }
    }
    return result;
  }

  // !DECODE POLY
  List _decodePoly(String poly) {
    var list = poly.codeUnits;
    var lList = new List();
    int index = 0;
    int len = poly.length;
    int c = 0;
// repeating until all attributes are decoded
    do {
      var shift = 0;
      int result = 0;

      // for decoding value of one attribute
      do {
        c = list[index] - 63;
        result |= (c & 0x1F) << (shift * 5);
        index++;
        shift++;
      } while (c >= 32);
      /* if value is negetive then bitwise not the value */
      if (result & 1 == 1) {
        result = ~result;
      }
      var result1 = (result >> 1) * 0.00001;
      lList.add(result1);
    } while (index < len);

/*adding to previous value as done in encoding */
    for (var i = 2; i < lList.length; i++) lList[i] += lList[i - 2];

    print(lList.toString());

    return lList;
  }

  // ! SEND REQUEST
  void sendRequest(List<LatLng> list,int pos) async {
    /*List<Placemark> placemark =
        await Geolocator().placemarkFromAddress(intendedLocation);*/
    /* double latitude = placemark[0].position.latitude;
    double longitude = placemark[0].position.longitude;
    LatLng destination = LatLng(latitude, longitude);*/
    if (_markers != null) _markers.clear();
    _addMarker(list[0], "Starting Point", 0);
    _addMarker(list[list.length - 1], "Ending point", list.length - 1);

    createRoute(list,pos);
    notifyListeners();
  }

  // ! ON CAMERA MOVE
  void onCameraMove(CameraPosition position) {
    _lastPosition = position.target;
    notifyListeners();
  }

  // ! ON CREATE
  void onCreated(GoogleMapController controller) {
    _mapController = controller;
    _polyLines.clear();
    /*
    LatLngBounds bound;
try{
 bound = LatLngBounds(southwest: initialPoint, northeast: endingPoint);
}catch(e){
  print(e.toString());
}
    

    
    CameraUpdate u2 = CameraUpdate.newLatLngBounds(bound, 50);
    this.mapController.animateCamera(u2).then((void v){
      check(u2,this.mapController);
    });*/
    notifyListeners();
  }

  void check(CameraUpdate u, GoogleMapController c) async {
    c.animateCamera(u);
    mapController.animateCamera(u);
    LatLngBounds l1 = await c.getVisibleRegion();
    LatLngBounds l2 = await c.getVisibleRegion();
    print(l1.toString());
    print(l2.toString());
    if (l1.southwest.latitude == -90 || l2.southwest.latitude == -90)
      check(u, c);
  }


  disposeEverything()async{
    clearPolylines();
    notifyListeners();
  }
}

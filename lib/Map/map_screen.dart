import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  var location = new Location();


  GoogleMapController mapController;
  static const LatLng _center = const LatLng(45.521563, -122.677433);
final Map<String, Marker> _markers = {};
List<LatLng> latlngSegment1 = List();
  List<LatLng> latlngSegment2 = List();
  static LatLng _lat1 = LatLng(32.6898849, 71.5056861);
  static LatLng _lat2 = LatLng(32.6517364, 71.5094627);
LatLng _lastMapPosition = _lat1;
  List<Location> ccc;
  MapView mapView;
  /*void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
   
    
  }*/

Future<void> _onMapCreated(GoogleMapController controller) async {
    //final googleOffices = await locations.getGoogleOffices();
    setState(() {
    //  _markers.clear();
        final marker = Marker(
          
          markerId: MarkerId(_lastMapPosition.toString()),
          position: _lastMapPosition,
          infoWindow: InfoWindow(
            title:"office.name",
            snippet: "office.address",
          ),
        );
        _markers["office.name"]=marker;
        _polyline.add(Polyline(
        polylineId: PolylineId('line1'),
        visible: true,
        //latlng is List<LatLng>
        points: latlngSegment1,
        width: 5,
        color: Colors.blue,
      ));

      //different sections of polyline can have different colors
      _polyline.add(Polyline(
        polylineId: PolylineId('line2'),
        visible: true,
        //latlng is List<LatLng>
        points: latlngSegment2,
        width: 2,
        color: Colors.blue,
      ));
    });
    
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    latlngSegment1.add(_lat1);
    latlngSegment2.add(_lat2);
  }
  @override
  LocationData _currentLocation;
  final Set<Polyline> _polyline = {};
  Widget build(BuildContext context) {
    location.onLocationChanged().listen((LocationData currentLocation) {
      setState(() {
        _currentLocation=currentLocation;
       
      });
  print(currentLocation.latitude);
  print(currentLocation.longitude);
  
  
});
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          tiltGesturesEnabled: true,
          scrollGesturesEnabled: true,
          rotateGesturesEnabled: true,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          zoomGesturesEnabled: true,
          mapType: MapType.normal,
          polylines:_polyline,
          markers: _markers.values.toSet(),
          initialCameraPosition: CameraPosition(
          target:_lastMapPosition,
          zoom: 2.0,
          ),
        ),
      ),
    );
  }
}

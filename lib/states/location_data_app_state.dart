

import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:uis_walking_routes/post.dart';
import 'package:http/http.dart' as http;

class AppLocationState extends ChangeNotifier{

  LocationData _latlng;
  bool firstCall = false;
  LocationData get currentLocation => _latlng;
  Location _location = Location();
  Post _whetherData;
  Post get dataWhether => _whetherData;
  getLocation()async{
    bool enabled = await _location.serviceEnabled();
    if(enabled){
      if(!firstCall)
      _location.getLocation().then((locationData)async{
        print(locationData.longitude.toString());
        Future.delayed(Duration(seconds:2),()async{
          _latlng = locationData;
          notifyListeners();
          if(!firstCall){
            firstCall = true;
            getWhetherData(locationData);
            notifyListeners();
          }
        });
      });
    }else{
      await _location.requestService();
    }
  }
  stopGettingLocation()async{

  }
  getWhetherData(locationData)async{
      print("whether her");
      try{
        final result = await InternetAddress.lookup('google.com');
        if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){
          final response = await http.get(
              'https://api.openweathermap.org/data/2.5/weather?lat=' +
                  locationData.latitude.toString() +
                  '&lon=' +
                  locationData.longitude.toString() +
                  '&appid=55517c3ae2db47c6872ca1fc451e016a');
          print(response.statusCode.toString());
          print(response.body.toString());
          if (response.statusCode == 200){
            _whetherData = Post.fromJson(json.decode(response.body));
            notifyListeners();
          }
        }
      }on SocketException catch(e){

      }
    }
}
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../main.dart';

class NetworkUtil {
  static final BASE_URL =
      "https://maps.googleapis.com/maps/api/directions/json?";

  static NetworkUtil _instance = new NetworkUtil.internal();

  NetworkUtil.internal();

  factory NetworkUtil() => _instance;
  final JsonDecoder _decoder = new JsonDecoder();

  Future<dynamic> get(String url) {

    return http.get(BASE_URL + url).then((http.Response response) {
      String res = response.body;
      int statusCode = response.statusCode;
      print('API response: '+ res);
      if (statusCode < 200 || statusCode > 400 || json == null) {
        res = "{\"status\":" +
            statusCode.toString() +
            ",\"message\":\"error\",\"response\":" +
            res +
            "}";
        return new Exception(res);
      }

      var distance;
      var duration;
      try {
        distance = _decoder.convert(res)["routes"][0]["legs"][0]["distance"]["value"];
        duration = _decoder.convert(res)["routes"][0]["legs"][0]["duration"]["text"];
      } catch (e) {
        return e;
      }
      return {"distance": distance, "duration" : duration};
    });
  }

   getAddress(lat,lng)async{
    var res = await http.get("https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$kGoogleApiKey");
    var body = jsonDecode(res.body);
    var address = body["results"][0]["formatted_address"];
    return address;
  }

}

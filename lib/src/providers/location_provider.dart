import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:rick_y_morty/src/models/location_model.dart';
import 'package:rick_y_morty/src/providers/providers.dart';
import 'package:http/http.dart' as http;

class LocationProvider extends Provider {
  LocationProvider() {
    this.localPath = "/location";
  }

  Future<List<Location>> getLocationsByPage({@required int page}) async {
    http.Response response =
        await http.get(this.baseUrl + this.localPath + "?page=$page");
    List<Location> locations = [];
    if (response.statusCode == 200) {
      Map mapData = json.decode(response.body);
      for (var item in mapData["results"]) {
        locations.add(new Location.fromJson(item));
      }
    }
    return locations;
  }
  
}

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:iti_labs/Model/Destination.dart';
import 'package:iti_labs/Model/Rooms.dart';


class NetworkManager{

  static Future<List<Destination>> destinationFromJson() async {
    var url =
    Uri.parse('https://608d4294fe2e9c00171e16f1.mockapi.io/destination');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var mappedResponse = json.decode(response.body) as List;
      List<Destination> destination = mappedResponse.map((postResponse) => Destination.fromJson(postResponse)).toList();
      return destination;
    } else {
      throw Exception("Can't Get Data");
    }
  }


  static  Future<List<Rooms>> roomsFromJson() async {
    var url = Uri.parse('https://608d4294fe2e9c00171e16f1.mockapi.io/rooms');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      //print(response.body);
      var mappedResponse = json.decode(response.body) as List;
      List<Rooms> room = mappedResponse.map((postResponse) => Rooms.fromJson(postResponse)).toList();
      return room;
    } else {
      throw Exception("Can't Get Data of room ");
    }
  }
}
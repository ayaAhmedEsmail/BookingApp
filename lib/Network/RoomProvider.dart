import 'package:flutter/cupertino.dart';
import 'package:iti_labs/Model/Destination.dart';
import 'package:iti_labs/Model/Rooms.dart';
import 'NetworkManager.dart';


class RoomProvider extends ChangeNotifier{
  List<Destination> dest;
  List<Rooms> rooms;
  RoomProvider(){
    getDest();
    getRoom();
  }

  Future<void>getDest(){
    NetworkManager.destinationFromJson().then((value) {
      dest = value;
      notifyListeners();
    });
  }

  Future<void>getRoom(){
    NetworkManager.roomsFromJson().then((value) {
      rooms = value;
      notifyListeners();
    });

  }
}
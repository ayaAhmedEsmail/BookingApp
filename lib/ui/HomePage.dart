import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Room.dart';
import '../Network/RoomProvider.dart';
import 'package:rating_bar/rating_bar.dart';

void main() {
  runApp(MyClass());
}

class MyClass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePage();
  }
}

class HomePage extends State<MyClass> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 80,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Home", style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w900)),
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage("https://cdn4.iconfinder.com/data/icons/men-avatars-icons-set-2/256/4-512.png?__cf_chl_captcha_tk__=18a8d692c483e3aeb3ae7d0f5dd97dc51a4edd03-1620288315-0-Ae4P5TCvnJdZOvXQWgIEf9GtPO0XBcpgcUR7NoAAbzk3e2QzPFNwlkRYR6J4ImfWnRwmKrqp-bDa9GXn3Cc3Rtl8AELbaSvM-MaqwZ238VFL4hzpkZQXWxQLKQFFduSsfnkLQByzxpebcGh98Eq1l6zOd2hjyIDRC7TR88anRSXmPVdmow4eg8gCfWpq_GmbNU6yaXGGeTFEjuZAwj7khdhYYjcFKj4k71_pRpYDg6ADRY5OYHy1liz77NcpKsmwxD7QPQoHRA6PD8KLiwSQvJaWjNmPavYvWg1xxAvRoKVBiYPRVpBiRT8UDH3EHKLGA18rCtlV-iyfveghs7AQwV7FkIAkqpXFfwOVyDAmDVZtl1wekVT_gdLJXdTwb6oAsLKCO-fLZhylnh40Jjb3WTCxI_pF-QDDeXlfH_fYDxsUTpg8wI8_RhyAyJ3cTOYu_6ziK1zS_sj0wraoSMkDj3usaH4cdLnKzn2RNyP3km_JhwBkyqzMF25ARzc80npRmxk710_lFbC-KQKOBBoPhqRX4OC0QC7WSP3tzRecBzoGjdz6b2cqSbDRgL_cr_eRt7Tu8D5zG131-VS8ClSwEdzMQGdbuAFs9jZQznO05mekF4oTwWQ8hfvX3Tj7OSOfSKr90NS56f8_xrs1wRemFdwl8_MT9Sf-34OerdtJvHWeaKITsp3En5GT1byaznLFcw"),
                backgroundColor: Colors.transparent,
              ),
            ],
          ),
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Destination Popular", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
                  Text("See More", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 350,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ChangeNotifierProvider<RoomProvider>(
                  create: (context) => RoomProvider(),
                  child: Consumer<RoomProvider>(
                    builder: (buildContext, roomProvider, _) {
                      return (roomProvider.dest != null)
                          ? Expanded(
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: roomProvider.dest.length,
                                  itemBuilder: (ctx, index) {
                                    return Container(
                                        margin: const EdgeInsets.all(15.0),
                                        child: ClipRRect(borderRadius: BorderRadius.circular(20.0),
                                          child: Stack(
                                            children: [
                                              Image.network(roomProvider.dest[index].image, fit: BoxFit.cover,),
                                              Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(40.0),
                                                  child: Text(roomProvider.dest[index].title, style: TextStyle(color: Colors.white, fontSize: 30),),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ));
                                  }))
                          : Expanded(
                              child:
                                  Center(child: CircularProgressIndicator()));
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 80, 0),
                    child: Text("Recommended Rooms",
                        style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              // height: 350,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ChangeNotifierProvider<RoomProvider>(
                    create: (context) => RoomProvider(),
                    child: Consumer<RoomProvider>(
                        builder: (buildContext, roomProvider, _) {
                      return (roomProvider.rooms != null)
                          ? Expanded(
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: roomProvider.rooms.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          child: Card(
                                              elevation: 5,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Wrap(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      print("on tap pressed");
                                                      Navigator.push( context, MaterialPageRoute( builder: (context) => Room(room: roomProvider.rooms[index])),
                                                      );
                                                    },
                                                    child: Hero(
                                                        tag: 'room -${roomProvider.rooms[index].image} ', // id
                                                        child: ClipRRect(
                                                            borderRadius: BorderRadius.circular(10.0),
                                                            child: Image.network(roomProvider.rooms[index].image, fit: BoxFit.fitWidth,))),
                                                  ),
                                                  ListTile(
                                                    title: Text(roomProvider.rooms[index].title, style: TextStyle(color: Colors.black, fontSize: 20),),
                                                    subtitle: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                          const EdgeInsets.fromLTRB(0, 8, 10, 10),
                                                          child: Row(
                                                            children: [
                                                              Text(roomProvider.rooms[index] .price,
                                                                  style: TextStyle( fontSize:15,color: Colors.grey,fontWeight:FontWeight.bold),textAlign:TextAlign.end),
                                                              Text("/per night",
                                                                  style: TextStyle(fontSize: 13, color: Colors.grey), textAlign: TextAlign.end),
                                                              Row(
                                                                children: [
                                                                  Container(
                                                                    margin: const EdgeInsets.only(
                                                                        top: 0, left: 20, bottom: 10),
                                                                    child: Row(children: [
                                                                      RatingBar.readOnly(
                                                                        initialRating:
                                                                        roomProvider.rooms[index].rating,
                                                                        size: 25,
                                                                        isHalfAllowed: true,
                                                                        halfFilledIcon: Icons.star_half,
                                                                        filledIcon: Icons.star,
                                                                        emptyIcon: Icons.star_border,
                                                                        filledColor: Colors.yellow,
                                                                      ),
                                                            ],
                                                          ),
                                                        ),
                                                                ],
                                                              ),Text(roomProvider.rooms[index].rating.toString()),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                                  ),
    ],)
                                    ),
                                    ),
                                    );
                                  }))
                          : Expanded(child: Center(child: CircularProgressIndicator()));
                    }),
                  ),
                ),
              ),
            ),
          ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.message,
                color: Colors.grey,
              ),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.next_plan,
                color: Colors.grey,
              ),
              label: 'School',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.grey,
              ),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.grey,
              ),
              label: 'Settings',
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // future: destinationFromJson(),
  }
  @override
  void initState() {
    // TODO: implement initState

    // callNetwork1();
    // destinationFromJson();
  }
}

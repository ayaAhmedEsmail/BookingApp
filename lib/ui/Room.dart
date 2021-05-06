import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:iti_labs/Model/Rooms.dart';

class Room extends StatelessWidget{
  Rooms  room;
  Room({this.room});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: Stack(
          children:[
            Hero(
                tag: 'room -${room.image} ',
                child:Image.network(room.image,  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,)
            ),

            Positioned(

              left: 25,
              right: 25,
              height: 250,
              bottom: 30,
              child: Container(
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: Colors.white.withOpacity(0.6),
                ),

                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(room.title, style:TextStyle (fontSize: 18,color: Colors.black, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis,
              ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(10,40,0,10),
                          child: Column(
                            children: [
                              Text("\$"+ room.price,  style:TextStyle (fontSize: 30, color: Colors.purple,fontWeight: FontWeight.bold) , textAlign: TextAlign.end),
                              Text("\ / Per night",  style:TextStyle (fontSize: 13, color: Colors.black) , textAlign: TextAlign.end),
                            ],
                          ),
                        )
                      ],

                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10,15,10,0),
                          child: Column(
                              children: [
                                Row(children: [
                                ],
                                ),
                                Row(children: [
                                  Icon(Icons.location_on_sharp , color: Colors.grey,) ,

                                  Text(room.location ,  style:TextStyle (fontSize: 14, color:Colors.grey,) ,)
                                ],
                                )
                              ]
                          ),
                        ),


                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(60, 10, 10, 0),
                              child: Icon(Icons.favorite , color: Colors.grey,size: 50,),
                            ) ,

                          ],
                        ),

                      ],

                    )

                  ],
                ),
              ),
            ),new Positioned(

              top: 50,
              left: 30,
              child: Container(
                width: 50,
                height: 50,
               child: IconButton(
                 icon: new Icon(Icons.arrow_back_sharp, color: Colors.black),
                 onPressed: () => Navigator.of(context).pop(),
               ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            )],

        ),

      ),
    );
  }

}
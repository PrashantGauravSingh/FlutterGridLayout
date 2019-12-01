import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gauge/AddDevice.dart';
import 'package:flutter_gauge/Search_device_screen.dart';
import 'package:flutter_gauge/WifiConnectScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wifi/wifi.dart';

class SavedWifiScreen extends StatefulWidget {
  @override
  _SavedWifiScreenState createState() => _SavedWifiScreenState();
}

class _SavedWifiScreenState extends State<SavedWifiScreen> {

  String password = '';
  int level = 0;
  bool isSetup = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black,),
              onPressed: () {}),
          actions: <Widget>[

            IconButton(
                icon: Icon(
                  Icons.sync,
                  color: Colors.black,
                ),
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  Icons.help_outline,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddDevice()),
                  );
                })
          ],
        ),
        body: _buildWifiSetupScreen(context)
    );
  }

  Widget _buildWifiSetupScreen(BuildContext context) {


      print("Second");
      return Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: LinearProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
                  backgroundColor: Colors.white70,
                  value: 0.5,
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SvgPicture.asset(
                    "images/svg/havells_logo (2).svg",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15),),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("You will be connected through the WiFi details you saved. Otherwise you can choose a different network.",
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),),
                  ),
                ),
              ),
              itemSSID(),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Choose Another WiFI Network",style: TextStyle(
                    color: const Color(0XFF181818),decorationStyle: TextDecorationStyle.solid,decoration: TextDecoration.underline),

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.black,
                    elevation: 0.0,
                    shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),side: BorderSide(color: Colors.grey)
                    ),//ex add 1000 instead of 25
                    splashColor: Colors.red,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchDeviceScreen()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "CONTINUE ",
                        style: TextStyle(color: Colors.white,fontSize: 17.0),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )

        ],
      );
    }

  Widget itemSSID() {


      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          elevation: 6.0,
          child: Column(children: <Widget>[
    Padding(
    padding: const EdgeInsets.all(15.0),
    child: Text("Your Saved WiFi Details",style: TextStyle(color: Colors.grey),),

    ),
            ListTile(
              leading: Image.asset('images/wifi3.png',
                  width: 28, height: 21),
              title: Text("Tp_Link_Add"
                ,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16.0,
                ),
              ),
              subtitle: Text(
                "Unstable"
                ,    style: TextStyle(
                color: Colors.grey,
                fontSize: 12.0,
              ),
              ),
              trailing: IconButton(icon: Icon(Icons.keyboard_arrow_right), onPressed: (){

              }),
              dense: true,
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WifiConnectScreen()),
                );
              },
            ),
           Padding(
             padding: const EdgeInsets.only(left:15.0,bottom: 10.0),
             child: Row(
               children: <Widget>[
                 Padding(
                   padding: const EdgeInsets.only(left:8.0),
                   child: Icon(Icons.brightness_1,color: const Color(0XFF58cc8a),size: 10,),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left:8.0),
                   child: Text("Your smartphone is connected to this WiFi",style: TextStyle(color: Colors.grey,fontSize: 12.0),
                   ),
                 ),
               ],
             ),
           )
          ]),
        ),
      );
    }
  }

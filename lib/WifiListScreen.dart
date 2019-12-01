import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gauge/AddDevice.dart';
import 'package:flutter_gauge/SavedWifiScreen.dart';
import 'package:flutter_gauge/WifiConnectScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wifi/wifi.dart';

class WifiListScreen extends StatefulWidget {
  @override
  _WifiListScreenState createState() => _WifiListScreenState();
}

class _WifiListScreenState extends State<WifiListScreen> {

  List<WifiResult> ssidList = [];
  String ssid = '',
      password = '';
  int level = 0;
  bool isSetup = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
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
        body: _buildWifiSetupScreen(context, isSetup)
    );
  }

  Widget _buildWifiSetupScreen(BuildContext context, bool isSetupWifi) {

    if (isSetup) {
      print("first");
      return Column(
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
              value: 0.4,
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
                child: Text("Choose your home WiFi Network from the list below to connect.",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                elevation: 8.0,
                child: ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  itemCount: ssidList.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    return itemSSID(index);
                  },
                ),
              ),
            ),
          ),
        ],
      );
    } else {
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
              value: 0.3,
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
                child: Text("Let's fetch your smart device details",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width/1.2,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15),),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Remember, your home WiFi and the device needs to be turned on for this.",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),maxLines: 2,),
              ),
            ),
          ),

        ],
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
                  setState(() {

                    isSetup=!isSetup;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "SETUP MY DEVICES ",
                    style: TextStyle(color: Colors.white,fontSize: 17.0),
                  ),
                ),
              ),
            ),
          )
        ],
      );
    }
  }

  Widget itemSSID(index) {

      if(index==0){
        return
           Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("WiFi NETWORK NEAR ME",style: TextStyle(color: Colors.grey),),

        );

      }else{
        return Column(children: <Widget>[
          Divider(),
          ListTile(
            leading: Image.asset('images/wifi3.png',
                width: 28, height: 21),
            title: Text(
              ssidList[index-1].ssid,
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
                MaterialPageRoute(builder: (context) => SavedWifiScreen()),
              );
            },
          ),
          Divider(),
        ]);
      }
  }

  void loadData() async {
    if (Platform.isIOS) {
      // TODO: iOS list SSID is not done
      setState(() {
        ssidList = [];
      });
    } else {
      Wifi.list('').then((list) {
        setState(() {
          ssidList = list;
          print("welcom ${ssidList.toString()}");
        });
      });
    }
  }
}

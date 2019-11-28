import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gauge/AddDevice.dart';
import 'package:flutter_gauge/WifiConnectScreen.dart';
import 'package:wifi/wifi.dart';

class WifiListScreen extends StatefulWidget {
  @override
  _WifiListScreenState createState() => _WifiListScreenState();
}

class _WifiListScreenState extends State<WifiListScreen> {

  List<WifiResult> ssidList = [];
  String ssid = '', password = '';
  int level = 0;


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
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,), onPressed: (){
        }),
        actions: <Widget>[
      IconButton(icon: Icon(Icons.person,color: Colors.black,), onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddDevice()),
        );
      })
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 15.0,
          child:LinearProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.blueGrey),
            backgroundColor: Colors.white70,
            value: 0.7,
          ),
        ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: new Image.asset(
              'images/logo.png',
              width: 40.0,
              height: 40.0,
              fit: BoxFit.cover,
                alignment: Alignment.centerLeft,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:15.0,top:10,right: 15.0,),
            child: Text("Choose your home WiFi Network from the list below to connect.",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16.0),),
          ),

           Expanded(
             child: Padding(
               padding: const EdgeInsets.all(15.0),
               child: Card(
                 elevation: 8.0,
    child:ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  itemCount: ssidList.length+1,
                  itemBuilder: (BuildContext context, int index) {
                    return itemSSID(index);
                  },
                ),
           ),
             ),
           ),
        ],
      ),
    );
  }
  Widget itemSSID(index) {

      if(index==0){
        return  Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("WiFi network near me"),
          ),
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

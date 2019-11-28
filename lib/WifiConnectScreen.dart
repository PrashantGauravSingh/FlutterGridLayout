import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gauge/AddDevice.dart';
import 'package:wifi/wifi.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';


class WifiConnectScreen extends StatefulWidget {
  @override
  _WifiConnectScreenState createState() => _WifiConnectScreenState();
}

class _WifiConnectScreenState extends State<WifiConnectScreen> {

  List<WifiResult> ssidList = [];
  String ssid = '', password = '';
  int level = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
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
              value: 0.8,
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
            child: Text("Here are your Home WiFi Details",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16.0),),
          ),
          Padding(
            padding: const EdgeInsets.only(left:15.0,top: 10.0,right: 15.0),
            child: Card(
              elevation: 8.0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/1.5,
                child: Column(
                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.all(15.0),
                            child: Container(
                              width: 75,
                              height: 75,
                              child: getDefaultRadialGauge(true),
                            ) ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Your WiFi Signal strength is"),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Excellent",style: TextStyle(fontWeight: FontWeight.w600),),
                      ),
                    ),
                    Divider(),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("My home WiFi details ",style: TextStyle(color: Colors.grey),),
                      ),
                    ),
                     Row(
                       children: <Widget>[
                         Padding(
                           padding: const EdgeInsets.all(15.0),
                           child: Text("Network Name : ",style: TextStyle(fontWeight: FontWeight.w600),),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text("Tp-Link-Home",style: TextStyle(fontWeight: FontWeight.w600),),
                         ),
                       ],
                     ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left:15.0,right: 15.0,top:8.0),
                        child: Text("Enter Network Password",style: TextStyle(fontWeight: FontWeight.w600),),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          initialValue: "12345",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        width: double.infinity,
                        child: RaisedButton(
                          color: Colors.white,
                        elevation: 0.0,
                        shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),side: BorderSide(color: Colors.grey)
                        ),//ex add 1000 instead of 25
                          splashColor: Colors.red,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AddDevice()),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "SAVE & CONTINUE ",
                              style: TextStyle(color: Colors.black,fontSize: 17.0),
                            ),
                          ),
                        ),
                      ),
                    )



                  ],
                ),
              ),
            ),
          )

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

  Color _needleColor = const Color(0xff000000);


  SfRadialGauge getDefaultRadialGauge(bool isTileView) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis( interval: 10, axisLineStyle: AxisLineStyle(thickness: 0.15,
            thicknessUnit: GaugeSizeUnit.factor,
            color: Colors.black
        ), showTicks: false,
            axisLabelStyle: GaugeTextStyle(fontSize: isTileView ? 12 : 14,color: Colors.transparent ),labelOffset: 25,
            radiusFactor: 0.95,
            pointers: <GaugePointer>[NeedlePointer(needleLength: 0.9, value: 30,
                lengthUnit:  GaugeSizeUnit.factor, needleColor: _needleColor,
                needleStartWidth: 0,  needleEndWidth: isTileView ? 3 : 4,
                knobStyle: KnobStyle( sizeUnit: GaugeSizeUnit.factor,
                    color:  _needleColor,
                    knobRadius: 0.05)),
            ]
        )
      ],
    );
  }
}

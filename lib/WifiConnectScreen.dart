import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gauge/AddDevice.dart';
import 'package:flutter_gauge/ControlScreen.dart';
import 'package:flutter_gauge/Search_device_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            child:LinearProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
              backgroundColor: Colors.white70,
              value: 0.8,
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
                padding: const EdgeInsets.all(15.0,),
                child: Text("Here are your Home WiFi Details",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16.0),),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:15.0,top: 5.0,right: 15.0),
            child: Card(
              elevation: 8.0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/1.6,
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
                    Divider(height: 5.0,),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("My home WiFi details ",style: TextStyle(color: Colors.grey),),
                      ),
                    ),

                         Container(
                           alignment: Alignment.centerLeft,
                           child: Padding(
                             padding: const EdgeInsets.only(left:15.0),
                             child: Text("Network Name : ",style: TextStyle(fontWeight: FontWeight.w600),),
                           ),
                         ),
                         Container(
                           alignment: Alignment.centerLeft,
                           child: Padding(
                             padding: const EdgeInsets.only(left:15.0,top: 5.0),
                             child: Text("Tp-Link-Home",style: TextStyle(fontWeight: FontWeight.w500),),
                     ),
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
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(fontSize: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                width: 0.5,
                                color: Colors.grey,
                                style: BorderStyle.solid,
                              ),
                            ),
                            filled: true,
                            contentPadding: EdgeInsets.all(16),
                            fillColor: Colors.white,
                          ),
                        ),
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
                              MaterialPageRoute(builder: (context) => SearchDeviceScreen()),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "SAVE & CONTINUE ",
                              style: TextStyle(color: Colors.white,fontSize: 14.0),
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

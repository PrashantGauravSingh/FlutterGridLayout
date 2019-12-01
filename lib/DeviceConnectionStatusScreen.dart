import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smartify/screens/Connect_wifi_screens/Search_device_screen.dart';

class DeviceConnectionStatusScreen extends StatefulWidget {
  @override
  _DeviceConnectionStatusScreenState createState() => _DeviceConnectionStatusScreenState();
}

class _DeviceConnectionStatusScreenState extends State<DeviceConnectionStatusScreen> {

  bool isConnected=false;
  bool isSuccess=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
// Here you can write your code

      setState(() {
        // Here you can write your code for open new view
       isSuccess=true;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              onPressed: () {})
        ],
      ),
      body: buildDeviceScreenConnect(context,isSuccess)
    );
  }

  /// HAndling view based on state change of the device connection
  ListView buildDeviceScreenConnect(BuildContext context,bool success) {
    if (success==false){
      return ListView(
        primary: true,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
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
                height: 15.0,
                child: LinearProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(
                      Colors.blueGrey),
                  backgroundColor: Colors.white70,
                  value: 0.8,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: new Image.asset(
                  'resources/assets/logo.png',
                  width: 40.0,
                  height: 40.0,
                  fit: BoxFit.cover,
                  alignment: Alignment.centerLeft,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, top: 10, right: 15.0, bottom: 10.0),
                child: Text(
                  "Your smart device is almost ready to use",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Aileron",
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                    elevation: 8.0,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircularPercentIndicator(
                                radius: 80.0,
                                lineWidth: 8.0,
                                animation: true,
                                animationDuration: 200,
                                percent: 0.60,
                                center: Text("60%"),
                                progressColor: Colors.blueGrey,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 1.5,
                            color: Colors.cyanAccent.shade50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width / 2,
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .width / 2,
                                    color: Colors.teal.shade300,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Container(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width / 2,
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .width / 2,
                                      child: Text(
                                        "Relax and sit back. We are connecting your device.",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Aileron",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16.0),
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    )
                ),
              ),
            ],
          ),
        ],
      );
  }else{
      return ListView(
        primary: true,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
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
                height: 15.0,
                child: LinearProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(
                      Colors.blueGrey),
                  backgroundColor: Colors.white70,
                  value: 0.8,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: new Image.asset(
                  'resources/assets/logo.png',
                  width: 40.0,
                  height: 40.0,
                  fit: BoxFit.cover,
                  alignment: Alignment.centerLeft,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, top: 20, right: 15.0, bottom: 10.0),
                child: Text(
                  "Your smart device is ready to use",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Aileron",
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                    elevation: 8.0,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: MediaQuery
        .of(context)
        .size
        .width / 6,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Device connected successfully!",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Aileron",
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0),
                          ),
                        ),
                        Center(
                          child: Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 1.5,
                            color: Colors.cyanAccent.shade50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Icon(Icons.check_circle,color: Colors.grey,size: 80,),
                              ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text(
                                    "Welcome to a brand new smart home experience.",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Aileron",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.0),
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Center(
                            child:  Container(
                                child: RaisedButton(
                                  color: Colors.black54,
                                  elevation: 0.0,
                                  shape: new RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(color: Colors.grey)),
                                  //ex add 1000 instead of 25
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
                                      "START USING MY DEVICE",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Aileron",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.0),
                                    ),
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    )
                ),
              ),
            ],
          ),
        ],
      );
    }
  }
}

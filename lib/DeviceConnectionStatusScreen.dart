import 'package:flutter/material.dart';
import 'package:flutter_gauge/Search_device_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
    Future.delayed(const Duration(milliseconds: 9000), () {
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
                Icons.sync,
                color: Colors.black,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.help_outline,
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
                child: LinearProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(
                      Colors.black),
                  backgroundColor: Colors.white70,
                  value: 0.8,
                ),
              ),

                 Padding(
                   padding: const EdgeInsets.all(15.0),
                   child: SvgPicture.asset(
                          "images/svg/havells_logo (2).svg",

    ),
                 ),

              ],),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15),),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Your smart device is almost ready to use",
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
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
                                  lineWidth: 4,
                                  animation: true,
                                  animationDuration: 2000,
                                  percent: 0.60,
                                  center: Text("60%"),
                                  progressColor: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
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
                                      child: SvgPicture.asset(
                                        "images/svg/relax_illustration.svg",
                                      ),
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
                child: LinearProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(
                      Colors.black),
                  backgroundColor: Colors.white70,
                  value: 0.8,
                ),
              ),
              //relax_illustration
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
                    child: Text("Your smart device is almost ready to use",
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),),
                  ),
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
                               Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SvgPicture.asset(
                                      "images/svg/tick.svg",
                                    ),
                                  ),
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
                                  color: Colors.black,
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

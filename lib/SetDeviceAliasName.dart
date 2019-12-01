import 'package:flutter/material.dart';
import 'package:flutter_gauge/AddDevice.dart';
import 'package:flutter_gauge/Search_device_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SetDeviceAliasName extends StatefulWidget {

  final String aliasName;
  SetDeviceAliasName(this.aliasName);
  @override
  _SetDeviceAliasNameState createState() => _SetDeviceAliasNameState();
}

class _SetDeviceAliasNameState extends State<SetDeviceAliasName> {
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
      body:  ListView(
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

                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SvgPicture.asset(
                              "images/svg/havells_logo (2).svg",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            widget.aliasName==null?"Device":widget.aliasName,
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
      ),);

  }
}

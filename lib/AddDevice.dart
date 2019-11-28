import 'package:flutter/material.dart';
import 'package:flutter_gauge/FirstDevice.dart';
import 'package:flutter_gauge/SecondDevice.dart';

class AddDevice extends StatefulWidget {
  @override
  _AddDeviceState createState() => _AddDeviceState();
}

class _AddDeviceState extends State<AddDevice> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,), onPressed: (){
            }),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.person,color: Colors.black,), onPressed: (){

              })
            ],
          
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Devices",style: TextStyle(fontSize: 25.0,color: Colors.black,fontWeight: FontWeight.bold),),
                  ),

                  TabBar(
                      unselectedLabelColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.label,

                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black),
                      tabs: [
                        Container(
                          width: 100,
                          alignment: Alignment.bottomLeft,
                          child: Tab(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(color: Colors.black, width: 1)),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("All Devices"),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          child: Tab(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(color: Colors.black, width: 1)),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("Automate"),
                              ),
                            ),
                          ),
                        ),

                      ]),
                ],
              )
          ),
          ),
          body: TabBarView(children: [
            FirstDevice(),
            SecondDevice(),
          ]),
        ));
  }
}

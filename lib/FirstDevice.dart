import 'package:flutter/material.dart';
import 'package:flutter_gauge/DropDownDeviceType.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FirstDevice extends StatefulWidget {
  @override
  _FirstDeviceState createState() => _FirstDeviceState();
}

class _FirstDeviceState extends State<FirstDevice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,


          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                 Container(
                   width: MediaQuery.of(context).size.width/2,
                   child: Padding(
                     padding: const EdgeInsets.only(left:15.0,top: 5.0),
                     child: Text("+ Create Room",textAlign: TextAlign.start,),
                   ),alignment: Alignment.centerLeft,),
                Container(
                  width: MediaQuery.of(context).size.width/2,
                  alignment: Alignment.centerRight, child: Padding(
                    padding: const EdgeInsets.only(right: 15,top: 5.0),
                    child: DropDownDeviceType(),
                  )),
              ],
            ),
            buildScrollDeviceScreen(context),
            buildAddRoom(context),
            buildScrollDevicesScreen(context)
          ],
        ),
      )
      );
  }


  Container buildAddRoom(BuildContext context){

    return Container(
      child: Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(5.0),
                child: new Container(
                  color: Colors.black.withAlpha(0),
                  height:
                  MediaQuery
                      .of(context)
                      .size
                      .height / 4.5,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: new Card(
                    color: const Color(0xfff3f3f3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    elevation: 3.0,
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                              const EdgeInsets.only(
                                  left: 20.0, top: 20),
                              child: Text(
                                "LIVING ROOM",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Aileron",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0),
                                maxLines: 2,
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(left:20.0,top: 5),
                              child: Text(
                                "2 Devices",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: "Aileron",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0),
                                maxLines: 2,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Row(

                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: SvgPicture.asset(
                                    "images/svg/Fan_icon.svg",
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: SvgPicture.asset(
                                    "images/svg/Gyser_icon.svg",
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                               SvgPicture.asset(
                                  "images/svg/Living_Room_Grey_Illustration.svg",
                                ),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
      ),
    );

  }

  Container buildScrollDeviceScreen(BuildContext context) {
    return new Container(
      height: MediaQuery.of(context).size.width / 1.6,
      width: MediaQuery.of(context).size.width,
      color: Colors.black.withAlpha(0),
      child: new GridView.builder(
        physics: ScrollPhysics(),
        itemCount: 2,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          childAspectRatio: 0.8
        ),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          if (index == 0) {
            return new GestureDetector(
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: const Color(0XFFF3F3F3),
                      elevation: 3.0,
                      child: new Container(
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.height / 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  "images/svg/Add_circle.svg",
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.height / 5,
                                child: Text(
                                  "Add new Devices",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Aileron",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {
                print(123);
              },
            );
          } else if (index == 1) {
            return new GestureDetector(
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: const Color(0XFF58CC8A),
                      elevation: 3.0,
                      child: new Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.height / 5,
                                child: Text(
                                  "Study Table Socket",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Aileron",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "On for last 2hrs",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Aileron",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11.0),
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  "images/svg/On_Button.svg",
                                ),
                              ),
                              alignment: Alignment.centerRight,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          "images/svg/Study_Table_Socket_illustration.svg",
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                  )
                ],
              ),
              onTap: () {
                print(123);
              },
            );
          } else if(index==2){
            return new GestureDetector(
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: const Color(0XFF3FB9E6),
                      elevation: 3.0,
                      child: new Container(
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.height / 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.height / 5,
                                child: Text(
                                  "My Bathroom Geyser",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Aileron",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "On for last 2hrs",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Aileron",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11.0),
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  "images/svg/On_Button.svg",
                                ),
                              ),
                              alignment: Alignment.centerRight,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          "images/svg/Geyser_Standard_Illustration.svg",
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                  )
                ],
              ),
              onTap: () {
                print(123);
              },
            );
          }else {
            return new GestureDetector(
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: const Color(0XFFfa7373),
                      elevation: 3.0,
                      child: new Container(
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.height / 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.height / 5,
                                child: Text(
                                  "Study Table Socket",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Aileron",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "On for last 2hrs",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Aileron",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11.0),
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  "images/svg/On_Button.svg",
                                ),
                              ),
                              alignment: Alignment.centerRight,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          "images/svg/Fan_Illustration.svg",
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                  )
                ],
              ),
              onTap: () {
                print(123);
              },
            );
          }
        },
      ),
    );
  }

  Container buildScrollDevicesScreen(BuildContext context) {
    return new Container(
      height: MediaQuery.of(context).size.width / 1.6,
      width: MediaQuery.of(context).size.width,
      color: Colors.black.withAlpha(0),
      child: new GridView.builder(
        physics: ScrollPhysics(),
        itemCount: 4,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8
        ),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
           if (index == 0) {
            return new GestureDetector(
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: const Color(0XFF58CC8A),
                      elevation: 3.0,
                      child: new Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.height / 5,
                                child: Text(
                                  "Study Table Socket",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Aileron",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "On for last 2hrs",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Aileron",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11.0),
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  "images/svg/On_Button.svg",
                                ),
                              ),
                              alignment: Alignment.centerRight,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          "images/svg/Study_Table_Socket_illustration.svg",
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                  )
                ],
              ),
              onTap: () {
                print(123);
              },
            );
          } else if(index==2){
            return new GestureDetector(
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: const Color(0XFF3FB9E6),
                      elevation: 3.0,
                      child: new Container(
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.height / 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.height / 5,
                                child: Text(
                                  "My Bathroom Geyser",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Aileron",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "On for last 2hrs",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Aileron",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11.0),
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  "images/svg/On_Button.svg",
                                ),
                              ),
                              alignment: Alignment.centerRight,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          "images/svg/Geyser_Standard_Illustration.svg",
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                  )
                ],
              ),
              onTap: () {
                print(123);
              },
            );
          }else {
            return new GestureDetector(
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: const Color(0XFFfa7373),
                      elevation: 3.0,
                      child: new Container(
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.height / 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.height / 5,
                                child: Text(
                                  "Study Table Socket",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Aileron",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "On for last 2hrs",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Aileron",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11.0),
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  "images/svg/On_Button.svg",
                                ),
                              ),
                              alignment: Alignment.centerRight,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          "images/svg/Fan_Illustration.svg",
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                  )
                ],
              ),
              onTap: () {
                print(123);
              },
            );
          }
        },
      ),
    );
  }

}


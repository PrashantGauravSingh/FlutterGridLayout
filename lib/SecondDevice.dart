import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondDevice extends StatefulWidget {
  @override
  _SecondDeviceState createState() => _SecondDeviceState();
}

class _SecondDeviceState extends State<SecondDevice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
            children: <Widget>[
              Expanded(child: buildScrollDeviceScreen(context))
            ],
        )
    );
  }
  Container buildScrollDeviceScreen(BuildContext context) {
    return new Container(
      height: MediaQuery.of(context).size.width / 1.6,
      width: MediaQuery.of(context).size.width,
      color: Colors.black.withAlpha(0),
      child: new GridView.builder(
        physics: ScrollPhysics(),
        itemCount: 6,
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
                                  "Create your Own Automation",
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

}


import 'package:flutter/material.dart';
import 'package:flutter_gauge/DeviceConnectionStatusScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchDeviceScreen extends StatefulWidget {
  @override
  SearchDeviceScreenState createState() => SearchDeviceScreenState();
}

class SearchDeviceScreenState extends State<SearchDeviceScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.5,
      duration: Duration(seconds: 3),
    )..repeat();
    Future.delayed(const Duration(milliseconds: 4000), () {

// Here you can write your code

      setState(() {
        //_showDialog("images/svg/sad_face_icon.svg","Uh-Oh!","The system could not find a nearby smart device");
        _showDialog("images/svg/call_icon.svg","","Looks like the connection could not be established. It will be better to contact our customer support now!");

        // Here you can write your code for open new view
      });

    });
    Future.delayed(const Duration(milliseconds: 8000), () {
// Here you can write your code

      setState(() {
        // Here you can write your code for open new view
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DeviceConnectionStatusScreen()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: Stack(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: LinearProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
                backgroundColor: Colors.white70,
                value: 0.6,
              ),
            ),
            _buildBody()
          ],
        ));
  }

  Widget _buildBody() {
    return AnimatedBuilder(
      animation: CurvedAnimation(parent: _controller, curve: Curves.easeIn),
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            _buildContainer(150 * _controller.value),
            _buildContainer(300 * _controller.value),
            _buildContainer(450 * _controller.value),
            Align(
                child: Icon(
              Icons.wifi_tethering,
              size: 44,
              color: Colors.transparent,
            )),
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                top: 100,
                right: 15.0,
              ),
              child: Text(
                "Searching for near by devices",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                    fontFamily: 'Aileron-Black',
                    color: Colors.blueGrey),
              ),
            ),
          ],
        );
      },
    );
  }


// user defined function
  void _showDialog(String iconPath,String title,String desc) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/3,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment:MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SvgPicture.asset(
                    iconPath,

                  ),
                ),
                new Text(title,style: TextStyle(color: const Color(0XFF181818),fontWeight: FontWeight.bold),),
                new Text(desc,style:
                TextStyle(color: const Color(0XFF181818),),maxLines: 3,
                textAlign: TextAlign.center,),
              ],
            ),
          ),

          elevation: 8.0,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
        Radius.circular(10.0),
        ),
        )
        );
      },
    );
  }

  Widget _buildContainer(double radius) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.redAccent.shade200.withOpacity(1 - _controller.value),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smartify/screens/Connect_wifi_screens/DeviceConnectionStatusScreen.dart';

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

    Future.delayed(const Duration(milliseconds: 3000), () {
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
                  Icons.person,
                  color: Colors.black,
                ),
                onPressed: () {})
          ],
        ),
        body: Stack(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 15.0,
              child: LinearProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.blueGrey),
                backgroundColor: Colors.white70,
                value: 0.3,
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

  Widget _buildContainer(double radius) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue.shade200.withOpacity(1 - _controller.value),
      ),
    );
  }
}

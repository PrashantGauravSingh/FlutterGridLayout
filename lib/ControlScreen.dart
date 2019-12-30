import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gauge/AddDevice.dart';
import 'package:flutter_gauge/WifiConnectScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ControlScreen extends StatefulWidget {
  @override
  _ControlScreenState createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  final double _initFabHeight = 120.0;
  double _fabHeight;
  double _panelHeightOpen = 550.0;
  double _panelHeightClosed = 450.0;
  bool isClicked=false;

  @override
  void initState(){
    super.initState();

    _fabHeight = _initFabHeight;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body:  Stack(
          alignment: Alignment.topRight,
          children: <Widget>[

            SlidingUpPanel(
              maxHeight: _panelHeightOpen,
              minHeight: _panelHeightClosed,
              parallaxEnabled: true,
              parallaxOffset: .5,
              body: _body(),

              panel: _panel(),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
              onPanelSlide: (double pos) => setState((){
                _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) + _initFabHeight;
              }),
            ),



          ],
        ),
    );
  }
  Widget _panel(){
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(height: 12.0,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 30,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(12.0))
                  ),
                ),
              ],
            ),

            SizedBox(height: 18.0,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Explore Pittsburgh",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 24.0,
                  ),
                ),
              ],
            ),

            SizedBox(height: 36.0,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(child: _button("Popular", Icons.favorite, Colors.blue),onTap: (){
                  setState(() {
                    isClicked=!isClicked;

                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WifiConnectScreen()),
                  );
                },),
                _button("Food", Icons.restaurant, Colors.red),
                _button("Events", Icons.event, Colors.amber),
                _button("More", Icons.more_horiz, Colors.green),
              ],
            ),

            SizedBox(height: 36.0,),

            Container(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Text("Images", style: TextStyle(fontWeight: FontWeight.w600,)),

                  SizedBox(height: 12.0,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      CachedNetworkImage(
                        imageUrl: "https://images.fineartamerica.com/images-medium-large-5/new-pittsburgh-emmanuel-panagiotakis.jpg",
                        height: 120.0,
                        width: (MediaQuery.of(context).size.width - 48) / 2 - 2,
                        fit: BoxFit.cover,
                      ),

                      CachedNetworkImage(
                        imageUrl: "https://cdn.pixabay.com/photo/2016/08/11/23/48/pnc-park-1587285_1280.jpg",
                        width: (MediaQuery.of(context).size.width - 48) / 2 - 2,
                        height: 120.0,
                        fit: BoxFit.cover,
                      ),

                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 36.0,),

            Container(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("About", style: TextStyle(fontWeight: FontWeight.w600,)),

                  SizedBox(height: 12.0,),

                  Text(
                    "Pittsburgh is a city in the Commonwealth of Pennsylvania "
                        "in the United States, and is the county seat of Allegheny County. "
                        "As of 2017, a population of 305,704 lives within the city limits, "
                        "making it the 63rd-largest city in the U.S. The metropolitan population "
                        "of 2,353,045 is the largest in both the Ohio Valley and Appalachia, "
                        "the second-largest in Pennsylvania (behind Philadelphia), "
                        "and the 26th-largest in the U.S.  Pittsburgh is located in the "
                        "south west of the state, at the confluence of the Allegheny, "
                        "Monongahela, and Ohio rivers, Pittsburgh is known both as 'the Steel City' "
                        "for its more than 300 steel-related businesses and as the 'City of Bridges' "
                        "for its 446 bridges. The city features 30 skyscrapers, two inclined railways, "
                        "a pre-revolutionary fortification and the Point State Park at the "
                        "confluence of the rivers. The city developed as a vital link of "
                        "the Atlantic coast and Midwest, as the mineral-rich Allegheny "
                        "Mountains made the area coveted by the French and British "
                        "empires, Virginians, Whiskey Rebels, and Civil War raiders. ",
                    maxLines: 7,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
    isClicked ?new Center(
    child: new ClipRect(
    child: new BackdropFilter(
    filter: new ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
    child: new Container(
    decoration: new BoxDecoration(
    color: Colors.grey.shade200.withOpacity(0.5)
    ),
    child: new Center(
    child: new Text(
    'Frosted',
    style: Theme.of(context).textTheme.display3
    ),
    ),
    ),
    ),
    ),
    ):Container(),

      ],
    );
  }
  Widget _body(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          color: const Color(0XFF58CC8A),
          height: 50.0,
          width: MediaQuery.of(context).size.width,
          child: Text("My Geyser Room",style: TextStyle(color: Colors.white,fontSize: 22.0),),
        ),
      Container(
    color: const Color(0XFF58CC8A),
    child: Stack(
    alignment: Alignment.topRight,
    children: <Widget>[
    Container(
    width: MediaQuery.of(context).size.height/2.8,
    child: SvgPicture.asset(
    "images/svg/Girl_Illustration.svg",
    ),
    ),
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          color: const Color(0XFF58CC8A),
          height: 50.0,
          width: MediaQuery.of(context).size.width/2,
          child: Text("My Geyser Room",style: TextStyle(color: Colors.white,fontSize: 22.0),),
        ),
      ],
    ),
    Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[

    Padding(
    padding: const EdgeInsets.only(left:10.0,top: 40),
    child: Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(50),
    border: Border.all(color: Colors.black, width: 1)),
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text("All Devices"),

    ),
    ),
    ),Padding(
    padding: const EdgeInsets.only(left:10.0,top: 40),
    child: Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(50),
    border: Border.all(color: Colors.black, width: 1)),
    child:  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text("Automate"),
    ),
    ),
    ),

    ],
    ),
    ])),

    ],
    );
  }
  Widget _button(String label, IconData icon, Color color){
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Icon(
            icon,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.15),
                blurRadius: 8.0,
              )]
          ),
        ),

        SizedBox(height: 12.0,),

        Text(label),
      ],

    );
  }


}

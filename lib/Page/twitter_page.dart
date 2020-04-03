import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class TwitterPage extends StatefulWidget {

  @override
  _TwitterPageState createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {

  bool lanzar = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: FaIcon(FontAwesomeIcons.play,),
        onPressed: (){
          this.setState((){
            lanzar = true;
          });
        },
      ),
      backgroundColor: Color(0xFF1DA1F2),
      body: Center(
        child: ZoomOut(
          animate: lanzar,
          from: 30,
          duration: Duration(milliseconds: 1000),
          child: FaIcon(FontAwesomeIcons.twitter, size: 50, color: Colors.white,)
        )
     ),
   );
  }
}
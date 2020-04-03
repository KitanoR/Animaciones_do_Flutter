import 'package:animate_do/animate_do.dart';
import 'package:animates_do/Page/page2_page.dart';
import 'package:animates_do/Page/twitter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class AnimacionDoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeIn(duration:Duration(milliseconds: 600), child: Text('Animate do')),
        actions: <Widget>[
          IconButton(
            icon: FaIcon(FontAwesomeIcons.twitter),
            onPressed: (){
              Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) =>  TwitterPage()));
            },
          ),
          SlideInLeft(
            from: 100,
              child: IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: (){
                Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => AnimacionDoPage()));
              },
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElasticIn(
              delay: Duration(milliseconds: 1000),
              child: Icon(Icons.new_releases, color: Colors.blue, size: 40,)
            ),
            FadeInDown(
              delay: Duration(milliseconds: 200),
              child:  Text('Titulo', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),),
            ),
            FadeInDown(
              delay: Duration(milliseconds: 1000),
              child: Text('Soy un texto pequenio', style: TextStyle(fontSize: 20),),

            ),
            FadeInLeft(
              delay: Duration(milliseconds: 1100),
              child: Container(
                width: 220,
                height: 2,
                color: Colors.blue,
              )
            )
            
          ],
        ),
     ),
     floatingActionButton: ElasticInRight(
            child: FloatingActionButton(
              child: FaIcon(FontAwesomeIcons.play),
              onPressed: (){
                Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) =>  Page2Page()));
              },
       ),
     ),
   );
  }
}
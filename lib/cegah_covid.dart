import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prakerja/view/home/home_page.dart';

import 'beranda.dart';

class CegahCovid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        drawer: Drawer(

          child: new ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.3, 1],
                        colors: <Color>[
                          Colors.blue,
                          Colors.cyanAccent
                        ]
                    )
                ),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        elevation: 10.0,
                        child: Padding(padding: EdgeInsets.all(0.0),
                          child: Image.asset("images/crop_image.jpg", width: 100, height: 100,),),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text("Barnabas Sarbunan", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
                            fontSize: 18),),
                      )
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.accessibility_new),
                title: Text("Total Cases"),
                trailing: Icon(Icons.arrow_right),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Beranda()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.pan_tool),
                title: Text("Pencegaan"),
                trailing: Icon(Icons.arrow_right),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> CegahCovid()),
                  );
                },
              )
            ],

          ),
        ),
        appBar: AppBar(
          title: Text('Cara Pencegahan',style: TextStyle(color: Colors.white),),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              color: Colors.yellowAccent,
              height: double.infinity, // tambahkan property berikut

              foregroundDecoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "images/a9.png",
                    ),
                    fit: BoxFit.fill
                )
              ),
            ),
            Container(
              color: Colors.blueAccent,
              height: double.infinity, // tambahkan property berikut
              foregroundDecoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "images/a8.png",
                      ),
                      fit: BoxFit.fill
                  )
              ),
            ),
            Container(
              color: Colors.black12,
              height: double.infinity, // tambahkan property berikut

              foregroundDecoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "images/a3.png",
                      ),
                      fit: BoxFit.fill
                  )
              ),
            ),
            Container(
              color: Colors.lime,
              height: double.infinity, // tambahkan property berikut

              foregroundDecoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "images/a6.png",
                      ),
                      fit: BoxFit.fill
                  )
              ),
            ),
            Container(
              color: Colors.orange,
              height: double.infinity, // tambahkan property berikut

              foregroundDecoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "images/a10.png",
                      ),
                      fit: BoxFit.fill
                  )
              ),
            ),
            Container(
              color: Colors.greenAccent,
              height: double.infinity, // tambahkan property berikut

              foregroundDecoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "images/a2.png",
                      ),
                      fit: BoxFit.fill
                  )
              ),
            ),

          ],
        ),
      ),
    );
  }
}
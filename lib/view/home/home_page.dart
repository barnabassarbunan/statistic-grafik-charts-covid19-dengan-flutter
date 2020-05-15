import 'package:prakerja/beranda.dart';
import 'package:prakerja/config/env.dart';
import 'package:prakerja/model/covid_provinsi.dart';
import 'package:prakerja/network/api_client.dart';
import 'package:prakerja/view/detail/detail_page.dart';
import 'package:prakerja/view/home/home_content.dart';
import 'package:flutter/material.dart';

import '../../cegah_covid.dart';

class HomePage extends StatelessWidget {

  // TODO 17
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text("Case Covid-19 Provinsi"),
      ),

      body: Container(
        alignment: Alignment.center,
        child: FutureBuilder<CoronaProvince>(
          future: ApiClient.getCoronaProvinceId(),
          builder: (
              BuildContext context,
              AsyncSnapshot<CoronaProvince> snapshot,
              ) {
            if (snapshot.hasData) {
              return HomeContent(
                coronaProvinceId: snapshot.data,
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
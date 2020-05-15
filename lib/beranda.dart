import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:prakerja/cegah_covid.dart';
import 'package:prakerja/view/detail/detail_page.dart';
import 'package:prakerja/view/home/beranda_content.dart';
import 'package:prakerja/view/home/home_page.dart';

import 'config/env.dart';
import 'model/covid_prov.dart';
import 'model/covid_provinsi.dart';
import 'package:http/http.dart' as http;

import 'network/api_client.dart';



class Beranda extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Prakerja Eureka',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Total Cases di Indonesia'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Posts>  _list = [];
  Future<Null> fetchData() async{
    final response = await http.get(Uri.encodeFull("https://indonesia-covid-19.mathdro.id/api/provinsi"),
        headers: {"Accept": "application/json"});
    if(response.statusCode==200){
      final data = jsonDecode(response.body)['data'];
      print(data);
      setState(() {
        for(Map i in data){
          _list.add(Posts.fromJson(i));
        }
      });

    }
  }

  @override
  void initState(){
    fetchData();
    super.initState();
  }
  void _incrementCounter() {
    setState(() {

    });
  }

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
        title: Text(widget.title),
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
              return BerandaContent(
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

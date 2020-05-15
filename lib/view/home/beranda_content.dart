import 'package:flutter/cupertino.dart';
import 'package:prakerja/config/env.dart';
import 'package:prakerja/model/covid_cases.dart';
import 'package:prakerja/model/covid_provinsi.dart';
import 'package:flutter/material.dart';

class BerandaContent extends StatefulWidget {
  final CoronaProvince coronaProvinceId;

  const BerandaContent({
    Key key,
    this.coronaProvinceId,
  }) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<BerandaContent> {
  List<CovidCases> _listCoronaCases;
  List<Datum> _listData;

  @override
  void initState() {
    _listCoronaCases = <CovidCases>[
      CovidCases(
        title: "Positif",
        count: 0,
      ),
      CovidCases(
        title: "Sembuh",
        count: 0,
      ),
      CovidCases(
        title: "Meninggal",
        count: 0,
      ),
      CovidCases(
        title: "Perawatan",
        count: 0,
      ),
    ];
    _listData = widget.coronaProvinceId.listData;
    for (Datum data in _listData) {
      _listCoronaCases[0].count += data.positiveCases;
      _listCoronaCases[1].count += data.curedCases;
      _listCoronaCases[2].count += data.deathCases;
    }
    _listCoronaCases[3].count = _listCoronaCases[0].count;
    _listCoronaCases[3].count -= _listCoronaCases[1].count;
    _listCoronaCases[3].count -= _listCoronaCases[2].count;
    super.initState();
  }

  // TODO 10

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: <Widget>[
          GridView.builder(
            primary: false,
            shrinkWrap: true,
            padding: const EdgeInsets.all(16.0),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400.0,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (BuildContext context, int index) {
              return _itemGrid(index);
            },
            itemCount: _listCoronaCases.length,
          ),

        ],
      ),
    );
  }

  // TODO 09
  final List<Color> circleColors = [
    Colors.red,
    Colors.lightGreen,
    Colors.yellowAccent,
    Colors.lightBlueAccent
  ];
  Widget _itemGrid(int index) {
    return Card(
      elevation: 50,
      margin: const EdgeInsets.all(7.0),
//      color: Colors.primaries[index*3],
      color: circleColors[index] ,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Center(
        child: ListView(
          primary: false,
          shrinkWrap: true,
          children: <Widget>[
            Text(
              "${_listCoronaCases[index].title}",
              style: TextStyle(
                fontSize: 40.0,
                fontStyle: FontStyle.normal
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Text(
              "${_listCoronaCases[index].count}",
              style: TextStyle(
                fontSize: 60.0,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
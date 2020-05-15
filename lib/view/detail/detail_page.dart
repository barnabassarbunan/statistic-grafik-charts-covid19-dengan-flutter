import 'package:prakerja/config/env.dart';
import 'package:prakerja/model/covid_provinsi.dart';
import 'package:prakerja/view/detail/detail_content.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  ChartsType _chartsType;

  @override
  void initState() {
    _chartsType = ChartsType.PIE;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Datum _data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(_data?.province ?? ""),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.cached),
            onPressed: () {
              // TODO 15
              _chartsType = _chartsType == ChartsType.PIE
                  ? ChartsType.BAR
                  : ChartsType.PIE;
              setState(() {});
            },
          ),
        ],
      ),
      body: Card(
        margin: const EdgeInsets.all(16.0),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16.0),
          child: DetailContent(
            data: _data,
            chartsType: _chartsType,
          ),
        ),
      ),
    );
  }
}
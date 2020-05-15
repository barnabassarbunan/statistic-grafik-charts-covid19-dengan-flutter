import 'package:charts_flutter/flutter.dart';
import 'package:prakerja/config/env.dart';
import 'package:prakerja/model/covid_cases.dart';
import 'package:prakerja/model/covid_provinsi.dart';
import 'package:flutter/material.dart';

class DetailContent extends StatefulWidget {
  final Datum data;
  final ChartsType chartsType;

  const DetailContent({
    Key key,
    this.data,
    this.chartsType,
  }) : super(key: key);

  @override
  _DetailContentState createState() => _DetailContentState();
}

class _DetailContentState extends State<DetailContent> {
  // TODO 13
  List<CovidCases> _listCases;
  List<Series<CovidCases, String>> _listSeries;

  @override
  void initState() {
    _listCases = <CovidCases>[
      CovidCases(
        title: "Positif",
        count: widget.data.positiveCases,
      ),
      CovidCases(
        title: "Sembuh",
        count: widget.data.curedCases,
      ),
      CovidCases(
        title: "Meninggal",
        count: widget.data.deathCases,
      ),
    ];
    _listSeries = <Series<CovidCases, String>>[
      Series(
        id: widget.data.province,
        data: _listCases,
        domainFn: (CovidCases cases, int index) {
          return cases.title;
        },
        measureFn: (CovidCases cases, int index) {
          return cases.count;
        },
        labelAccessorFn: (CovidCases cases, int index) {
          return "${cases.count}";
        },
      ),
    ];
    super.initState();
  }

  // TODO 14
  @override
  Widget build(BuildContext context) {
    return widget.chartsType == ChartsType.BAR
        ? BarChart(
      _listSeries,
      barRendererDecorator: BarLabelDecorator<String>(
        labelPosition: BarLabelPosition.outside,
      ),
    )
        : PieChart(
      _listSeries,
      defaultRenderer: ArcRendererConfig(
        arcRendererDecorators: [
          ArcLabelDecorator(
            labelPosition: ArcLabelPosition.outside,
          ),
        ],
      ),
      behaviors: [
        DatumLegend(),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class Sales {
  String year;
  int sales;

  Sales(this.year,this.sales);
}

class _State extends State<MyApp> {

  List<Sales> _laptops;
  List<Sales> _desktops;
  List<Sales> _mobiles;
  List<charts.Series<Sales, String>> _chartdata;


  void _makeData() {

    _laptops = new List<Sales>();
    _desktops = new List<Sales>();
    _mobiles = new List<Sales>();
    _chartdata = new List<charts.Series<Sales, String>>();

    final rnd = new Random();
    for(int i = 2016; i < 2019; i++) {
      _laptops.add(new Sales(i.toString(), rnd.nextInt(100)));
      _desktops.add(new Sales(i.toString(), rnd.nextInt(100)));
      _mobiles.add(new Sales(i.toString(), rnd.nextInt(100)));

    }

    _chartdata.add(new charts.Series(
      id: 'Sales',
      data: _laptops,
      domainFn: (Sales sales,__) => sales.year,
      measureFn: (Sales sales,__) => sales.sales,
      displayName: 'Sales',
      colorFn: (_,__) => charts.MaterialPalette.green.shadeDefault,
    ));

    _chartdata.add(new charts.Series(
      id: 'Sales',
      data: _desktops,
      domainFn: (Sales sales,__) => sales.year,
      measureFn: (Sales sales,__) => sales.sales,
      displayName: 'Sales',
      colorFn: (_,__) => charts.MaterialPalette.red.shadeDefault,
    ));

    _chartdata.add(new charts.Series(
      id: 'Sales',
      data: _mobiles,
      domainFn: (Sales sales,__) => sales.year,
      measureFn: (Sales sales,__) => sales.sales,
      displayName: 'Sales',
      colorFn: (_,__) => charts.MaterialPalette.blue.shadeDefault,
    ));

  }

  @override
  void initState() {
    _makeData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      body: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Text('Add Widgets Here'),
                new Expanded(child: new  charts.BarChart(
                 _chartdata,


                ))
              ],
            ),
          )
      ),
    );
  }
}
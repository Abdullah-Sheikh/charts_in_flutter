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

class Sales
{
  String year;
  int _sales ;
  Sales(this.year,this._sales);
}

class _State extends State<MyApp> {

  List <Sales>_data;
  List<charts.Series <Sales,String>> _chartdata;



  void makedata()
  {
    _data = new List<Sales>();
    _chartdata = new  List<charts.Series<Sales,String>>();

    final rnd = new Random();
    for(int i=2010;i<2019;i++)
      {
        _data.add(new Sales(i.toString(), rnd.nextInt(1000)));
      }
    
    _chartdata.add(new charts.Series(
        id: 'Sales',
        //colorFn: (_,__) => charts.MaterialPalette.red.shadeDefault, //Old version
        colorFn: (Sales sales,__) => charts.MaterialPalette.red.shadeDefault,
        data: _data,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales._sales,
        //fillPatternFn: (_,__) => charts.FillPatternType.forwardHatch, // Old version
        fillPatternFn: (Sales sales,__) => charts.FillPatternType.forwardHatch,
        displayName: 'sales'
    )
    );


  }

  @override
  void initState() {
    makedata();

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('My First App'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
            new Text('Sales Data'),
            //new Expanded(child: new charts.BarChart<Sales>(_chartdata))
            new Expanded(child: new charts.BarChart(_chartdata))
          ],
        ),
      ),
    );
  }
}
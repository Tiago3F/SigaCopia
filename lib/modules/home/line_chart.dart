import 'dart:html';

//import 'package:chart_engine/chart_engine_chartjs.dart';
import 'package:chart_engine/chart_engine_apexcharts.dart';
import 'package:flutter/material.dart';

import 'dart:ui' as ui;
import 'package:universal_html/html.dart' as html;
import 'package:flutter_html/flutter_html.dart';

void main() async {
  var series = ChartSeries([
    'Jan',
    'Feb',
    'Mar'
  ], {
    'A': [10, 20, 5],
    'B': [15, 25, 55],
    'C': [100, 130, 140]
  });

  series.title = 'Chart Example';
  series.xTitle = 'Months';
  series.yTitle = 'Count';
  series.options.fillLines = true;
  series.options.straightLines = true;

  //var charEngine = ChartEngineChartJS() ;
  var charEngine = ChartEngineApexCharts();
  await charEngine.load();
  charEngine.renderLineChart(
      querySelector('#apexcharts-line1-output')!, series);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: new MyHomePage(title: 'flutter_html Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

const htmlData = r"""
     <div id="apexcharts-line1-output" class="chart">teste</div>
""";

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('flutter_html Example'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Html(
          data: htmlData,
          tagsList: Html.tags..addAll(["apexcharts-line1-output"]),
        ),
      ),
    );
  }
}

// class LineChart extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//           alignment: Alignment.topLeft,
//           padding: const EdgeInsets.all(10),
//           child: Container()),
//     );
//   }
// }

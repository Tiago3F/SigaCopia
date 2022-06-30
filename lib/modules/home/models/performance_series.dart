import 'package:flutter/painting.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GDPData {
  GDPData(this.items, this.valor, this.color);
  final String items;
  final int valor;
  final Color color;
}

class ChartData {
  ChartData(this.x, this.y, this.color);

  final String x;
  final double y;
  final Color color;
}

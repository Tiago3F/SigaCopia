import 'dart:html';
import 'dart:ui';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'models/performance_series.dart';

class StackedAreaCustomColorLineChart extends StatefulWidget {
  @override
  State<StackedAreaCustomColorLineChart> createState() =>
      _StackedAreaCustomColorLineChartState();
}

class _StackedAreaCustomColorLineChartState
    extends State<StackedAreaCustomColorLineChart> {
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Metas",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                Icon(
                  FontAwesomeIcons.headset,
                  size: 20,
                )
              ],
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 0.4,
          ),
          SfCircularChart(
            onLegendItemRender: (LegendRenderArgs args) => legend(args),
            legend: Legend(
              isVisible: true,
              overflowMode: LegendItemOverflowMode.wrap,
              position: LegendPosition.bottom,
              iconWidth: 10,
              iconHeight: 10,
              isResponsive: true,
            ),
            tooltipBehavior: _tooltipBehavior,
            series: <CircularSeries>[
              RadialBarSeries<GDPData, String>(
                  dataSource: _chartData,
                  xValueMapper: (GDPData data, _) => data.items,
                  yValueMapper: (GDPData data, _) => data.valor,
                  pointColorMapper: (GDPData data, _) => data.color,
                  // dataLabelSettings: DataLabelSettings(isVisible: true),
                  enableTooltip: true,
                  cornerStyle: CornerStyle.bothCurve,
                  animationDuration: 900,
                  maximumValue: 100)
            ],
          ),
          // LINHA RABISCADA(PESQUISAR A BIBLIOTECA)
          DottedLine(
            dashColor: Colors.grey,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  width: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "188 / 2.040",
                            style: TextStyle(fontWeight: FontWeight.w900),
                          ),
                          Text("Pontos"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              DottedLine(
                direction: Axis.vertical,
                lineLength: 120,
                dashColor: Colors.grey,
              ),
              Expanded(
                child: Container(
                  height: 50,
                  width: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("1.852",
                              style: TextStyle(fontWeight: FontWeight.w900)),
                          Text("Faltantes"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              DottedLine(
                direction: Axis.vertical,
                lineLength: 120,
                dashColor: Colors.grey,
              ),
              Expanded(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color(0xFFfbd1cd),
                              borderRadius: BorderRadius.circular(500),
                            ),
                            child: Text(
                              textAlign: TextAlign.center,
                              'Nível 0 - 9,22%',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFea5c43),
                              ),
                            ),
                          ),
                          Text("Nível"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    )));
  }

// Controle de icones da legenda
  void legend(LegendRenderArgs args) {
    args.legendIconType = LegendIconType.circle;
  }

// Itens do gráfico
  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('TAM', 45, Color(0xFF0386c6)),
      GDPData('Rechamada', 22, Color(0xFFf91919)),
      GDPData('Satisfação no Atendimento', 90, Color(0xFF359928)),
      GDPData('Índice de Resolução', 74, Color(0xFFf3c056)),
      GDPData('Pontuação', 61, Color(0xFFb130c8)),
      GDPData('Monitoria de Qualidade', 99, Color(0xFF20eeff)),
    ];
    return chartData;
  }
}

class PerformanceGraficPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: StackedAreaCustomColorLineChart()),
    );
  }
}

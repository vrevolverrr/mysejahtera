import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:mysj/data/helpers.dart';

// ignore: non_constant_identifier_names
Widget ChartLegend(Color color, String label) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(right: 6.0),
        width: 12.0,
        height: 12.0,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
      Container(
        margin: EdgeInsets.only(right: 25.0),
        height: 14.0,
        child: Text(label),
      ),
    ],
  );
}

Widget _chartContainer(
    {required double height,
    required String title,
    required String subtitle,
    required Widget chart,
    required List<Widget> legend}) {
  return SizedBox(
    width: double.infinity,
    height: height,
    child: Container(
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                subtitle,
                style: TextStyle(
                  color: Color(0xff707070),
                  fontSize: 12.0,
                ),
              ),
              SizedBox(
                height: 18.0,
              ),
              Expanded(
                child: chart,
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: legend,
              )
            ],
          ),
        ],
      ),
    ),
  );
}

class CustomLineChart extends StatelessWidget {
  final String title;
  final String subtitle;
  final double yMax;
  final double yReservedSize;
  final double xReservedSize;
  final List<List<double>> y;
  final List<Color> yColors;
  final List<String> xLabels;
  final List<double> xLabelValues;
  final List<String> yLabels;
  final List<double> yLabelValues;
  final List<Widget> legend;

  CustomLineChart(
      {required this.title,
      required this.subtitle,
      required this.yMax,
      required this.y,
      this.xReservedSize = 22.0,
      this.yReservedSize = 24.0,
      required this.yColors,
      required this.xLabels,
      required this.xLabelValues,
      required this.yLabels,
      required this.yLabelValues,
      required this.legend});

  List<LineChartBarData> mapData() {
    final List<LineChartBarData> data = [];

    for (int i = 0; i < y.length; i++) {
      double accumulator = -1.0;
      data.add(LineChartBarData(
        spots: y[i].map((data) {
          accumulator += 2.0;
          return FlSpot(accumulator, data);
        }).toList(),
        isCurved: true,
        curveSmoothness: 0,
        colors: [
          yColors[i],
        ],
        barWidth: 3.0,
        isStrokeCapRound: true,
        dotData: FlDotData(show: true),
        belowBarData: BarAreaData(
          show: false,
        ),
      ));
    }
    return data;
  }

  Widget build(BuildContext context) {
    return _chartContainer(
        height: 300.0,
        title: title,
        subtitle: subtitle,
        chart: LineChart(LineChartData(
            lineTouchData: LineTouchData(
                enabled: true,
                touchTooltipData: LineTouchTooltipData(
                    tooltipBgColor: Color(0xfff7f7f7),
                    tooltipRoundedRadius: 10.0,
                    tooltipPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                      return touchedBarSpots.map((flSpot) {
                        return LineTooltipItem(
                            '${flSpot.y.toInt()}',
                            TextStyle(
                                color: flSpot.bar.colors[0],
                                fontFamily: "MazzardH-SemiBold"));
                      }).toList();
                    })),
            gridData: FlGridData(
                show: true, horizontalInterval: yMax / (yLabels.length - 1)),
            titlesData: FlTitlesData(
              leftTitles: SideTitles(
                  showTitles: true,
                  reservedSize: yReservedSize,
                  margin: 8.0,
                  getTextStyles: (value) => TextStyle(
                        color: Colors.black,
                        fontFamily: "MazzardH-SemiBold",
                        fontSize: 14.0,
                      ),
                  getTitles: (value) {
                    if (yLabelValues.contains(value)) {
                      return yLabels[yLabelValues.indexOf(value)];
                    }
                    return '';
                  }),
              bottomTitles: SideTitles(
                  showTitles: true,
                  reservedSize: xReservedSize,
                  margin: 10.0,
                  getTextStyles: (value) => TextStyle(
                        color: Colors.black,
                        fontFamily: "MazzardH-SemiBold",
                        fontSize: 13.0,
                      ),
                  getTitles: (value) {
                    if (xLabelValues.contains(value)) {
                      return xLabels[xLabelValues.indexOf(value)];
                    }
                    return '';
                  }),
            ),
            borderData: FlBorderData(
                show: true,
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xff4e4965),
                    width: 1.0,
                  ),
                  left: BorderSide(
                    color: Colors.transparent,
                  ),
                  right: BorderSide(
                    color: Colors.transparent,
                  ),
                  top: BorderSide(
                    color: Colors.transparent,
                  ),
                )),
            minX: 0,
            maxX: 2 + (xLabels.length - 1) * 2,
            maxY: yMax + yMax * 0.001,
            minY: 0,
            lineBarsData: mapData())),
        legend: legend);
  }
}

class CustomHorizontalBarChart extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color barColor;
  final double maxBarWidth;
  final List<String> yLabels;
  final List<double> x;
  final List<Widget> legend;

  CustomHorizontalBarChart(
      {required this.title,
      required this.subtitle,
      required this.barColor,
      this.maxBarWidth = 180.0,
      required this.yLabels,
      required this.x,
      required this.legend});

  // ignore: non_constant_identifier_names
  Widget HorizontalBarLabel(String label) {
    return SizedBox(
        height: 30.0,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            label,
          ),
        ));
  }

  // ignore: non_constant_identifier_names
  Widget HorizontalBarData(String valueLabel, double width) {
    return SizedBox(
        height: 30.0,
        child: Align(
          alignment: Alignment.center,
          child: Row(
            children: <Widget>[
              Container(
                width: width,
                height: 12.0,
                decoration: BoxDecoration(
                    color: barColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(4.0),
                        bottomRight: Radius.circular(4.0))),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text(valueLabel),
              )
            ],
          ),
        ));
  }

  Widget build(BuildContext context) {
    return _chartContainer(
        height: 280.0,
        title: title,
        subtitle: subtitle,
        chart: Transform.translate(
          offset: Offset(0.0, -8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                // yLabels
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children:
                    yLabels.map((value) => HorizontalBarLabel(value)).toList(),
              ),
              Container(
                // Divider
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(left: 8.0),
                padding: EdgeInsets.only(left: 2.0),
                child: Container(
                  color: Color(0xff4e4965),
                  width: 1.0,
                  height: yLabels.length * 30.0,
                ),
              ),
              Column(
                  // xBars
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: () {
                    final double maxXValue = getLargestValue(x);
                    final List<Widget> horizontalBars = [];

                    x.forEach((value) {
                      horizontalBars.add(HorizontalBarData(
                          formatNumber(value.toInt()),
                          (value / maxXValue) * maxBarWidth));
                    });
                    return horizontalBars;
                  }())
            ],
          ),
        ),
        legend: legend);
  }
}

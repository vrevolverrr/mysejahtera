import 'package:flutter/material.dart';
import 'package:mysj/data/pandemic_data.dart';
import 'package:mysj/widgets/custom_charts.dart';
import 'package:mysj/widgets/statistics_pandemic_update.dart';
import 'package:mysj/widgets/custom_view.dart';

class StatisticsPage extends StatefulWidget {
  final PandemicData data;

  StatisticsPage({required this.data});

  _StatisticsPageState createState() => _StatisticsPageState(data);
}

class _StatisticsPageState extends State<StatisticsPage> {
  final PandemicData pandemicData;
  int tabIndex = 0;

  _StatisticsPageState(this.pandemicData);

  Widget build(BuildContext context) {
    return CustomView(height: 520.0, children: <Widget>[
      Padding(
          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 18.0),
          child: PandemicCases(
            onTabChanged: (index) {
              setState(() {
                tabIndex = index;
              });
            },
          )),
      Container(
        width: double.infinity,
        height: (tabIndex == 0) ? 1050.0 : 660.0,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(35.0)),
        child: Column(
          children: (tabIndex == 0)
              ? <Widget>[
                  Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 50.0),
                      child: CustomLineChart(
                        title: "Weekly Cases",
                        subtitle: "last updated 2 June 19:56",
                        yMax: 10000.0,
                        xLabels: ['29/5', '30/5', '31/5', '1/6', '2/6', '3/6'],
                        xLabelValues: [1, 3, 5, 7, 9, 11],
                        yLabels: ['0', '2k', '4k', '6k', '8k', '10k'],
                        yLabelValues: [0, 2000, 4000, 6000, 8000, 10000],
                        y: [
                          [9020, 6999, 6824, 7105, 7703, 8209],
                          [5527, 5121, 5251, 6083, 5777, 7049],
                          [98, 79, 67, 71, 126, 103]
                        ],
                        yColors: [
                          Color(0xffffb259),
                          Color(0xff4ce079),
                          Color(0xffff5959)
                        ],
                        legend: <Widget>[
                          ChartLegend(Color(0xffffb259), "Affected"),
                          ChartLegend(Color(0xff4ce079), "Recovered"),
                          ChartLegend(Color(0xffff5959), "Death")
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 40.0),
                      child: CustomLineChart(
                        title: "Weekly Trend",
                        subtitle: "last updated 2 June 19:56",
                        yMax: 100000.0,
                        yReservedSize: 32.0,
                        xLabels: ['29/5', '30/5', '31/5', '1/6', '2/6', '3/6'],
                        xLabelValues: [1, 3, 5, 7, 9, 11],
                        yLabels: ['0', '20k', '40k', '60k', '80k', '100k'],
                        yLabelValues: [0, 20000, 40000, 60000, 80000, 100000],
                        y: [
                          [22070, 25665, 29443, 41981, 53442, 37589],
                          [15387, 18794, 24385, 26502, 31966, 30784]
                        ],
                        yColors: [
                          Color(0xffffb259),
                          Color(0xff4ce079),
                          Color(0xffff5959)
                        ],
                        legend: <Widget>[
                          ChartLegend(Color(0xffffb259), "Affected"),
                          ChartLegend(Color(0xff4ce079), "Recovered"),
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 40.0),
                      child: CustomHorizontalBarChart(
                        title: "Cases By State",
                        subtitle: "last updated 2 June 2021 19:56",
                        barColor: Color(0xffff5959),
                        yLabels: [
                          "Selangor",
                          "Sabah",
                          "Kuala Lumpur",
                          "Johor",
                          "Sarawak",
                          "Penang"
                        ],
                        x: [191722, 62816, 60172, 59362, 48620, 29433],
                        legend: <Widget>[
                          Transform.translate(
                            offset: Offset(0.0, -15.0),
                            child: ChartLegend(Color(0xffff5959), "Affected"),
                          )
                        ],
                      )),
                ]
              : [
                  Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 20.0),
                      child: CustomHorizontalBarChart(
                        title: "ASEAN Countries",
                        subtitle: "last updated 2 June 2021 19:56",
                        barColor: Color(0xffff5959),
                        yLabels: [
                          'Indonesia',
                          'Philippines',
                          'Malaysia',
                          'Thailand',
                          'Myanmar',
                          'Singpaore'
                        ],
                        x: [1863031, 1276004, 622086, 179886, 144317, 62210],
                        legend: <Widget>[
                          Transform.translate(
                            offset: Offset(0.0, -15.0),
                            child: ChartLegend(Color(0xffff5959), "Affected"),
                          )
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 40.0),
                      child: CustomHorizontalBarChart(
                        title: "Top Countries",
                        subtitle: "last updated 2 June 2021 19:56",
                        barColor: Color(0xffff5959),
                        yLabels: [
                          'US',
                          'India',
                          'Brazil',
                          'France',
                          'Turkey',
                          'Russia'
                        ],
                        x: [
                          34210782,
                          28909975,
                          16947062,
                          5712753,
                          5287980,
                          5135866
                        ],
                        legend: <Widget>[
                          Transform.translate(
                            offset: Offset(0.0, -15.0),
                            child: ChartLegend(Color(0xffff5959), "Affected"),
                          )
                        ],
                      )),
                ],
        ),
      )
    ]);
  }
}

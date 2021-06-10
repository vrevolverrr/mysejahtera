import 'package:flutter/material.dart';
import 'package:mysj/widgets/custom_icons.dart';
import 'package:mysj/widgets/statistics_tabs_bar.dart';
import 'package:mysj/widgets/statistics_toggle_bar.dart';

class PandemicCases extends StatefulWidget {
  final Function onTabChanged;

  PandemicCases({required this.onTabChanged});

  _PandemicCasesState createState() => _PandemicCasesState(onTabChanged);
}

class _PandemicCasesState extends State<PandemicCases> {
  final Function onTabChanged;

  _PandemicCasesState(this.onTabChanged);

  static var tabIndex = 0;
  static var subtabIndex = 1;
  static var data = [
    [
      ["587,165", "501,898", "2,993", "82,274", "1.07"],
      ["+7,703", "+5,777", "+126", "+1,800", "1.09"],
      ["+7,105", "+6,083", "+71", "+951", "1.07"]
    ],
    [
      ["171,963,225", "154,681,780", "3,577,037", "13,704,408"],
      ["+486,643", "+706,670", "+11,188", "-231,215"],
      ["+447,264", "+682,384", "+9,235", "-264,328"]
    ]
  ];

  Widget casesContainer(
      {required IconData icon,
      required String title,
      required String cases,
      required double titleSize,
      required double caseSize,
      required Color color}) {
    return Container(
      margin: EdgeInsets.only(left: 8.0, right: 8.0),
      height: 110.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 11.0, top: 15.0),
            child: Icon(icon, color: Colors.white),
          ),
          Padding(
            padding: EdgeInsets.only(left: 11.0),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "MazzardH-SemiBold",
                  fontSize: titleSize),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 11.0, bottom: 6.0),
            child: Text(
              cases,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "MazzardH-SemiBold",
                  fontSize: caseSize),
            ),
          )
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ToggleBar(onTabChanged: (index) {
          setState(() {
            tabIndex = index;
            onTabChanged(index);
          });
        }),
        Padding(
          padding: EdgeInsets.only(bottom: 5.0),
          child: DayTabsBar(onTabsChanged: (index) {
            setState(() {
              subtabIndex = index;
            });
          }),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 15.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: casesContainer(
                    icon: CustomIcons.virus,
                    title: "Affected",
                    cases: data[tabIndex][subtabIndex][0],
                    titleSize: 18.0,
                    caseSize: 25.0,
                    color: Color(0xffffb259)),
              ),
              Expanded(
                flex: 1,
                child: casesContainer(
                    icon: CustomIcons.heartbeat,
                    title: "Recovered",
                    cases: data[tabIndex][subtabIndex][1],
                    titleSize: 18.0,
                    caseSize: 25.0,
                    color: Color(0xff4ce079)),
              )
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: casesContainer(
                  icon: CustomIcons.skull_crossbones,
                  title: "Death",
                  cases: data[tabIndex][subtabIndex][2],
                  titleSize: 16.0,
                  caseSize: (tabIndex == 0) ? 20.0 : 25.0,
                  color: Color(0xffff5959)),
            ),
            Expanded(
              flex: 1,
              child: casesContainer(
                  icon: CustomIcons.bed,
                  title: "Active",
                  cases: data[tabIndex][subtabIndex][3],
                  titleSize: 16.0,
                  caseSize: (tabIndex == 0) ? 20.0 : 25.0,
                  color: Color(0xff4cb5ff)),
            ),
            (tabIndex == 0)
                ? Expanded(
                    flex: 1,
                    child: casesContainer(
                        icon: CustomIcons.chart_bar,
                        title: "R Value",
                        cases: data[tabIndex][subtabIndex][4],
                        titleSize: 16.0,
                        caseSize: 20.0,
                        color: Color(0xff9059ff)),
                  )
                : SizedBox(width: 0.0)
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            "last updated 2 June 2021 19:56",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "MazzardH-Medium",
                fontSize: 13.0),
          ),
        )
      ],
    );
  }
}

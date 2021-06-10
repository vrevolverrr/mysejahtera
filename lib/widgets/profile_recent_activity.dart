import 'package:flutter/material.dart';

class RecentActivity extends StatelessWidget {
  // ignore: non_constant_identifier_names
  Widget ListItem(String location, String timestamp, {bool highRisk = false}) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 1.8),
      height: 55.0,
      color: Color(0xfff5f5f5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            width: 290.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Checked-in at $location",
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  timestamp,
                  style: TextStyle(color: Color(0xff8c8c8c), height: 1.3),
                )
              ],
            ),
          ),
          SizedBox(
            width: 40.0,
            child: (highRisk)
                ? Icon(
                    Icons.warning_rounded,
                    color: Colors.red,
                  )
                : SizedBox(),
          )
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300.0,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xffd1d1d1), width: 0.6),
          borderRadius: BorderRadius.circular(4.0)),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListItem("MyTown Shopping Centre", "8 June 2021 @ 8:43 a.m.",
              highRisk: true),
          ListItem("MRT Cochrane Station", "8 June 2021 @ 8:37 a.m.",
              highRisk: true),
          ListItem("MRT Taman Midah Station", "8 June 2021 @ 8:20 a.m."),
          ListItem("7 Eleven Taman Midah", "6 June 2021 @ 12:52 p.m."),
          ListItem("Big Pharmacy", "1 June 2021 @ 10:26 a.m."),
          ListItem("LTK Chicken Rice Shop", "31 May 2021 @ 9:42 a.m."),
        ],
      ),
    );
  }
}

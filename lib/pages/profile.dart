import 'package:flutter/material.dart';
import 'package:mysj/widgets/custom_view.dart';
import 'package:mysj/widgets/profile_profile_card.dart';
import 'package:mysj/widgets/profile_recent_activity.dart';

class ProfilePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return CustomView(height: 200.0, children: <Widget>[
      Padding(
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 18.0),
        child: ProfileCard(
          riskStatus: 0,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 15.0),
        child: Text(
          "last updated 2 June 2021 19:56",
          style: TextStyle(
              color: Color(0xff3b3b3b),
              fontFamily: "MazzardH-Medium",
              fontSize: 13.0),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Recent Activity", style: TextStyle(fontSize: 18.0)),
            Text("view more", style: TextStyle(color: Color(0xff6b6b6b)))
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: RecentActivity(),
      )
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:mysj/widgets/custom_view.dart';
import 'package:mysj/widgets/home_latest_news.dart';
import 'package:mysj/widgets/home_welcome_text.dart';
import 'package:mysj/widgets/home_quick_actions.dart';

class HomePage extends StatelessWidget {
  final void Function() newCasesCallback;
  final List<void Function()> quickActionsCallbacks;

  HomePage(
      {required this.newCasesCallback, required this.quickActionsCallbacks});

  Widget build(BuildContext context) {
    return CustomView(height: 400.0, children: <Widget>[
      WelcomeBox(
          name: "Bryan",
          nearCases: 23,
          newCasesButton: newCasesCallback,
          mcoButton: () {}),
      Padding(
          padding: EdgeInsets.only(top: 25.0),
          child: Container(
            width: double.infinity,
            height: 1700.0,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25.0)),
            child: Column(
              children: <Widget>[
                SizedBox(height: 25.0),
                QuickActions(quickActionsCallbacks),
                SizedBox(height: 20.0),
                LatestNews()
              ],
            ),
          )),
    ]);
  }
}

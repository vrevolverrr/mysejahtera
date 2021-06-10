import 'package:flutter/material.dart';
import 'package:mysj/widgets/custom_view.dart';

class AlertsPage extends StatefulWidget {
  final void Function() callback;

  AlertsPage({required this.callback});

  _AlertsPageState createState() => _AlertsPageState(callback);
}

class _AlertsPageState extends State<AlertsPage> {
  final void Function() callback;

  _AlertsPageState(this.callback);

  late List<Widget> notifications;

  void initState() {
    super.initState();

    notifications = [AlertItem()];
  }

  // ignore: non_constant_identifier_names
  Widget AlertItem() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        width: double.infinity,
        height: 80.0,
        child: ElevatedButton(
          style: ButtonStyle(
              side: MaterialStateProperty.all(
                  BorderSide(color: Colors.grey.withOpacity(0.5), width: 0.8)),
              elevation: MaterialStateProperty.all<double>(0.0),
              backgroundColor: MaterialStateProperty.all(Color(0xfffafafa))),
          onPressed: () {
            callback();
            setState(() {
              notifications.removeAt(0);
            });
          },
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blue),
                      child: Icon(
                        Icons.assignment,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: "Please fill in daily health assesment",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "MazzardH-SemiBold",
                            fontSize: 14.0),
                      ),
                      TextSpan(
                        text: "\n3 June 2021 @ 7:43 a.m.",
                        style: TextStyle(
                            color: Color(0xff757575),
                            fontFamily: "MazzardH-Medium",
                            fontSize: 12.0,
                            height: 1.5),
                      ),
                    ])),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5.0),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return CustomView(height: 110.0, children: <Widget>[
      SizedBox(height: 15.0),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25.0)),
        child: Column(children: <Widget>[
          SizedBox(height: 25.0),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                "Notifications",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Column(
            children: (notifications.length > 0)
                ? notifications
                : [
                    SizedBox(height: 10.0),
                    Text("no new notifications",
                        style: TextStyle(color: Color(0xff757575)))
                  ],
          ),
        ]),
      ),
    ]);
  }
}

import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final int riskStatus;
  final String? vaccine;

  static var riskColors = [Colors.green, Colors.orange, Colors.red];
  static var riskLabels = ["LOW RISK", "SUSPECTED", "HIGH RISK"];

  ProfileCard({required this.riskStatus, this.vaccine});

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(22.0),
      width: double.infinity,
      height: 220.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                blurRadius: 10.0,
                spreadRadius: 1.0,
                offset: Offset(0.0, 3.0),
                color: Color.fromRGBO(0, 0, 0, 0.24))
          ]),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 12.0),
                width: 95.0,
                height: 115.0,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Soong Jun Shen",
                      style: TextStyle(fontSize: 20.0, height: 1.4)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("MySJ ID",
                                style: TextStyle(
                                    color: Color(0xff757575),
                                    fontSize: 11.5,
                                    height: 1.6)),
                            Padding(
                              padding: EdgeInsets.only(top: 3.0),
                              child: Text("60137475869"),
                            ),
                            Text("IC/Passport No.",
                                style: TextStyle(
                                    color: Color(0xff757575),
                                    fontSize: 11.5,
                                    height: 1.8)),
                            Padding(
                              padding: EdgeInsets.only(top: 3.0),
                              child: Text("050804251896"),
                            ),
                          ]),
                      Padding(
                        padding: EdgeInsets.only(left: 28.0, top: 5.0),
                        child: Icon(
                          Icons.qr_code_scanner_rounded,
                          color: Color(0xff303030),
                          size: 40.0,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("Risk Status",
                      style: TextStyle(
                          color: Color(0xff757575),
                          fontSize: 11.5,
                          height: 1.8)),
                  Container(
                    alignment: Alignment.center,
                    width: 110.0,
                    height: 28.0,
                    decoration: BoxDecoration(
                        color: riskColors[riskStatus],
                        borderRadius: BorderRadius.circular(50.0)),
                    child: Transform.translate(
                      offset: Offset(0, 1.0),
                      child: Text(
                        riskLabels[riskStatus],
                        style: TextStyle(color: Colors.white, fontSize: 14.0),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Text("Vaccination Status",
                      style: TextStyle(
                          color: Color(0xff757575),
                          fontSize: 11.5,
                          height: 1.8)),
                  Container(
                    alignment: Alignment.center,
                    width: 150.0,
                    height: 28.0,
                    decoration: BoxDecoration(
                        color: (vaccine == null) ? Colors.grey : Colors.green,
                        borderRadius: BorderRadius.circular(50.0)),
                    child: Transform.translate(
                      offset: Offset(0, 1.0),
                      child: Text(
                        (vaccine == null)
                            ? "UNVACCINATED"
                            : vaccine!.toUpperCase(),
                        style: TextStyle(color: Colors.white, fontSize: 14.0),
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mysj/data/pandemic_data.dart';
import 'package:mysj/pages/alerts.dart';
import 'package:mysj/pages/profile.dart';
import 'package:mysj/pages/questions.dart';
import 'package:mysj/pages/statistics.dart';
import 'package:mysj/pages/home.dart';
import 'package:mysj/data/question_sets.dart';
import 'package:mysj/widgets/bottom_nav_bar_items.dart';
import 'package:flutter/services.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MySejahtera',
      theme: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          primarySwatch: Colors.lightBlue,
          fontFamily: 'MazzardH-SemiBold'),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => AppHome(),
        "/assesment": (context) => QuestionsPage(
              title: "Questions",
              subtitle: "Daily Health Assessment",
              questions: healthAssessmentQuestionSet(),
            )
      },
    );
  }
}

class AppHome extends StatefulWidget {
  AppHome({Key? key}) : super(key: key);

  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  static var pages = <Widget>[];

  static var _currentPageIndex = 0;
  static var pandemicData;

  void initState() {
    super.initState();

    // Hide Android Status Bar and Navigation Bar
    SystemChrome.setEnabledSystemUIOverlays([]);

    // To fetch pandemic data
    pandemicData = PandemicData();

    pages = [
      HomePage(
        newCasesCallback: () {
          setState(() {
            _currentPageIndex = 3;
          });
        },
        quickActionsCallbacks: [
          () {
            Navigator.pushNamed(context, '/assesment');
          },
          () {},
          () {},
          () {}
        ],
      ),
      AlertsPage(
        callback: () {
          Navigator.pushNamed(context, '/assesment');
        },
      ),
      StatisticsPage(data: pandemicData),
      ProfilePage()
    ];
  }

  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: (_currentPageIndex > 2)
            ? pages[_currentPageIndex - 1]
            : pages[_currentPageIndex],
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: BottomNavigationBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            items: bottomNavigationBarItems(),
            currentIndex: _currentPageIndex,
            onTap: (int pageIndex) {
              if (pageIndex == 2) return;
              setState(() {
                _currentPageIndex = pageIndex;
              });
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 4.0,
          child: Icon(
            Icons.qr_code_scanner,
            size: 28.0,
          ),
          backgroundColor: Color(0xff4f8eff),
          foregroundColor: Colors.white,
          onPressed: () => {print("pressed")},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

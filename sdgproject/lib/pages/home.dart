import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pie_chart/pie_chart.dart' as PieChart1;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, double> dataMap = {
    "Utilities": 65,
    "Waste": 49,
    "Food": 33,
    "Spendings": 89,
    "Commute": 10,
    "Holiday": 3
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Welcome, Raghav",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25.0),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(18, 0, 8, 8),
                child: Text(
                  "Here's an overview of your carbon footprint:",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _showPopup(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(alignment: Alignment.center, children: <Widget>[
                    Image.asset(
                      'assets/cloud_simple.png',
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      "496kg",
                      style:
                          TextStyle(color: Colors.grey.shade800, fontSize: 18),
                    ),
                  ]),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "CO₂/month",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 18),
                  ),
                ],
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Monthly carbon emissions by categories:",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            PieChart1.PieChart(
              dataMap: dataMap,
              // colorList: [
              //   Colors.black,
              //   Colors.blue,
              //   Colors.red,
              //   Colors.yellow,
              //   Colors.orange
              // ],
              animationDuration: const Duration(milliseconds: 800),
              chartLegendSpacing: 28,
              chartRadius: MediaQuery.of(context).size.width / 2.5,
              initialAngleInDegree: 0,
              chartType: PieChart1.ChartType.ring,
              ringStrokeWidth: 32,
              centerText: "Carbon Footprint",
              legendOptions: const PieChart1.LegendOptions(
                showLegendsInRow: true,
                legendPosition: PieChart1.LegendPosition.bottom,
                showLegends: true,
                legendShape: BoxShape.circle,
                legendTextStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              chartValuesOptions: const PieChart1.ChartValuesOptions(
                showChartValueBackground: true,
                showChartValues: true,
                showChartValuesInPercentage: true,
                showChartValuesOutside: true,
                decimalPlaces: 1,
              ),
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 8, 8),
                child: Text(
                  "Sustainable Suggestions",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return PopupDialog();
    },
  );
}

class PopupDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            Text(
              'Statistics',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            // Bar Chart
            Container(
              height: 200.0,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 6,
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.blueGrey,
                    ),
                    handleBuiltInTouches: true,
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border:
                        Border.all(color: const Color(0xff37434d), width: 1),
                  ),
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(
                          toY: 3,
                          color: Colors.blue,
                        )
                      ],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [BarChartRodData(toY: 2, color: Colors.green)],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [BarChartRodData(toY: 5, color: Colors.orange)],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

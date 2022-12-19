import 'package:donutpiechart/donutpiechart/donut_pie_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        title: const Text("DonutPieChart",
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,

        ),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [

          Center(
            child: DashboardDonutPieChart(
                total: 100,
                isDashboard: true,
                completed: 90,
                backgroundColor: Colors.yellow,
                barColor: Colors.red,
                fillColor: Colors.yellow,
                textColor: Colors.blue),
          )
        ],

      ),

    );
  }
}

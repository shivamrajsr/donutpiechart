import 'dart:math' as math;
import 'package:flutter/material.dart';

class DashboardDonutPieChart extends StatefulWidget {
  final bool isDashboard;
  final int total;
  final int completed;
  final Color backgroundColor;
  final Color barColor;
  final Color fillColor;
  final Color textColor;
  final bool showFraction;
  const DashboardDonutPieChart({
    Key? key,
    required this.total,
    required this.isDashboard,
    required this.completed,
    required this.backgroundColor,
    required this.barColor,
    required this.fillColor,
    required this.textColor,
    this.showFraction = true,
  }) : super(key: key);

  @override
  State<DashboardDonutPieChart> createState() => _DashboardDonutPieChartState();
}

class _DashboardDonutPieChartState extends State<DashboardDonutPieChart> {
  var list = [];

  @override
  void initState() {
    start();
    super.initState();
  }

  void start() async {
    list = [];
    var percentage = widget.completed * 100 ~/ widget.total;
    for (int i = 0; i < percentage; i++) {
      list.add(
        Transform.rotate(
          angle: (((i + 1) * 3.6) * math.pi / 180),
          child: Container(
            height: 200.0,
            width: 200.0,
            alignment: Alignment.topCenter,
            child: Container(
              height: 120.0,
              width: 6.14,
              color:(widget.completed==0)?Colors.green: widget.barColor,
            ),
          ),
        ),
      );
      await Future.delayed(Duration(milliseconds: 1000 ~/ percentage));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      width: 200.0,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 180.0,
            width: 180.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100.0),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 4.0, color: Colors.black.withOpacity(0.3))
                ]),
          ),
          ...list,
          Container(
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  borderRadius: BorderRadius.circular(120.0),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4.0, color: Colors.black.withOpacity(0.3))
                  ]),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    start();
                  },
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '₹ ${widget.completed}',
                          style: TextStyle(
                              color: widget.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                        Text(
                          'From ₹ ${widget.total}',
                          style: const TextStyle(
                              color: Colors.black,
                              // fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                        const Text(
                          'Amount Left',
                          style: TextStyle(
                              color: Colors.grey,
                              // fontWeight: FontWeight.bold,
                              fontSize: 14.0),
                        ),
                      ]),
                ),
              ))
        ],
      ),
    );
  }
}

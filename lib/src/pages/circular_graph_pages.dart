import 'package:animations/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class CircularGraphPage extends StatefulWidget {
  const CircularGraphPage({Key? key}) : super(key: key);

  @override
  _CircularGraphPageState createState() => _CircularGraphPageState();
}

class _CircularGraphPageState extends State<CircularGraphPage> {
  double percentage = 0.10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            percentage += 0.10;
            if (percentage >= 1) {
              percentage = 0;
            }
          });
        },
        child: Icon(Icons.upload),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "${(percentage * 100).round()}%",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 64, fontWeight: FontWeight.w800),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomRadial(
                    percentage: percentage,
                    color: Colors.amber,
                    gradient: new LinearGradient(colors: [
                      Color(0xFF6AED42),
                      Color(0xFF36B2B6),
                      Color(0xFF111FC0),
                    ], stops: [
                      .25,
                      .65,
                      1
                    ]),
                  ),
                  CustomRadial(
                    percentage: percentage,
                    color: Colors.green,
                    gradient: new RadialGradient(colors: [
                      Color(0xFFC12A2A),
                      Color(0xFF0D00FF),
                      Color(0xFFE1710F),
                    ],stops: [
                      .25,
                      .5,
                      .1
                    ]),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomRadial(
                    percentage: percentage,
                    color: Colors.redAccent,
                  ),
                  CustomRadial(
                    percentage: percentage,
                    color: Colors.amber,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomRadial(percentage: percentage, color: Colors.green),
                  CustomRadial(
                    percentage: percentage,
                    color: Colors.purpleAccent,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomRadial extends StatelessWidget {
  const CustomRadial({
    required this.color,
    required this.percentage,
    this.gradient,
  });

  final double percentage;
  final Color color;
  final Gradient? gradient;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      child: RadialProgess(
        percentage: percentage,
        color: color,
        strokeWidth: 10,
        percentageWidth: 9,
        gradient: this.gradient,
      ),
    );
  }
}

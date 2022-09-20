import 'package:flutter/material.dart';

class ChartBarElement extends StatelessWidget {
  final double totalPerDay;
  final double percentage;
  final String dayLabel;
  ChartBarElement({this.totalPerDay, this.percentage, this.dayLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          child: FittedBox(
            child: Text('\$${totalPerDay.toStringAsFixed(0)}'),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 70,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 222, 222, 222),
                    borderRadius: BorderRadius.circular(5)),
              ),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(5)),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(dayLabel)
      ],
    );
  }
}

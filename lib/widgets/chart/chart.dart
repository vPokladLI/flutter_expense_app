import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/transaction.dart';

import './chartBarElement.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);

  List<Map<String, Object>> get _groupedTransactions {
    return List.generate(7, (index) {
      final weakDay = DateTime.now().subtract(Duration(days: index));
      var totalSumm = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weakDay.day &&
            recentTransactions[i].date.month == weakDay.month &&
            recentTransactions[i].date.year == weakDay.year) {
          totalSumm += recentTransactions[i].value;
        }
      }
      return {
        'day': DateFormat.E().format(weakDay).substring(0, 1),
        'amount': totalSumm
      };
    });
  }

  double get _maxSpend {
    return _groupedTransactions.fold(
        0.0, (sum, element) => sum + (element['amount'] as double));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          ..._groupedTransactions.map((e) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBarElement(
                dayLabel: e['day'],
                percentage: _maxSpend == 0.0
                    ? 0.0
                    : (e['amount'] as double) / _maxSpend,
                totalPerDay: e['amount'],
              ),
            );
          }).toList()
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_expense_app/transaction.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final Transaction tx;
  const TransactionCard(this.tx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
                border: Border.all(width: 3, color: Colors.purple)),
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Text(
              '\$${tx.value}',
              style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  tx.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  DateFormat.yMMMd().format(tx.date),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
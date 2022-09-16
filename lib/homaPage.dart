import 'package:flutter/material.dart';

import './transaction.dart';
import './ui//transactionCard.dart';
import './ui/addTransactionForm.dart';

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(title: 'Jeens', value: 10.00, date: DateTime.now()),
    Transaction(title: 'Jeens', value: 15.50, date: DateTime.now()),
    Transaction(title: 'Tshort', value: 27.10, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              elevation: 5,
              child: Text('Chart'),
            ),
          ),
          Column(
              children: transactions
                  .map(
                    (e) => TransactionCard(e),
                  )
                  .toList()),
          AdTransactionForm(),
        ],
      ),
    );
  }
}

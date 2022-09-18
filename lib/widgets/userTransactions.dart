import 'package:flutter/material.dart';

import '../ui/addTransactionForm.dart';
import '../ui/transactionCard.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  UserTransaction({Key key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(title: 'Jeens', value: 10.00, date: DateTime.now()),
    Transaction(title: 'Jeens', value: 15.50, date: DateTime.now()),
    Transaction(title: 'Tshort', value: 27.10, date: DateTime.now()),
  ];
  void _addTransaction(String title, String value) {
    setState(() {
      _userTransactions.add(Transaction(
          title: title, value: double.parse(value), date: DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AdTransactionForm(onSubmit: _addTransaction),
        Container(
          height: 400,
          child: SingleChildScrollView(
            child: Column(
              children: _userTransactions
                  .map(
                    (e) => TransactionCard(e),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

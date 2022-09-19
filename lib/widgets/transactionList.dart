import 'package:flutter/material.dart';
import '../models/transaction.dart';

import '../ui/transactionCard.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({
    Key key,
    @required this.userTransactions,
  }) : super(key: key);

  final List<Transaction> userTransactions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      child: ListView.builder(
        itemCount: userTransactions.length,
        itemBuilder: (context, index) {
          return TransactionCard(userTransactions[index]);
        },
      ),
    );
  }
}

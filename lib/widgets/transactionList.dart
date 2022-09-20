import 'package:flutter/material.dart';
import '../models/transaction.dart';

import '../ui/transActionTile.dart';

class TransactionsList extends StatelessWidget {
  final Function deleteTransaction;
  const TransactionsList(
      {Key key,
      @required this.userTransactions,
      @required this.deleteTransaction})
      : super(key: key);

  final List<Transaction> userTransactions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      child: ListView.builder(
        itemCount: userTransactions.length,
        itemBuilder: (context, index) {
          return TransactionTile(
            tx: userTransactions[index],
            deleteTransaction: deleteTransaction,
          );
        },
      ),
    );
  }
}

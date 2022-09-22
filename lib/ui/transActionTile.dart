import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionTile extends StatelessWidget {
  final Transaction tx;
  final Function deleteTransaction;
  const TransactionTile({this.tx, @required this.deleteTransaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
                child: Text(
              '\$${tx.value.toStringAsFixed(2)}',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            )),
          ),
        ),
        title: Text(
          tx.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(tx.date),
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        trailing: MediaQuery.of(context).size.width > 420
            ? TextButton.icon(
                label: Text('Delete transaction'),
                onPressed: () => {deleteTransaction(tx.id)},
                icon: Icon(Icons.delete))
            : IconButton(
                onPressed: () => {deleteTransaction(tx.id)},
                icon: Icon(Icons.delete)),
      ),
    );
  }
}

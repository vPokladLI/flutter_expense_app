import 'package:flutter/material.dart';

import './models/transaction.dart';

import './widgets/addTransactionForm.dart';
import './widgets/transactionList.dart';
import 'widgets/chart/chart.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> userTransactions = [];
  List<Transaction> get _recentTransactions {
    return userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void addTransaction(String title, double value) {
    setState(() {
      userTransactions
          .add(Transaction(title: title, value: value, date: DateTime.now()));
    });
  }

  void _startAddNewTransaction(ctx) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return AddTransactionForm(onSubmit: addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => _startAddNewTransaction(context),
              icon: Icon(Icons.add))
        ],
        title: Text(
          'My expense',
        ),
      ),
      body: SingleChildScrollView(
        child: userTransactions.length > 0
            ? Column(
                children: [
                  Chart(_recentTransactions),
                  TransactionsList(userTransactions: userTransactions)
                ],
              )
            : Container(
                width: double.infinity,
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('No items added yet!',
                        style: Theme.of(context).textTheme.titleLarge),
                    Container(
                      height: 200,
                      margin: EdgeInsets.only(top: 50),
                      child: Image.asset(
                        'assets/images/no_items.png',
                        fit: BoxFit.contain,
                      ),
                    )
                  ],
                ),
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context)),
    );
  }
}

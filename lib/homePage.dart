import 'dart:ffi';

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

  bool _isShowChartbar = false;

  void addTransaction(String title, double value, DateTime date) {
    date = date == null ? DateTime.now() : date;
    setState(() {
      userTransactions.add(Transaction(title: title, value: value, date: date));
    });
  }

  void deleteTransaction(String txID) {
    setState(() {
      userTransactions.removeWhere((element) => element.id == txID);
    });
  }

  void _startAddNewTransaction(ctx) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return AddTransactionForm(onSubmit: addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appBar = AppBar(
      actions: [
        IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: Icon(Icons.add))
      ],
      title: Text(
        'My expense',
      ),
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: userTransactions.length > 0
            ? Column(
                children: [
                  if (!isLandscape)
                    Container(
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height -
                                MediaQuery.of(context).padding.top) *
                            0.25,
                        child: Chart(_recentTransactions)),
                  if (!isLandscape)
                    Container(
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.75,
                      child: TransactionsList(
                        userTransactions: userTransactions,
                        deleteTransaction: deleteTransaction,
                      ),
                    ),
                  if (isLandscape)
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text('Show chartbar?'),
                      Switch(
                        value: _isShowChartbar,
                        onChanged: (val) {
                          setState(() {
                            _isShowChartbar = val;
                          });
                        },
                      ),
                    ]),
                  _isShowChartbar
                      ? Container(
                          height: (MediaQuery.of(context).size.height -
                                  appBar.preferredSize.height -
                                  MediaQuery.of(context).padding.top) *
                              0.7,
                          child: Chart(_recentTransactions))
                      : Container(
                          height: (MediaQuery.of(context).size.height -
                                  appBar.preferredSize.height -
                                  MediaQuery.of(context).padding.top) *
                              0.8,
                          child: TransactionsList(
                            userTransactions: userTransactions,
                            deleteTransaction: deleteTransaction,
                          ),
                        )
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

import 'package:flutter/material.dart';

import './models/transaction.dart';

import './ui/addTransactionForm.dart';
import './ui/transactionCard.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> userTransactions = [
    Transaction(title: 'Jeens', value: 10.00, date: DateTime.now()),
    Transaction(title: 'Jeens', value: 15.50, date: DateTime.now()),
    Transaction(title: 'Tshort', value: 27.10, date: DateTime.now()),
  ];
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
        title: Text('My expense'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Card(
                elevation: 5,
                child: Text('Chart'),
              ),
            ),
            Container(
              height: 550,
              child: ListView.builder(
                itemCount: userTransactions.length,
                itemBuilder: (context, index) {
                  return TransactionCard(userTransactions[index]);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context)),
    );
  }
}

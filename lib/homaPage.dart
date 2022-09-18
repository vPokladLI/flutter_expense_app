import 'package:flutter/material.dart';
import '../widgets/userTransactions.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                elevation: 5,
                child: Text('Chart'),
              ),
            ),
            UserTransaction(),
          ],
        ),
      ),
    );
  }
}

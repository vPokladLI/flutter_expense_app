import 'package:flutter/material.dart';

import 'homaPage.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense app',
      home: MyHomePage(),
    );
  }
}

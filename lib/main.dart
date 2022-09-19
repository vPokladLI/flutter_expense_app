import 'package:flutter/material.dart';

import 'homePage.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense app',
      home: MyHomePage(),
      theme: ThemeData(
        colorScheme:
            ColorScheme.light(primary: Color.fromARGB(255, 221, 0, 255)),
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w700,
              fontSize: 20),
        ),
      ),
    );
  }
}

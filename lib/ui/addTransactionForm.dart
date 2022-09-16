import 'package:flutter/material.dart';

class AdTransactionForm extends StatelessWidget {
  const AdTransactionForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  overlayColor: MaterialStatePropertyAll(Colors.purple[100]),
                  foregroundColor: MaterialStatePropertyAll(Colors.purple)),
              child: Text('Add transaction'),
            )
          ],
        ),
      ),
    );
  }
}

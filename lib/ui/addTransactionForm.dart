import 'package:flutter/material.dart';

class AdTransactionForm extends StatelessWidget {
  final Function onSubmit;
  AdTransactionForm({Key key, this.onSubmit}) : super(key: key);
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  void onsubmitHandler() {
    onSubmit(titleController.text, amountController.text);
    titleController.text = '';
    amountController.text = '';
    FocusManager.instance.primaryFocus?.unfocus();
  }

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
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: amountController,
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            TextButton(
              onPressed: onsubmitHandler,
              style: ButtonStyle(
                  overlayColor: MaterialStatePropertyAll(Colors.purple[100]),
                  foregroundColor: MaterialStatePropertyAll(Colors.purple)),
              child: Text('Add transaction'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AddTransactionForm extends StatefulWidget {
  final Function onSubmit;
  AddTransactionForm({Key key, this.onSubmit}) : super(key: key);

  @override
  State<AddTransactionForm> createState() => _AddTransactionFormState();
}

class _AddTransactionFormState extends State<AddTransactionForm> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void onsubmitHandler() {
    String title = titleController.text;
    double value = double.parse(amountController.text);
    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value);
    titleController.text = '';
    amountController.text = '';
    // FocusManager.instance.primaryFocus?.unfocus();
    Navigator.of(context).pop();
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
              onEditingComplete: onsubmitHandler,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              onEditingComplete: onsubmitHandler,
            ),
            TextButton(
              onPressed: onsubmitHandler,
              child: Text('Add transaction'),
            ),
          ],
        ),
      ),
    );
  }
}

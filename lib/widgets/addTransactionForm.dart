import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransactionForm extends StatefulWidget {
  final Function onSubmit;
  AddTransactionForm({Key key, this.onSubmit}) : super(key: key);

  @override
  State<AddTransactionForm> createState() => _AddTransactionFormState();
}

class _AddTransactionFormState extends State<AddTransactionForm> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((date) {
      if (date == null) {
        return;
      }
      setState(() {
        _selectedDate = date;
      });
    });
  }

  void onsubmitHandler() {
    String title = titleController.text;
    double value = double.parse(amountController.text);
    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value, _selectedDate);
    titleController.text = '';
    amountController.text = '';
    // FocusManager.instance.primaryFocus?.unfocus();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15,
              bottom: MediaQuery.of(context).viewInsets.bottom + 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              Container(
                height: 50,
                child: Row(
                  children: [
                    Text(
                      DateFormat.yMd().format(_selectedDate),
                      style: TextStyle(color: Colors.grey[500], fontSize: 20),
                    ),
                    IconButton(
                        padding: EdgeInsets.all(10),
                        iconSize: 30,
                        onPressed: _presentDatePicker,
                        color: Theme.of(context).primaryColor,
                        icon: Icon(Icons.calendar_month))
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: onsubmitHandler,
                child: Text('Add transaction'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

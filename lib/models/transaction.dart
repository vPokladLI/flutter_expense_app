import 'package:flutter/foundation.dart';
import 'package:xid/xid.dart';

class Transaction {
  final String id = Xid().toString();
  final String title;
  final double value;
  final DateTime date;
  Transaction(
      {@required this.title, @required this.value, @required this.date}) {}
}

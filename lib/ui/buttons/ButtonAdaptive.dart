import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ButtonAdaptive extends StatelessWidget {
  final String text;
  final Function pressHandler;
  const ButtonAdaptive({Key key, this.text, this.pressHandler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(child: Text(text), onPressed: pressHandler)
        : ElevatedButton(onPressed: pressHandler, child: Text(text));
  }
}

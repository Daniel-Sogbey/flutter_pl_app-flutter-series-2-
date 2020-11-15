import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



class AdaptiveFlatButton extends StatelessWidget {
  final String chooseDate;
  final Function datePicker;

  AdaptiveFlatButton({this.chooseDate, this.datePicker});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
      child: Text(
        chooseDate,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
      onPressed: datePicker,
    )
        : FlatButton(
      textColor: Theme.of(context).primaryColor,
      onPressed: datePicker,
      child: Text(
        "Choose Date",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
    );
  }
}

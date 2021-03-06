import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String text;
  final VoidCallback handler;

  const AdaptiveFlatButton(this.text, this.handler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: handler)
        : FlatButton(
            textColor: Theme.of(context).primaryColor,
            onPressed: handler,
            child: const Text(
              'Choose Date',
              style: TextStyle(fontWeight: FontWeight.bold),
            ));
  }
}

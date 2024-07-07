import 'package:flutter/material.dart';

void underDevelopment(BuildContext context) {
  const snackBar = SnackBar(
    content: Text('Under development'),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

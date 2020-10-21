import 'package:flutter/material.dart';
import 'package:simple_transfer_app/screens/transfer_list.dart';

void main() => runApp(SimpleTransferApp());

class SimpleTransferApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Scaffold(
        body: TransferList(),
      ),
    );
  }
}

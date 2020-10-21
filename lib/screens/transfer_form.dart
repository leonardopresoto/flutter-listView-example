import 'package:flutter/material.dart';
import 'package:simple_transfer_app/components/editor.dart';
import 'package:simple_transfer_app/models/transfer.dart';

class TransferForm extends StatelessWidget {
  final TextEditingController _controllerValue = TextEditingController();
  final TextEditingController _controllerAccount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Creating a transfer ...'),
      ),
      body: Builder(
        builder: (context) => Column(
          children: [
            Editor(
              controller: _controllerAccount,
              label: 'Account Number',
              hint: '0000',
            ),
            Editor(
              controller: _controllerValue,
              label: 'Value',
              hint: '0.00',
              iconData: Icons.monetization_on,
            ),
            RaisedButton(
              elevation: 10,
              onPressed: () => _createTransfer(context),
              child: Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    if (int.tryParse(_controllerAccount.text) != null &&
        double.tryParse(_controllerValue.text) != null) {
      Navigator.pop(
          context,
          Transfer(int.parse(_controllerAccount.text),
              double.parse(_controllerValue.text)));
    } else {
      _controllerAccount.text = '';
      _controllerValue.text = '';
      Scaffold.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color(0xFF880000),
          content: Text('Please make sure all fields are filled in correctly'),
        ),
      );
    }
  }
}

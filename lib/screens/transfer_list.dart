import 'package:flutter/material.dart';
import 'package:simple_transfer_app/models/transfer.dart';
import 'package:simple_transfer_app/screens/transfer_form.dart';

class TransferList extends StatefulWidget {
  final List<Transfer> _list = List();

  @override
  State<StatefulWidget> createState() {
    return TransferListState();
  }
}

class TransferListState extends State<TransferList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfers'),
      ),
      body: ListView.builder(
        itemCount: widget._list.length,
        itemBuilder: (context, index) {
          final transfer = widget._list[index];
          return TransferItem(transfer);
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TransferForm();
            })).then((newTransfer) {
              setState(() {
                if (newTransfer != null) {
                  widget._list.add(newTransfer);
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 1),
                      elevation: 10,
                      backgroundColor: Color(0xFF008800),
                      content:
                      Text('You have successfully created a transfer.'),
                    ),
                  );
                }
              });
            });
          },
        ),
      ),
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(_transfer.value.toString()),
          subtitle: Text(_transfer.account.toString()),
        ));
  }
}

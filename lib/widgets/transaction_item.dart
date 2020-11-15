import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final Function deleteTransactionHandler;

  TransactionItem({this.transaction, this.deleteTransactionHandler});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 35.0,
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: FittedBox(
              child: Text(
                '\$${transaction.amount}',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
        ),
        title: Text(
          '${transaction.title}',
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMMd().format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                onPressed: () => deleteTransactionHandler(transaction.id),
                icon: Icon(
                  Icons.delete,
                ),
                label: Text('Delete'),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                splashColor: Theme.of(context).primaryColor,
                onPressed: () => deleteTransactionHandler(transaction.id),
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
              ),
      ),
    );
  }
}

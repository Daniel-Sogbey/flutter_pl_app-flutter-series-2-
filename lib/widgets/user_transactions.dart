import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../widgets/new_transaction.dart';
import '../widgets/transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [];

  void _addNewTransaction(String title, double amount) {
    // print(title);
    // print(amount.toStringAsFixed(2));
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //-----------------INPUT AREA---------------------
        NewTransaction(
          addNewTransaction: _addNewTransaction,
        ),
        //-------------------------------TRANSACTIONS------------
        TransactionList(
          transactions: _userTransactions,
        ),
      ],
    );
  }
}

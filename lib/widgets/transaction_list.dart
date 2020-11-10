import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({this.transactions});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      height: 300,
      child: transactions.length == 0
          ? Column(
              children: <Widget>[
                Text(
                  'No Transactions Added Yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 50.0,
                ),
                Container(
                  height: 200.0,
                  child: Image.asset(
                    'images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
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
                            '\$${transactions[index].amount}',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      '${transactions[index].title}',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMMd().format(transactions[index].date),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}

// Card(
// child: Row(
// children: <Widget>[
// Container(
// margin: EdgeInsets.symmetric(
// vertical: 10.0,
// horizontal: 15,
// ),
// padding: EdgeInsets.all(10.0),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(
// 5.0,
// ),
// border: Border.all(
// width: 2.0,
// color: Theme.of(context).primaryColor,
// ),
// ),
// child: Text(
// '\$${transactions[index].amount.toStringAsFixed(2)}',
// style: TextStyle(
// fontSize: 20.0,
// color: Theme.of(context).primaryColor,
// fontWeight: FontWeight.bold,
// ),
// ),
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: <Widget>[
// Container(
// margin: EdgeInsets.symmetric(vertical: 5.0),
// child: Text(
// transactions[index].title,
// style: Theme.of(context).textTheme.headline6,
// ),
// ),
// Container(
// margin: EdgeInsets.symmetric(vertical: 5.0),
// child: Text(
// new DateFormat.yMMMMd()
// .format(transactions[index].date),
// style: TextStyle(
// color: Colors.grey,
// fontSize: 16.0,
// ),
// ),
// ),
// ],
// )
// ],
// ),
// );

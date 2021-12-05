import 'package:flutter/material.dart';
import 'package:flutter_planning/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        title: Text(
          transaction.title,
        ),
        subtitle: Text(DateFormat.yMMMd().format(transaction.date)),
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(child: Text('\$${transaction.amount}')),
          ),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                onPressed: () => deleteTx(transaction.id),
                icon: const Icon(Icons.delete),
                label: const Text('Delete'),
                color: Theme.of(context).errorColor,
              )
            : IconButton(
                onPressed: () => deleteTx(transaction.id),
                icon: const Icon(
                  Icons.delete,
                ),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}

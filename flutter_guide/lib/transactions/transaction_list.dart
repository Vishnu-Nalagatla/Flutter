import 'package:flutter/material.dart';
import './transaction_item.dart';
import './transactions.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    Key? key,
    required this.tx,
    required this.deleteTransaction,
  }) : super(key: key);

  final List<Transaction> tx;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        itemCount: tx.length,
        itemBuilder: (ctx, index) {
          return TransactionItem(
            tx: tx[index],
            deleteTransaction: deleteTransaction,
          );
        },
      ),
    );
  }
}

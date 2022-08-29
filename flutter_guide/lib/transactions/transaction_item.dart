import 'package:flutter/material.dart';
import './transactions.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final Transaction tx;
  final Function deleteTransaction;

  const TransactionItem({
    Key? key,
    required this.tx,
    required this.deleteTransaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: FittedBox(
                  child: Text(
                    "\$ ${tx.amount}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          // Container(
          //   margin: const EdgeInsets.all(10),
          //   padding: const EdgeInsets.all(10),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(200),
          //     border: Border.all(
          //       width: 2,
          //       color: Theme.of(context).primaryColor,
          //     ),
          //   ),
          //   child: FittedBox(
          //     child: Text(
          //       "\$ ${tx.amount}",
          //       style: TextStyle(
          //           color: Theme.of(context).primaryColor,
          //           fontSize: 20,
          //           fontWeight: FontWeight.bold),
          //     ),
          //   ),
          // ),
          // ListTile(
          //   leading: CircleAvatar(
          //     child: Text(
          //       "\$ ${tx.amount}",
          //       style: TextStyle(
          //           color: Theme.of(context).primaryColor,
          //           fontSize: 20,
          //           fontWeight: FontWeight.bold),
          //     ),
          //   ),
          // ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tx.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  DateFormat().format(tx.date),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () => deleteTransaction(tx.id),
              icon: const Icon(Icons.delete, color: Colors.red))
        ],
      ),
    );
  }
}

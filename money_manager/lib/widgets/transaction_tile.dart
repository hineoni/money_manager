import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionTile extends StatelessWidget {
  final Transaction transaction;

  const TransactionTile({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(transaction.amount.toString()),
      subtitle: Text(transaction.date.toIso8601String()),
      trailing: Icon(
        transaction.isIncome ? Icons.add : Icons.remove,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../services/transaction_service.dart';

class TransactionsViewModel extends ChangeNotifier {
  final TransactionService _service;

  TransactionsViewModel(this._service);

  List<Transaction> get transactions => _service.getAll();

  void addTransaction(Transaction transaction) {
    _service.add(transaction);
    notifyListeners();
  }

  void deleteTransaction(String id) {
    _service.delete(id);
    notifyListeners();
  }

  double get totalExpense {
    return transactions
        .where((t) => !t.isIncome)
        .fold(0.0, (sum, t) => sum + t.amount);
  }
}

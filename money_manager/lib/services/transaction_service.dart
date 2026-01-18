import '../models/transaction.dart';

class TransactionService {
  final List<Transaction> _transactions = [];

  List<Transaction> getAll() => _transactions;

  void add(Transaction transaction) {
    _transactions.add(transaction);
  }

  void delete(String id) {
    _transactions.removeWhere((t) => t.id == id);
  }
}

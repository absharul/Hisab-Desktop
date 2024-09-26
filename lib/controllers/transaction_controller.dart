import 'package:hisab/database/app_database.dart';
import 'package:hisab/main.dart';
import 'base_controller.dart';

class TransactionController
    extends BaseController<Transaction, TransactionsCompanion> {
  TransactionController();

  @override
  Future<int> create(TransactionsCompanion model) async {
    return await database.insertTransaction(model);
  }

  @override
  Future<Transaction> read(int id) async {
    return await database.getTransaction(id);
  }

  @override
  Future<List<Transaction>> readAll() async {
    return await database.getAllTransactions();
  }

  @override
  Future<bool> update(Transaction model) async {
    return await database.updateTransaction(model);
  }

  @override
  Future<int> delete(Transaction model) async {
    return await database.deleteTransaction(model);
  }

  @override
  Stream<List<Transaction>> watchAll() {
    return database.watchAllTransactions();
  }
}

final transactionController = TransactionController();

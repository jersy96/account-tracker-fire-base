import 'package:flutter_application_3/data/models/transaction.dart';
import 'package:equatable/equatable.dart';

class Account extends Equatable {
  String? id;
  String name;
  double? balance;
  final List<Transaction> transactions;

  Account({
    this.id,
    required this.name,
    required this.balance,
  }) : transactions = [];

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      id: map['id'],
      name: map['name'],
      balance: map['balance'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'balance': balance,
    };
  }

  void addTransaction(Transaction transaction) {
    transactions.add(transaction);
  }

  void updateTransaction(Transaction transaction) {
    final index = transactions.indexWhere((t) => t.id == transaction.id);
    if (index != -1) {
      transactions[index] = transaction;
    }
  }

  void removeTransaction(Transaction transaction) {
    transactions.removeWhere((t) => t.id == transaction.id);
  }

  @override
  List<Object?> get props => [id];
}

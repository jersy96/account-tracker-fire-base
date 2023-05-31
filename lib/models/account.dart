import 'package:flutter_application_3/models/transaction.dart';
import 'package:equatable/equatable.dart';

class Account extends Equatable {
  String? id;
  String name;
  double? balance;
  List<Transaction> transactions;

  Account({
    this.id,
    required this.name,
    required this.balance,
    this.transactions = const [],
  });

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      id: map['id'],
      name: map['name'],
      balance: map['balance'],
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'name': name,
      'balance': balance,
    };
    return map;
  }

  void removeTransaction(Transaction transaction) {
    transactions.remove(transaction);
  }

  @override
  List<Object?> get props => [id];
}

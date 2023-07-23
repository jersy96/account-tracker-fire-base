import 'package:equatable/equatable.dart';

enum TransactionType {
  income,
  expense,
}

class Transaction extends Equatable {
  String? id;
  final TransactionType type;
  final double value;
  final String description;

  Transaction({
    this.id,
    required this.type,
    required this.value,
    required this.description,
  });

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'],
      type: map['type'],
      value: map['value'],
      description: map['description'],
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'type': type,
      'value': value,
      'description': description,
    };
    return map;
  }

  @override
  List<Object?> get props => [id];
}

class Account {
  String? id;
  String name;
  double? balance;

  Account({this.id, required this.name, required this.balance});

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
}

class Account {
  String? balance;
  String name;

  Account({required this.name, required this.balance});

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      name: map['name'],
      balance: map['balance'],
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name': name,
      'balance': balance,
    };
    return map;
  }
}

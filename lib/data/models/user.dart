class User {
  String? id;
  String name;
  String email;
  // String phoneNumber;

  User({
    this.id,
    required this.name,
    required this.email,
    // required this.phoneNumber,
  });

  static User fromMap(Map<String, dynamic> userData) {
    return User(
      id: userData['id'].toString(),
      name: userData['fullname'],
      // phoneNumber: userData['phone'],
      email: userData['email'],
    ); //.cast<Uint8List>());
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullname': name,
      // 'phone': phoneNumber,
      'email': email,
    };
  }
}

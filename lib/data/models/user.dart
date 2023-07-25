// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  String? id;
  String name;
  String email;
  String phoneNumber;
  String password;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  static User fromMap(Map<String, dynamic> userData) {
    return User(
        id: userData['id'].toString(),
        name: userData['fullname'],
        phoneNumber: userData['phoneNmber'],
        email: userData['email'],
        password: userData['password']); //.cast<Uint8List>());
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullname': name,
      'phone': phoneNumber,
      'email': email,
      'password': password,
    };
  }
}

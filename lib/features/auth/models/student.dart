import 'dart:convert';

class Student {
  final String id;
  final String fullName;
  final String password;
  final String phoneNumber;
  final String gender;
  final String address;

  Student({
    required this.id,
    required this.fullName,
    required this.password,
    required this.phoneNumber,
    required this.gender,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'password': password,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'address': address,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] ?? '',
      fullName: map['fullName'] ?? '',
      password: map['password'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      gender: map['gender'] ?? '',
      address: map['address'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) =>
      Student.fromMap(json.decode(source));
}

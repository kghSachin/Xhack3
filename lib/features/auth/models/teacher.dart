import 'dart:convert';

class Teacher {
  final String id;
  final String fullName;
  final String password;
  final String phoneNumber;
  final String gender;
  final String subject;
  final String address;
  final bool? isVerified;

  Teacher({
    required this.id,
    required this.fullName,
    required this.password,
    required this.phoneNumber,
    required this.gender,
    required this.subject,
    required this.address,
    this.isVerified = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'password': password,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'subject': subject,
      'address': address,
      'isVerified': isVerified,
    };
  }

  factory Teacher.fromMap(Map<String, dynamic> map) {
    return Teacher(
      id: map['id'] ?? '',
      fullName: map['fullName'] ?? '',
      password: map['password'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      gender: map['gender'] ?? '',
      subject: map['subject'] ?? '',
      address: map['address'] ?? '',
      isVerified: map['isVerified'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Teacher.fromJson(String source) =>
      Teacher.fromMap(json.decode(source));
}

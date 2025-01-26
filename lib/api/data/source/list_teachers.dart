import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TeacherModel {
  String? teacherName;
  String? teacherEmail;
  String? teacherPhone;
  String? teacherAddress;
  String? teacherBio;
  LatLng? location;
  int? rating;

  TeacherModel({
    this.teacherName,
    this.teacherEmail,
    this.teacherPhone,
    this.teacherAddress,
    this.teacherBio,
    this.location,
    this.rating,
  });

  TeacherModel copyWith({
    String? teacherName,
    String? teacherEmail,
    String? teacherPhone,
    String? teacherAddress,
    String? teacherBio,
    LatLng? location,
    int? rating,
  }) {
    return TeacherModel(
      teacherName: teacherName ?? this.teacherName,
      teacherEmail: teacherEmail ?? this.teacherEmail,
      teacherPhone: teacherPhone ?? this.teacherPhone,
      teacherAddress: teacherAddress ?? this.teacherAddress,
      teacherBio: teacherBio ?? this.teacherBio,
      location: location ?? this.location,
      rating: rating ?? this.rating,
    );
  }

  factory TeacherModel.fromJson(Map<String, dynamic> json) {
    return TeacherModel(
      teacherName: json['teacherName'],
      teacherEmail: json['teacherEmail'],
      teacherPhone: json['teacherPhone'],
      teacherAddress: json['teacherAddress'],
      teacherBio: json['teacherBio'],
      location: LatLng(json['location']['lat'], json['location']['lng']),
      rating: json['rating'],
    );
  }
}

class ApiService {
  Future<List<TeacherModel>> fetchTeachers() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 2));

    List<TeacherModel> teacherList = [
      TeacherModel(
        teacherName: "Sachin Basnet",
        teacherEmail: "sachin.basnet@example.com",
        teacherPhone: "1234567890",
        teacherAddress: "Kathmandu, Nepal",
        teacherBio: "Experienced Math teacher",
        location: LatLng(27.7172, 85.3240),
        rating: 5,
      ),
      TeacherModel(
        teacherName: "Sita Sharma",
        teacherEmail: "sita.sharma@example.com",
        teacherPhone: "1234567891",
        teacherAddress: "Pokhara, Nepal",
        teacherBio: "Physics teacher with 10 years of experience",
        location: LatLng(28.2096, 83.9856),
        rating: 4,
      ),
      TeacherModel(
        teacherName: "Ram Thapa",
        teacherEmail: "ram.thapa@example.com",
        teacherPhone: "1234567892",
        teacherAddress: "Lalitpur, Nepal",
        teacherBio: "Chemistry teacher",
        location: LatLng(27.6667, 85.3333),
        rating: 3,
      ),
      TeacherModel(
        teacherName: "Gita Rai",
        teacherEmail: "gita.rai@example.com",
        teacherPhone: "1234567893",
        teacherAddress: "Bhaktapur, Nepal",
        teacherBio: "Biology teacher",
        location: LatLng(27.6710, 85.4298),
        rating: 5,
      ),
      TeacherModel(
        teacherName: "Hari Shrestha",
        teacherEmail: "hari.shrestha@example.com",
        teacherPhone: "1234567894",
        teacherAddress: "Biratnagar, Nepal",
        teacherBio: "English teacher",
        location: LatLng(26.4525, 87.2718),
        rating: 4,
      ),
      TeacherModel(
        teacherName: "Nabin Karki",
        teacherEmail: "nabin.karki@example.com",
        teacherPhone: "1234567895",
        teacherAddress: "Dharan, Nepal",
        teacherBio: "History teacher",
        location: LatLng(26.8120, 87.2830),
        rating: 3,
      ),
      TeacherModel(
        teacherName: "Mina Gurung",
        teacherEmail: "mina.gurung@example.com",
        teacherPhone: "1234567896",
        teacherAddress: "Chitwan, Nepal",
        teacherBio: "Geography teacher",
        location: LatLng(27.5291, 84.3542),
        rating: 5,
      ),
      TeacherModel(
        teacherName: "Kiran Adhikari",
        teacherEmail: "kiran.adhikari@example.com",
        teacherPhone: "1234567897",
        teacherAddress: "Hetauda, Nepal",
        teacherBio: "Computer Science teacher",
        location: LatLng(27.4285, 85.0322),
        rating: 4,
      ),
      TeacherModel(
        teacherName: "Rita Tamang",
        teacherEmail: "rita.tamang@example.com",
        teacherPhone: "1234567898",
        teacherAddress: "Janakpur, Nepal",
        teacherBio: "Economics teacher",
        location: LatLng(26.7288, 85.9248),
        rating: 3,
      ),
      TeacherModel(
        teacherName: "Suman Lama",
        teacherEmail: "suman.lama@example.com",
        teacherPhone: "1234567899",
        teacherAddress: "Butwal, Nepal",
        teacherBio: "Political Science teacher",
        location: LatLng(27.7000, 83.4500),
        rating: 5,
      ),
      TeacherModel(
        teacherName: "Anita Magar",
        teacherEmail: "anita.magar@example.com",
        teacherPhone: "1234567800",
        teacherAddress: "Nepalgunj, Nepal",
        teacherBio: "Sociology teacher",
        location: LatLng(28.0500, 81.6167),
        rating: 4,
      ),
      TeacherModel(
        teacherName: "Prakash Khadka",
        teacherEmail: "prakash.khadka@example.com",
        teacherPhone: "1234567801",
        teacherAddress: "Dhangadhi, Nepal",
        teacherBio: "Psychology teacher",
        location: LatLng(28.7056, 80.5950),
        rating: 3,
      ),
      TeacherModel(
        teacherName: "Sunita Bhandari",
        teacherEmail: "sunita.bhandari@example.com",
        teacherPhone: "1234567802",
        teacherAddress: "Birgunj, Nepal",
        teacherBio: "Philosophy teacher",
        location: LatLng(27.0000, 84.8667),
        rating: 5,
      ),
      TeacherModel(
        teacherName: "Rajesh Rijal",
        teacherEmail: "rajesh.rijal@example.com",
        teacherPhone: "1234567803",
        teacherAddress: "Itahari, Nepal",
        teacherBio: "Art teacher",
        location: LatLng(26.6667, 87.2833),
        rating: 4,
      ),
      TeacherModel(
        teacherName: "Sarita Shahi",
        teacherEmail: "sarita.shahi@example.com",
        teacherPhone: "1234567804",
        teacherAddress: "Gorkha, Nepal",
        teacherBio: "Music teacher",
        location: LatLng(28.0000, 84.6333),
        rating: 3,
      ),
      TeacherModel(
        teacherName: "Bikash Thapa",
        teacherEmail: "bikash.thapa@example.com",
        teacherPhone: "1234567805",
        teacherAddress: "Lamjung, Nepal",
        teacherBio: "Physical Education teacher",
        location: LatLng(28.2833, 84.4167),
        rating: 5,
      ),
      TeacherModel(
        teacherName: "Kusum KC",
        teacherEmail: "kusum.kc@example.com",
        teacherPhone: "1234567806",
        teacherAddress: "Palpa, Nepal",
        teacherBio: "Drama teacher",
        location: LatLng(27.8667, 83.5500),
        rating: 4,
      ),
      TeacherModel(
        teacherName: "Ramesh Poudel",
        teacherEmail: "ramesh.poudel@example.com",
        teacherPhone: "1234567807",
        teacherAddress: "Syangja, Nepal",
        teacherBio: "Science teacher",
        location: LatLng(28.0833, 83.8833),
        rating: 3,
      ),
      TeacherModel(
        teacherName: "Laxmi Dhakal",
        teacherEmail: "laxmi.dhakal@example.com",
        teacherPhone: "1234567808",
        teacherAddress: "Tanahun, Nepal",
        teacherBio: "Mathematics teacher",
        location: LatLng(27.9167, 84.0833),
        rating: 5,
      ),
      TeacherModel(
        teacherName: "Manoj Shrestha",
        teacherEmail: "manoj.shrestha@example.com",
        teacherPhone: "1234567809",
        teacherAddress: "Kaski, Nepal",
        teacherBio: "English teacher",
        location: LatLng(28.2500, 83.9833),
        rating: 4,
      ),
    ];

    return teacherList;
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

  factory TeacherModel.fromMap(Map<String, dynamic> map) {
    return TeacherModel(
      teacherName:
          map['teacherName'] != null ? map['teacherName'] as String : null,
      teacherEmail:
          map['teacherEmail'] != null ? map['teacherEmail'] as String : null,
      teacherPhone:
          map['teacherPhone'] != null ? map['teacherPhone'] as String : null,
      teacherAddress: map['teacherAddress'] != null
          ? map['teacherAddress'] as String
          : null,
      teacherBio:
          map['teacherBio'] != null ? map['teacherBio'] as String : null,
      location: map['location'] != null
          ? LatLng(map['location']['latitude'] as double,
              map['location']['longitude'] as double)
          : null,
      rating: map['rating'] != null ? map['rating'] as int : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'teacherName': teacherName,
      'teacherEmail': teacherEmail,
      'teacherPhone': teacherPhone,
      'teacherAddress': teacherAddress,
      'teacherBio': teacherBio,
      'location': location != null
          ? {'latitude': location!.latitude, 'longitude': location!.longitude}
          : null,
      'rating': rating,
    };
  }

  String toJson() => json.encode(toMap());

  factory TeacherModel.fromJson(String source) =>
      TeacherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TeacherModel(teacherName: $teacherName, teacherEmail: $teacherEmail, teacherPhone: $teacherPhone, teacherAddress: $teacherAddress, teacherBio: $teacherBio, location: $location, rating: $rating)';
  }

  @override
  bool operator ==(covariant TeacherModel other) {
    if (identical(this, other)) return true;

    return other.teacherName == teacherName &&
        other.teacherEmail == teacherEmail &&
        other.teacherPhone == teacherPhone &&
        other.teacherAddress == teacherAddress &&
        other.teacherBio == teacherBio &&
        other.location == location &&
        other.rating == rating;
  }

  @override
  int get hashCode {
    return teacherName.hashCode ^
        teacherEmail.hashCode ^
        teacherPhone.hashCode ^
        teacherAddress.hashCode ^
        teacherBio.hashCode ^
        location.hashCode ^
        rating.hashCode;
  }
}

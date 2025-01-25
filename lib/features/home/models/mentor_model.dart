/// Enum for Gender
enum Gender { MALE, FEMALE }

/// Enum for Role
enum Role { STUDENT, TUTOR }

/// User model in Dart
class User {
  final String id;
  final String phone;
  final Gender gender;
  final String password;
  final Role role;
  final Profile? profile;
  final String? image;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.phone,
    required this.gender,
    required this.password,
    required this.role,
    this.profile,
    this.image =
        "http://hancockogundiyapartners.com/management/dummy-profile-pic-300x300/",
    required this.createdAt,
    required this.updatedAt,
  });

  /// Factory constructor for creating a `User` from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      phone: json['phone'],
      gender: Gender.values.byName(json['gender']),
      password: json['password'],
      role: Role.values.byName(json['role']),
      profile:
          json['profile'] != null ? Profile.fromJson(json['profile']) : null,
      image: json['image'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
// Import Rating if separated into another file

/// Profile model in Dart
class Profile {
  final String id;
  final String userId;
  final String fullName;
  final List<String> subject;
  final int? basePrice;
  final String? description;
  final bool isVerified;
  final String? cv;
  final List<Rating>? ratings;
  final List<Article>? articles;
  final DateTime createdAt;
  final DateTime updatedAt;

  Profile({
    required this.id,
    required this.userId,
    required this.fullName,
    required this.subject,
    this.basePrice,
    this.description,
    this.isVerified = false,
    this.cv,
    this.ratings,
    this.articles,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Factory constructor for creating a `Profile` from JSON
  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      userId: json['userId'],
      fullName: json['fullName'],
      subject: List<String>.from(json['subject']),
      basePrice: json['basePrice'],
      description: json['description'],
      isVerified: json['isVerified'],
      cv: json['cv'],
      ratings: json['ratings'] != null
          ? List<Rating>.from(json['ratings'].map((x) => Rating.fromJson(x)))
          : null,
      articles: json['articles'] != null
          ? List<Article>.from(json['articles'].map((x) => Article.fromJson(x)))
          : null,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

/// Rating model in Dart
class Rating {
  final String id;
  final String tutorId;
  final int value;
  final String? comment;
  final DateTime createdAt;

  Rating({
    required this.id,
    required this.tutorId,
    required this.value,
    this.comment,
    required this.createdAt,
  });

  /// Factory constructor for creating a `Rating` from JSON
  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      id: json['id'],
      tutorId: json['tutorId'],
      value: json['value'],
      comment: json['comment'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  /// Method to convert `Rating` to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tutorId': tutorId,
      'value': value,
      'comment': comment,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

/// Article model in Dart
class Article {
  final String id;
  final String title;
  final String content;
  final String authorId;
  final DateTime createdAt;
  final DateTime updatedAt;

  Article({
    required this.id,
    required this.title,
    required this.content,
    required this.authorId,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Factory constructor for creating an `Article` from JSON
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      authorId: json['authorId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  /// Method to convert `Article` to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'authorId': authorId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

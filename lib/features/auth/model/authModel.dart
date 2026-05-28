class AuthModel {
  final String name;
  final String email;
  final String uid;
  final DateTime createdAt;

  AuthModel({
    required this.name,
    required this.email,
    required this.uid,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {"name": name, "email": email, "uid": uid, "createdAt": createdAt};
  }

  // Convert Firestore Map → Dart object
  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}

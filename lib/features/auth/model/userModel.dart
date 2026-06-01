class UserModel {
  final String uid;
  final String email;
  final String name;
  final double initialBalance;
  final DateTime createdAt;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.initialBalance,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "email": email,

      "name": name,

      "initialBalance": initialBalance,
      "createdAt": createdAt,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      initialBalance: (map['initialBalance'] ?? 0).toDouble(),
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}

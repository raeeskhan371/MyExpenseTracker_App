import 'package:cloud_firestore/cloud_firestore.dart';

class ExpenseModel {
  final String title;
  final double amount;
  final String note;
  final Timestamp? createdAt;

  ExpenseModel({
    required this.title,
    required this.amount,
    required this.note,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'amount': amount,
      'note': note,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      title: map['title'] ?? '',
      amount: (map['amount'] ?? 0).toDouble(),
      note: map['note'] ?? '',
      createdAt: (map["createdAt"] as Timestamp),
    );
  }
}

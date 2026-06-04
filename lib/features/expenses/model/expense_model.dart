class ExpenseModel {
  final String title;
  final double amount;
  final String note;
  final DateTime createdAt;

  ExpenseModel({
    required this.title,
    required this.amount,
    required this.note,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'amount': amount,
      'note': note,
      'createdAt': createdAt,
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      title: map['title'] ?? '',
      amount: (map['amount'] ?? 0).toDouble(),
      note: map['note'] ?? '',
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}

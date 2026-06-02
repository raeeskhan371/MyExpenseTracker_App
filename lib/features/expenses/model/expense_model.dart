class ExpenseModel {
  final String title;
  final double amount;
  final String category;
  final DateTime createdAt;

  ExpenseModel({
    required this.title,
    required this.amount,
    required this.category,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'amount': amount,
      'category': category,
      'createdAt': createdAt,
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      title: map['title'] ?? '',
      amount: (map['amount'] ?? 0).toDouble(),
      category: map['category'] ?? '',
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}

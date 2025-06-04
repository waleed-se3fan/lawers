class RevenueModel {
  final int? id;
  final int categoryId;
  final String name;
  final double amount;
  final String date;
  final String method;
  final String? notes;
  final String? description;
  final double paidFees;
  final double remainingFees;
  final int userId;
  final String createdAt;
  final String updatedAt;

  RevenueModel({
    this.id,
    required this.categoryId,
    required this.name,
    required this.amount,
    required this.date,
    required this.method,
    this.notes,
    this.description,
    required this.paidFees,
    required this.remainingFees,
    required this.userId,
    this.createdAt = '',
    this.updatedAt = '',
  });

  factory RevenueModel.fromJson(Map<String, dynamic> json) => RevenueModel(
        id: json['id'],
        categoryId: json['category_id'],
        name: json['name'],
        amount: double.parse(json['amount'].toString()),
        date: json['date'],
        method: json['method'],
        notes: json['notes'],
        description: json['description'],
        paidFees: double.parse(json['paid_fees'].toString()),
        remainingFees: double.parse(json['remaining_fees'].toString()),
        userId: json['user_id'],
        createdAt: json['created_at'] ?? '',
        updatedAt: json['updated_at'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'category_id': categoryId,
        'name': name,
        'amount': amount,
        'date': date,
        'method': method,
        'notes': notes,
        'description': description,
        'paid_fees': paidFees,
        'remaining_fees': remainingFees,
        'user_id': userId,
      };
}

class IssuesModel {
  final int id;
  final int customerId;
  final String? opponentName;
  final String? opponentType;
  final String? opponentPhone;
  final String? opponentNation;
  final String? opponentAddress;
  final String? opponentLawyer;
  final String? lawyerPhone;
  final String? courtName;
  final String? circle;
  final String? judgeName;
  final String? caseNumber;
  final String? attorneyNumber;
  final String? registerDate;
  final String? caseTitle;
  final double? contractPrice;
  final String? notes;
  final double? paidFees;
  final double? remainingFees;
  final int caseCategoryId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<String>? visibleToRoles;
  final Customer? customer;
  final Category? category;
  final List<dynamic> expenses;

  IssuesModel({
    required this.id,
    required this.customerId,
    this.opponentName,
    this.opponentType,
    this.opponentPhone,
    this.opponentNation,
    this.opponentAddress,
    this.opponentLawyer,
    this.lawyerPhone,
    this.courtName,
    this.circle,
    this.judgeName,
    this.caseNumber,
    this.attorneyNumber,
    this.registerDate,
    this.caseTitle,
    this.contractPrice,
    this.notes,
    this.paidFees,
    this.remainingFees,
    required this.caseCategoryId,
    this.createdAt,
    this.updatedAt,
    this.visibleToRoles,
    this.customer,
    this.category,
    required this.expenses,
  });

  factory IssuesModel.fromJson(Map<String, dynamic> json) {
    return IssuesModel(
      id: json['id'] ?? 0,
      customerId: json['customer_id'] ?? 0,
      opponentName: json['opponent_name'],
      opponentType: json['opponent_type'],
      opponentPhone: json['opponent_phone'],
      opponentNation: json['opponent_nation'],
      opponentAddress: json['opponent_address'],
      opponentLawyer: json['opponent_lawyer'],
      lawyerPhone: json['lawyer_phone'],
      courtName: json['court_name'],
      circle: json['circle'],
      judgeName: json['judge_name'],
      caseNumber: json['case_number'],
      attorneyNumber: json['attorney_number'],
      registerDate: json['register_date'],
      caseTitle: json['case_title'],
      contractPrice:
          (json['contract_price'] != null)
              ? (json['contract_price'] as num).toDouble()
              : null,
      notes: json['notes'],
      paidFees:
          (json['paid_fees'] != null)
              ? (json['paid_fees'] as num).toDouble()
              : null,
      remainingFees:
          (json['remaining_fees'] != null)
              ? (json['remaining_fees'] as num).toDouble()
              : null,
      caseCategoryId: json['case_category_id'] ?? 0,
      createdAt:
          json['created_at'] != null
              ? DateTime.tryParse(json['created_at'])
              : null,
      updatedAt:
          json['updated_at'] != null
              ? DateTime.tryParse(json['updated_at'])
              : null,
      visibleToRoles:
          json['visible_to_roles'] != null
              ? List<String>.from(json['visible_to_roles'])
              : null,
      customer:
          json['customer'] != null ? Customer.fromJson(json['customer']) : null,
      category:
          json['category'] != null ? Category.fromJson(json['category']) : null,
      expenses: json['expenses'] ?? [],
    );
  }
}

class Customer {
  final int id;
  final String? name;
  final String? email;
  final String? idNumber;
  final String? phone;
  final String? address;
  final String? nationality;
  final String? companyName;
  final String? notes;
  final int userId;
  final int customerCategoryId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Customer({
    required this.id,
    this.name,
    this.email,
    this.idNumber,
    this.phone,
    this.address,
    this.nationality,
    this.companyName,
    this.notes,
    required this.userId,
    required this.customerCategoryId,
    this.createdAt,
    this.updatedAt,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'] ?? 0,
      name: json['name'],
      email: json['email'],
      idNumber: json['ID_number'],
      phone: json['phone'],
      address: json['address'],
      nationality: json['nationality'],
      companyName: json['company_name'],
      notes: json['notes'],
      userId: json['user_id'] ?? 0,
      customerCategoryId: json['customer_category_id'] ?? 0,
      createdAt:
          json['created_at'] != null
              ? DateTime.tryParse(json['created_at'])
              : null,
      updatedAt:
          json['updated_at'] != null
              ? DateTime.tryParse(json['updated_at'])
              : null,
    );
  }
}

class Category {
  final int id;
  final String? name;
  final int userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Category({
    required this.id,
    this.name,
    required this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? 0,
      name: json['name'],
      userId: json['user_id'] ?? 0,
      createdAt:
          json['created_at'] != null
              ? DateTime.tryParse(json['created_at'])
              : null,
      updatedAt:
          json['updated_at'] != null
              ? DateTime.tryParse(json['updated_at'])
              : null,
    );
  }
}

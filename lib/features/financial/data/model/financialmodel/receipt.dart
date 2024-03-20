import 'package:equatable/equatable.dart';

import 'user.dart';

class Receipt extends Equatable {
  final num? id;
  final User? user;
  final String? tenantName;
  final String? tenantPhone;
  final String? installmentNumber;
  final num? totalAmount;
  final String? transactionDate;
  final String? contractDateFrom;
  final String? contractDateTo;

  const Receipt({
    this.id,
    this.user,
    this.tenantName,
    this.tenantPhone,
    this.installmentNumber,
    this.totalAmount,
    this.transactionDate,
    this.contractDateFrom,
    this.contractDateTo,
  });

  factory Receipt.fromJson(Map<String, dynamic> json) => Receipt(
        id: num.tryParse(json['id'].toString()),
        user: json['user'] == null
            ? null
            : User.fromJson(Map<String, dynamic>.from(json['user'])),
        tenantName: json['tenant_name']?.toString(),
        tenantPhone: json['tenant_phone']?.toString(),
        installmentNumber: json['installment_number']?.toString(),
        totalAmount: num.tryParse(json['total_amount'].toString()),
        transactionDate: json['transaction_date']?.toString(),
        contractDateFrom: json['contract_date_from']?.toString(),
        contractDateTo: json['contract_date_to']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (user != null) 'user': user?.toJson(),
        if (tenantName != null) 'tenant_name': tenantName,
        if (tenantPhone != null) 'tenant_phone': tenantPhone,
        if (installmentNumber != null) 'installment_number': installmentNumber,
        if (totalAmount != null) 'total_amount': totalAmount,
        if (transactionDate != null) 'transaction_date': transactionDate,
        if (contractDateFrom != null) 'contract_date_from': contractDateFrom,
        if (contractDateTo != null) 'contract_date_to': contractDateTo,
      };

  @override
  List<Object?> get props {
    return [
      id,
      user,
      tenantName,
      tenantPhone,
      installmentNumber,
      totalAmount,
      transactionDate,
      contractDateFrom,
      contractDateTo,
    ];
  }
}

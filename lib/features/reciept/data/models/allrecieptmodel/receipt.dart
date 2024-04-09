import 'package:equatable/equatable.dart';

import 'user.dart';

class Receipt extends Equatable {
  final num? id;
  final User? user;
  final String? ownerName;
  final String? ownerPhone;
  final num? totalAmount;
  final num? commission;
  final String? transactionDate;
  final String? contractDateFrom;
  final String? contractDateTo;

  const Receipt({
    this.id,
    this.user,
    this.ownerName,
    this.ownerPhone,
    this.totalAmount,
    this.commission,
    this.transactionDate,
    this.contractDateFrom,
    this.contractDateTo,
  });

  factory Receipt.fromJson(Map<String, dynamic> json) => Receipt(
        id: num.tryParse(json['id'].toString()),
        user: json['user'] == null
            ? null
            : User.fromJson(Map<String, dynamic>.from(json['user'])),
        ownerName: json['owner_name']?.toString(),
        ownerPhone: json['owner_phone']?.toString(),
        totalAmount: num.tryParse(json['total_amount'].toString()),
        commission: num.tryParse(json['commission'].toString()),
        transactionDate: json['transaction_date']?.toString(),
        contractDateFrom: json['contract_date_from']?.toString(),
        contractDateTo: json['contract_date_to']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (user != null) 'user': user?.toJson(),
        if (ownerName != null) 'owner_name': ownerName,
        if (ownerPhone != null) 'owner_phone': ownerPhone,
        if (totalAmount != null) 'total_amount': totalAmount,
        if (commission != null) 'commission': commission,
        if (transactionDate != null) 'transaction_date': transactionDate,
        if (contractDateFrom != null) 'contract_date_from': contractDateFrom,
        if (contractDateTo != null) 'contract_date_to': contractDateTo,
      };

  @override
  List<Object?> get props {
    return [
      id,
      user,
      ownerName,
      ownerPhone,
      totalAmount,
      commission,
      transactionDate,
      contractDateFrom,
      contractDateTo,
    ];
  }
}

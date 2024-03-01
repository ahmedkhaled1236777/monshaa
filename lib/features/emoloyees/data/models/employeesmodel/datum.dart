import 'package:equatable/equatable.dart';

class Datum extends Equatable {
  final num? id;
  final dynamic logo;
  final String? name;
  final String? employeephoto;
  final String? jobTitle;
  final String? currency;
  final List<String>? permissions;
  final String? address;
  final String? phone;
  final String? userType;
  final String? cardNumber;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  const Datum({
    this.id,
    this.logo,
    this.name,
    this.employeephoto,
    this.jobTitle,
    this.currency,
    this.permissions,
    this.address,
    this.phone,
    this.userType,
    this.cardNumber,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: num.tryParse(json['id'].toString()),
        logo: json['logo'],
        name: json['name']?.toString(),
        employeephoto: json['employee_image']?.toString(),
        jobTitle: json['job_title']?.toString(),
        currency: json['currency']?.toString(),
        permissions: List<String>.from(json['permissions'] ?? []),
        address: json['address']?.toString(),
        phone: json['phone']?.toString(),
        userType: json['user_type']?.toString(),
        cardNumber: json['card_number']?.toString(),
        status: json['status']?.toString(),
        createdAt: json['created_at']?.toString(),
        updatedAt: json['updated_at']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (logo != null) 'logo': logo,
        if (name != null) 'name': name,
        if (jobTitle != null) 'job_title': jobTitle,
        if (currency != null) 'currency': currency,
        if (permissions != null) 'permissions': permissions,
        if (address != null) 'address': address,
        if (phone != null) 'phone': phone,
        if (userType != null) 'user_type': userType,
        if (cardNumber != null) 'card_number': cardNumber,
        if (status != null) 'status': status,
        if (createdAt != null) 'created_at': createdAt,
        if (updatedAt != null) 'updated_at': updatedAt,
      };

  @override
  List<Object?> get props {
    return [
      id,
      logo,
      name,
      jobTitle,
      currency,
      permissions,
      address,
      phone,
      userType,
      cardNumber,
      status,
      createdAt,
      updatedAt,
    ];
  }
}

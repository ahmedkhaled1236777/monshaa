import 'package:equatable/equatable.dart';

import 'home.dart';
import 'sidebar.dart';

class Data extends Equatable {
  final num? id;
  final dynamic logo;
  final String? name;
  final String? jobTitle;
  final String? currency;
  final String? userType;
  final String? companyName;
  final String? companyAddress;
  final String? companyPhone;
  final String? phone;
  final String? status;
  final String? token;
  final List<Sidebar>? sidebar;
  final List<Home>? home;
  final String? createdAt;
  final String? updatedAt;

  const Data({
    this.id,
    this.logo,
    this.name,
    this.jobTitle,
    this.currency,
    this.userType,
    this.companyName,
    this.companyAddress,
    this.companyPhone,
    this.phone,
    this.status,
    this.token,
    this.sidebar,
    this.home,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: num.tryParse(json['id'].toString()),
        logo: json['logo'],
        name: json['name']?.toString(),
        jobTitle: json['job_title']?.toString(),
        currency: json['currency']?.toString(),
        userType: json['user_type']?.toString(),
        companyName: json['company_name']?.toString(),
        companyAddress: json['company_address']?.toString(),
        companyPhone: json['company_phone']?.toString(),
        phone: json['phone']?.toString(),
        status: json['status']?.toString(),
        token: json['token']?.toString(),
        sidebar: (json['sidebar'] as List<dynamic>?)
            ?.map((e) => Sidebar.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
        home: (json['home'] as List<dynamic>?)
            ?.map((e) => Home.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
        createdAt: json['created_at']?.toString(),
        updatedAt: json['updated_at']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (logo != null) 'logo': logo,
        if (name != null) 'name': name,
        if (jobTitle != null) 'job_title': jobTitle,
        if (currency != null) 'currency': currency,
        if (userType != null) 'user_type': userType,
        if (companyName != null) 'company_name': companyName,
        if (companyAddress != null) 'company_address': companyAddress,
        if (companyPhone != null) 'company_phone': companyPhone,
        if (phone != null) 'phone': phone,
        if (status != null) 'status': status,
        if (token != null) 'token': token,
        if (sidebar != null)
          'sidebar': sidebar?.map((e) => e.toJson()).toList(),
        if (home != null) 'home': home?.map((e) => e.toJson()).toList(),
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
      userType,
      companyName,
      companyAddress,
      companyPhone,
      phone,
      status,
      token,
      sidebar,
      home,
      createdAt,
      updatedAt,
    ];
  }
}

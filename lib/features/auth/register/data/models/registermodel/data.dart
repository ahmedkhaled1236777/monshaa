import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final num? id;
  final dynamic logo;
  final String? name;
  final String? userType;
  final String? shopName;
  final String? shopAddress;
  final String? phone;
  final String? taxNumber;
  final String? status;
  final String? token;
  final String? createdAt;
  final String? updatedAt;

  const Data({
    this.id,
    this.logo,
    this.name,
    this.userType,
    this.shopName,
    this.shopAddress,
    this.phone,
    this.taxNumber,
    this.status,
    this.token,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: num.tryParse(json['id'].toString()),
        logo: json['logo'],
        name: json['name']?.toString(),
        userType: json['user_type']?.toString(),
        shopName: json['shop_name']?.toString(),
        shopAddress: json['shop_address']?.toString(),
        phone: json['phone']?.toString(),
        taxNumber: json['tax_number']?.toString(),
        status: json['status']?.toString(),
        token: json['token']?.toString(),
        createdAt: json['created_at']?.toString(),
        updatedAt: json['updated_at']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (logo != null) 'logo': logo,
        if (name != null) 'name': name,
        if (userType != null) 'user_type': userType,
        if (shopName != null) 'shop_name': shopName,
        if (shopAddress != null) 'shop_address': shopAddress,
        if (phone != null) 'phone': phone,
        if (taxNumber != null) 'tax_number': taxNumber,
        if (status != null) 'status': status,
        if (token != null) 'token': token,
        if (createdAt != null) 'created_at': createdAt,
        if (updatedAt != null) 'updated_at': updatedAt,
      };

  @override
  List<Object?> get props {
    return [
      id,
      logo,
      name,
      userType,
      shopName,
      shopAddress,
      phone,
      taxNumber,
      status,
      token,
      createdAt,
      updatedAt,
    ];
  }
}

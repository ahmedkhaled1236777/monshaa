import 'package:equatable/equatable.dart';

class Datum extends Equatable {
  final num? id;
  final List<dynamic>? landImages;
  final String? address;
  final String? sellerName;
  final num? sizeInMetres;
  final num? priceOfOneMeter;
  final num? totalCost;
  final String? sellerPhoneNumber;
  final String? advertiserType;
  final String? advertiseDetails;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  const Datum({
    this.id,
    this.landImages,
    this.address,
    this.sellerName,
    this.sizeInMetres,
    this.priceOfOneMeter,
    this.totalCost,
    this.sellerPhoneNumber,
    this.advertiserType,
    this.advertiseDetails,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: num.tryParse(json['id'].toString()),
        landImages: List<dynamic>.from(json['land_images'] ?? []),
        address: json['address']?.toString(),
        sellerName: json['seller_name']?.toString(),
        sizeInMetres: num.tryParse(json['size_in_metres'].toString()),
        priceOfOneMeter: num.tryParse(json['price_of_one_meter'].toString()),
        totalCost: num.tryParse(json['total_cost'].toString()),
        sellerPhoneNumber: json['seller_phone_number']?.toString(),
        advertiserType: json['advertiser_type']?.toString(),
        advertiseDetails: json['advertise_details']?.toString(),
        status: json['status']?.toString(),
        createdAt: json['created_at']?.toString(),
        updatedAt: json['updated_at']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (landImages != null) 'land_images': landImages,
        if (address != null) 'address': address,
        if (sellerName != null) 'seller_name': sellerName,
        if (sizeInMetres != null) 'size_in_metres': sizeInMetres,
        if (priceOfOneMeter != null) 'price_of_one_meter': priceOfOneMeter,
        if (totalCost != null) 'total_cost': totalCost,
        if (sellerPhoneNumber != null) 'seller_phone_number': sellerPhoneNumber,
        if (advertiserType != null) 'advertiser_type': advertiserType,
        if (advertiseDetails != null) 'advertise_details': advertiseDetails,
        if (status != null) 'status': status,
        if (createdAt != null) 'created_at': createdAt,
        if (updatedAt != null) 'updated_at': updatedAt,
      };

  @override
  List<Object?> get props {
    return [
      id,
      landImages,
      address,
      sellerName,
      sizeInMetres,
      priceOfOneMeter,
      totalCost,
      sellerPhoneNumber,
      advertiserType,
      advertiseDetails,
      status,
      createdAt,
      updatedAt,
    ];
  }
}

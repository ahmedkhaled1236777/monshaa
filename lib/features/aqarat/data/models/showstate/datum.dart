import 'package:equatable/equatable.dart';

class Datum extends Equatable {
  final num? id;
  final String? status;
  final String? advertiser_name;
  final List? realStateImages;
  final String? buildingNumber;
  final String? apartmentNumber;
  final String? realStateAddress;
  final String? realStateAddressDetails;
  final String? realStateType;
  final String? department;
  final String? advertiserType;
  final String? advertisedPhoneNumber;
  final num? realStateSpace;
  final num? realStatePrice;
  final num? numberOfBathrooms;
  final num? numberOfRooms;
  final dynamic advertiseDetails;
  final String? createdAt;
  final String? updatedAt;

  const Datum({
    this.id,
    this.status,
    this.advertiser_name,
    this.realStateImages,
    this.buildingNumber,
    this.apartmentNumber,
    this.realStateAddress,
    this.realStateAddressDetails,
    this.realStateType,
    this.department,
    this.advertiserType,
    this.advertisedPhoneNumber,
    this.realStateSpace,
    this.realStatePrice,
    this.numberOfBathrooms,
    this.numberOfRooms,
    this.advertiseDetails,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: num.tryParse(json['id'].toString()),
        status: json['status']?.toString(),
        advertiser_name: json['advertiser_name']?.toString(),
        realStateImages: json['real_state_images'],
        buildingNumber: json['building_number']?.toString(),
        apartmentNumber: json['apartment_number']?.toString(),
        realStateAddress: json['real_state_address']?.toString(),
        realStateAddressDetails: json['real_state_address_details']?.toString(),
        realStateType: json['real_state_type']?.toString(),
        department: json['department']?.toString(),
        advertiserType: json['advertiser_type']?.toString(),
        advertisedPhoneNumber: json['advertised_phone_number']?.toString(),
        realStateSpace: num.tryParse(json['real_state_space'].toString()),
        realStatePrice: num.tryParse(json['real_state_price'].toString()),
        numberOfBathrooms: num.tryParse(json['number_of_bathrooms'].toString()),
        numberOfRooms: num.tryParse(json['number_of_rooms'].toString()),
        advertiseDetails: json['advertise_details'],
        createdAt: json['created_at']?.toString(),
        updatedAt: json['updated_at']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (status != null) 'status': status,
        if (realStateImages != null) 'real_state_images': realStateImages,
        if (buildingNumber != null) 'building_number': buildingNumber,
        if (apartmentNumber != null) 'apartment_number': apartmentNumber,
        if (realStateAddress != null) 'real_state_address': realStateAddress,
        if (realStateAddressDetails != null)
          'real_state_address_details': realStateAddressDetails,
        if (realStateType != null) 'real_state_type': realStateType,
        if (department != null) 'department': department,
        if (advertiserType != null) 'advertiser_type': advertiserType,
        if (advertisedPhoneNumber != null)
          'advertised_phone_number': advertisedPhoneNumber,
        if (realStateSpace != null) 'real_state_space': realStateSpace,
        if (realStatePrice != null) 'real_state_price': realStatePrice,
        if (numberOfBathrooms != null) 'number_of_bathrooms': numberOfBathrooms,
        if (numberOfRooms != null) 'number_of_rooms': numberOfRooms,
        if (advertiseDetails != null) 'advertise_details': advertiseDetails,
        if (createdAt != null) 'created_at': createdAt,
        if (updatedAt != null) 'updated_at': updatedAt,
      };

  @override
  List<Object?> get props {
    return [
      id,
      status,
      realStateImages,
      buildingNumber,
      apartmentNumber,
      realStateAddress,
      realStateAddressDetails,
      realStateType,
      department,
      advertiserType,
      advertisedPhoneNumber,
      realStateSpace,
      realStatePrice,
      numberOfBathrooms,
      numberOfRooms,
      advertiseDetails,
      createdAt,
      updatedAt,
    ];
  }
}

import 'package:equatable/equatable.dart';

class Datum extends Equatable {
  final num? id;
  final String? code;
  final String? name;
  final String? phone;
  final String? inspectionDate;
  final String? status;

  const Datum({
    this.id,
    this.code,
    this.name,
    this.phone,
    this.inspectionDate,
    this.status,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: num.tryParse(json['id'].toString()),
        code: json['code']?.toString(),
        name: json['name']?.toString(),
        phone: json['phone']?.toString(),
        inspectionDate: json['inspection_date']?.toString(),
        status: json['status']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (code != null) 'code': code,
        if (name != null) 'name': name,
        if (phone != null) 'phone': phone,
        if (inspectionDate != null) 'inspection_date': inspectionDate,
        if (status != null) 'status': status,
      };

  @override
  List<Object?> get props {
    return [
      id,
      code,
      name,
      phone,
      inspectionDate,
      status,
    ];
  }
}

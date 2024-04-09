import 'package:equatable/equatable.dart';

class Datum extends Equatable {
  final num? id;
  final String? employee;
  final String? code;
  final String? name;
  final String? department;
  final String? phone;
  final String? inspectionDate;
  final dynamic notes;
  final String? status;

  const Datum({
    this.id,
    this.employee,
    this.code,
    this.name,
    this.department,
    this.phone,
    this.inspectionDate,
    this.notes,
    this.status,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: num.tryParse(json['id'].toString()),
        employee: json['employee']?.toString(),
        code: json['code']?.toString(),
        name: json['name']?.toString(),
        department: json['department']?.toString(),
        phone: json['phone']?.toString(),
        inspectionDate: json['inspection_date']?.toString(),
        notes: json['notes'],
        status: json['status']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (employee != null) 'employee': employee,
        if (code != null) 'code': code,
        if (name != null) 'name': name,
        if (department != null) 'department': department,
        if (phone != null) 'phone': phone,
        if (inspectionDate != null) 'inspection_date': inspectionDate,
        if (notes != null) 'notes': notes,
        if (status != null) 'status': status,
      };

  @override
  List<Object?> get props {
    return [
      id,
      employee,
      code,
      name,
      department,
      phone,
      inspectionDate,
      notes,
      status,
    ];
  }
}

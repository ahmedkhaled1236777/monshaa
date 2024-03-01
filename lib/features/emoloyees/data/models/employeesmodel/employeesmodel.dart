import 'package:equatable/equatable.dart';

import 'data.dart';

class Employeesmodel extends Equatable {
  final Data? data;
  final num? code;
  final String? message;
  final bool? status;

  const Employeesmodel({this.data, this.code, this.message, this.status});

  factory Employeesmodel.fromJson(Map<String, dynamic> json) {
    return Employeesmodel(
      data: json['data'] == null
          ? null
          : Data.fromJson(Map<String, dynamic>.from(json['data'])),
      code: num.tryParse(json['code'].toString()),
      message: json['message']?.toString(),
      status: json['status']?.toString().contains("true"),
    );
  }

  Map<String, dynamic> toJson() => {
        if (data != null) 'data': data?.toJson(),
        if (code != null) 'code': code,
        if (message != null) 'message': message,
        if (status != null) 'status': status,
      };

  @override
  List<Object?> get props => [data, code, message, status];
}

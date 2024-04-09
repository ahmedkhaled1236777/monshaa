import 'dart:io';

import 'package:dio/dio.dart';

class updateprofilemodelrequest {
  final String name;
  final String phone;
  final String companyPhone;
  final String company_adress;
  final String company_name;
  final String currency;
  dynamic? logo;

  updateprofilemodelrequest(
      {this.logo,
      required this.name,
      required this.phone,
      required this.companyPhone,
      required this.company_adress,
      required this.company_name,
      required this.currency});
  tojson() => FormData.fromMap({
        "name": name,
        "phone": phone,
        "company_name": company_name,
        "company_address": company_adress,
        "company_phone": companyPhone,
        "password": null,
        if (logo != null) "logo": logo,
        "currency": currency
      });
}

import 'package:aplication/features/aqarat/presentation/views/estate.dart';
import 'package:aplication/readestate.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types, use_key_in_widget_constructors
class aqart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return constraints.maxWidth > 950 ? Estate() : ReadEstate();
    }));
  }
}

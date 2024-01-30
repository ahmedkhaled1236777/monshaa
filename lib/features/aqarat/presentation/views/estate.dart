import 'dart:io';

import 'package:aplication/advertiser_type.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/desktopaqarat.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/mobileaddaqqar.dart';
import 'package:aplication/features/home/presentation/views/widgets/dashbord.dart';
import 'package:aplication/dropdown_estate.dart';
import 'package:aplication/features/auth/login/presentation/views/login.dart';
import 'package:aplication/main.dart';
import 'package:aplication/pdt.dart';
import 'package:aplication/readestate.dart';
import 'package:aplication/showestate.dart';
import 'package:aplication/type.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../../../../building.dart';
import 'package:image_picker/image_picker.dart';

class Estate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EstateState();
  }
}

class EstateState extends State<Estate> {
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();
  DateTime selectedDate = DateTime.now();
  DateTime selectedDate1 = DateTime.now();
  var date1 = 'التاريخ';
  var date2 = 'اضغط لاختيار تاريخ محدد';
  List<XFile> imageFile = [];
  final ImagePicker picker = ImagePicker();
  uploadImage() async {
    final List<XFile> pickedimage = await picker.pickMultiImage();

    if (pickedimage.isNotEmpty) {
      imageFile.addAll(pickedimage);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, consters) {
      if (consters.maxWidth > 950)
        return desktopaqarat();
      else {
        return mobiladdaqaar();
      }
    });
  }
}

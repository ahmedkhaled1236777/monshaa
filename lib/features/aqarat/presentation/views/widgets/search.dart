import 'package:aplication/advertiser_type.dart';
import 'package:aplication/dropdown_estate.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/alertcontent.dart';
import 'package:flutter/material.dart';

class search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,

          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
                surfaceTintColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                title: Container(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close)),
                ),
                content: alertcontent());
          },
        );
      },
      child: Icon(
        Icons.search,
        color: Colors.white,
        size: 24,
      ),
    );
  }
}

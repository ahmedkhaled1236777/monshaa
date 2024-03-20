import 'package:aplication/core/styles/style.dart';
import 'package:flutter/material.dart';

class customtablecontractitem extends StatelessWidget {
  final String tenantname;
  final String adress;
  final String phone;

  Widget addcontract;
  Widget delet;
  Widget edit;
  TextStyle textStyle;
  double iconsize;
  // ignore: non_constant_identifier_names
  customtablecontractitem(
      {super.key,
      required this.tenantname,
      required this.adress,
      required this.phone,
      required this.delet,
      required this.addcontract,
      required this.edit,
      this.iconsize = 22,
      this.textStyle = Appstyles.textStyle12b});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints(minHeight: MediaQuery.of(context).size.height / 19),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              tenantname,
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 3,
          ),
          Expanded(
              flex: 3,
              child: Text(
                adress,
                style: textStyle,
                textAlign: TextAlign.center,
              )),
          SizedBox(
            width: 3,
          ),
          Expanded(
              flex: 3,
              child: Text(
                phone,
                style: textStyle,
                textAlign: TextAlign.center,
              )),
          SizedBox(
            width: 3,
          ),
          Expanded(
            child: addcontract,
            flex: 2,
          ),
          Expanded(
            child: edit,
            flex: 2,
          ),
          Expanded(
            child: delet,
            flex: 2,
          ),
        ],
      ),
    );
  }
}

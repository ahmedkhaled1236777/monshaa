import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarcuibt.dart';
import 'package:aplication/features/lands/presentation/views/widgets/alertcontentland.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class landsearch extends StatefulWidget {
  @override
  State<landsearch> createState() => _landsearchState();
}

class _landsearchState extends State<landsearch> {
  @override
  void initState() {
    if (BlocProvider.of<addaqarcuibt>(context).allemployeesmodel == null)
      BlocProvider.of<addaqarcuibt>(context)
          .getallemployees(token: generaltoken);
  }

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
                content: landalertcontent());
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

import 'package:aplication/core/commn/sharedpref/cashhelper.dart';
import 'package:aplication/core/sizes/appsizes.dart';
import 'package:flutter/material.dart';

showsnack({required String comment, required BuildContext context}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.1,
        right: MediaQuery.of(context).size.width * 0.1,
        bottom: MediaQuery.of(context).size.height * 0.1),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Appsizes.size20)),
    content: Center(child: Text(comment)),
  ));
}

String generaltoken = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL3JlZ2lzdGVyIiwiaWF0IjoxNzA4Nzg5OTk1LCJleHAiOjE3NDAzMjU5OTUsIm5iZiI6MTcwODc4OTk5NSwianRpIjoiVm52ZVQxSmdraWFaR24yaCIsInN1YiI6IjIxIiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.R-VHF7oLUqKW4qQF6E_u0P8SftHfTGVtyFUP-cLarR8";

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

String generaltoken =
    "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNzA2OTA0MjYxLCJleHAiOjE3Mzg0NDAyNjEsIm5iZiI6MTcwNjkwNDI2MSwianRpIjoiZDUxSmxBVG9IV3VmVlFBYiIsInN1YiI6IjIxIiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.BcDZrOWaxJ0sIdg48fSNhWfx1Ne8tUtyPnxsOn2EmI8";

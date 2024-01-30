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
String generaltoken="Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL3JlZ2lzdGVyIiwiaWF0IjoxNzA2NTExODU0LCJleHAiOjE3MzgwNDc4NTQsIm5iZiI6MTcwNjUxMTg1NCwianRpIjoidmtnbm8yRnFGdkJDeTdsRCIsInN1YiI6IjIxIiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.bao6JdOhJaOyPAX3JCRAQYwrm_P1y5uByE3LxzqSoeg";
import 'package:flutter/material.dart';

navigateto({required Widget navigationscreen, required BuildContext context}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
    return navigationscreen;
  }));
}

navigateandfinish(
    {required Widget navigationscreen, required BuildContext context}) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
    return navigationscreen;
  }));
}

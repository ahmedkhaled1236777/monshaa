import 'package:aplication/core/sizes/appsizes.dart';
import 'package:flutter/material.dart';

showdialogerror({required String error, required BuildContext context}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(error),
            ),
            const SizedBox(
              height: Appsizes.size15,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("تم")),
            )
          ],
        );
      });
}

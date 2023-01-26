import 'package:flutter/material.dart';
//
// class SnackBarWidget extends StatelessWidget {
//   const SnackBarWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
// Widget showSucessSnack(BuildContext ctx, String message){
//
//   return show
// }
import 'package:flutter/material.dart';

void success({required String message, required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 1),
    ),
  );
}

void error({required String message, required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 1),
    ),
  );
}

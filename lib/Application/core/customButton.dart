import 'package:flutter/material.dart';
import 'package:openxtech_starter/Application/Features/login/http/login.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.title}) : super(key: key);
  final title;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: () {
        Login().LoginUser('junior', 'malcom');
      },
      child: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        fixedSize: Size(screenSize.width, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

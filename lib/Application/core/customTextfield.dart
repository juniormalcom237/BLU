import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.title,
      required this.label,
      required this.leadingIcon,
      this.trailingIcon,
      required this.controller})
      : super(key: key);
  final String title;
  final String label;
  final IconData leadingIcon;
  final IconData? trailingIcon;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 55,
          // padding: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                // style: BorderStyle.solid,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(8)),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: label,
              contentPadding: EdgeInsets.only(top: 15),
              prefixIcon: Icon(
                leadingIcon,
                size: 23,
                color: Colors.black87,
              ),
              suffixIcon: Icon(trailingIcon),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}

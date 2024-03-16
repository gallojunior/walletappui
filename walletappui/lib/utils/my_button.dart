import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final iconImagePath;
  final String buttonText;

  const MyButton(
      {super.key, required this.iconImagePath, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // icon
        Container(
          height: 80,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              //color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 30,
                  spreadRadius: 10,
                )
              ]),
          child: Center(
            child: Image.asset(iconImagePath),
          ),
        ),
        // text
        SizedBox(height: 4),
        Text(buttonText,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700])),
      ],
    );
  }
}

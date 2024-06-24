import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final Color color;
  final String title;
  final VoidCallback onPressed;

  const Buttons(
      {super.key,
        required this.title,
        required this.onPressed,
        this.color = const Color(0xffa5a5a5)});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: width * 0.02),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: width * 0.18,
          width: width * 0.18,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          child: Center(
            child: Text(
              title,
              style: TextStyle(fontSize: width * 0.06, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Commonheader extends StatefulWidget {
  const Commonheader({super.key});

  @override
  State<Commonheader> createState() => _CommonheaderState();
}

class _CommonheaderState extends State<Commonheader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: ShapeDecoration(
            color: Color(0xFFF5F4F7), // Background color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Border radius
              // side: BorderSide(
              //   color: Colors.red, // Border color
              //   width: 2.0, // Border width
              // ),
            ),
          ),
          child: Center(child: Image.asset('lib/assets/icons/back.png')),
        ),
        Text(
          'Add Listing',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF242B5C),
            fontSize: 15,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox()
      ],
    );
  }
}

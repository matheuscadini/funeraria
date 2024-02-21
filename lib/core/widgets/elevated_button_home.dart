
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ElevatedButtonHome extends StatelessWidget {
  String title;
  Function() ontap;
  ElevatedButtonHome({
    Key? key,
    required this.title,
     required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 60,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(const Color.fromARGB(255, 128, 138, 131)),
        ),
        onPressed:  ontap,
        child: Text(title),
      ),
    );
  }
}

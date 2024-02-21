// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ActionButtonWidget extends StatelessWidget {
  String title;
  Function() ontap;
  Color color;
  int? width = 200;
  ActionButtonWidget({
    Key? key,
    required this.title,
    required this.ontap,
    required this.color,
    
   
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 30,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(color),
        ),
        onPressed:  ontap,
        child: Text(title),
      ),
    );
  }
}

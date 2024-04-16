// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ButtonCreateNew extends StatelessWidget {
  final void Function()? onPressed;
  final String buttonText;

  const ButtonCreateNew({
    Key? key,
    this.onPressed,
    this.buttonText = 'Create new',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(150, 35),
        side: const BorderSide(
          width: 1.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Text(buttonText),
    );
  }
}

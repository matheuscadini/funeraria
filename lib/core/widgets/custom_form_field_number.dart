import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../styles/custom_colors.dart';

class CustomTextFormFieldNumber extends StatefulWidget {
  final TextEditingController controller;
  final bool isPasswordField;
  final IconData? icons;
  final String? hintLabel;
  final TextInputType? keyboard;

  const CustomTextFormFieldNumber({
    Key? key,
    required this.controller,
    this.isPasswordField = false,
    this.icons,
    this.hintLabel,
    this.keyboard,
  }) : super(key: key);

  @override
  State<CustomTextFormFieldNumber> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormFieldNumber> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        keyboardType: widget.keyboard,
        style: const TextStyle(fontSize: 14, color: Colors.black),
        textAlignVertical: TextAlignVertical.center,
        obscureText: (widget.isPasswordField) ? !visible : false,
        controller: widget.controller,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          //border: InputBorder.none,
          // icon: Icon(widget.icons, color: CustomColors.borderFormLogin),
          isDense: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: CustomColors.borderFormLogin),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
          hintText: widget.hintLabel,
          hintStyle: TextStyle(color: CustomColors.hintFormLogin),
          contentPadding: const EdgeInsets.all(12),
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),

          filled: true,
          suffixIcon: _getSuffix(),
        ),
      ),
    );
  }

  _getSuffix() {
    if (!widget.isPasswordField) return;
    return IconButton(
      onPressed: () {
        visible = !visible;
        setState(() {});
      },
      icon: Icon(
        visible ? Icons.visibility : Icons.visibility_off,
        color: CustomColors.hintFormLogin,
      ),
    );
  }
}

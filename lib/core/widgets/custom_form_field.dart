import 'package:flutter/material.dart';

import '../styles/custom_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final bool isPasswordField;
  final IconData? icons;
  final String? hintLabel;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    this.isPasswordField = false,
    this.icons,
    this.hintLabel,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        style: const TextStyle(fontSize: 14, color: Colors.white),
        textAlignVertical: TextAlignVertical.center,
        obscureText: (widget.isPasswordField) ? !visible : false,
        controller: widget.controller,
        decoration: InputDecoration(
          icon: Icon(widget.icons, color: CustomColors.borderFormLogin),
          isDense: true,
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: CustomColors.borderFormLogin, width: 1),
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

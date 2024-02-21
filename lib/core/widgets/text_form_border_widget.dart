import 'package:flutter/material.dart';

textFormBorderWidgets(
    {required TextEditingController controller,
    required String label,
    required String hintDoTexto}) {
  return SizedBox(
    height: 30,
    width: 200,
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Color.fromARGB(221, 73, 73, 73)),
       // hintText: hintDoTexto,
        hintStyle: const TextStyle(color: Colors.grey),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.black),
        ),
        label: Text(label),
        //suffixText: 'kg',
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    ),
  );
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../styles/custom_colors.dart';

// ignore: must_be_immutable
class TextFormDateWidget extends StatelessWidget {
  TextEditingController dataVisita;
  String label;
  String hint;

  TextFormDateWidget({
    Key? key,
    required this.dataVisita,
    required this.label,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 150,
      child: TextFormField(
        readOnly: true,
        controller: dataVisita,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 0, 50, 10),
          labelStyle: const TextStyle(
            color: Color.fromARGB(221, 73, 73, 73),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.black),
          ),
          labelText: label,
          hintText: hint,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
          ),
        ),
        onTap: () async {
          await showDatePicker(
            builder: (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(
                    primary: CustomColors.background,
                  ),
                  textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                      //primary: CustomColors.textwhite,
                      backgroundColor: CustomColors.background,
                    ),
                  ),
                ),
                child: child!,
              );
            },
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2099),
          ).then((selectedDate) {
            if (selectedDate != null) {
              dataVisita.text = DateFormat('dd/MM/yyyy').format(selectedDate);
            }
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter date.';
          }
          return null;
        },
      ),
    );
  }
}

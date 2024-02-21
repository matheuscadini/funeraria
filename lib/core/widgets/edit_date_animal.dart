import 'package:flutter/material.dart';
import 'package:flutter_funeraria/core/widgets/text_form_date_widget.dart';

editDateCaixao({
  required TextEditingController controller,
  required String label,
  String? hint,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Row(
      children: [
        Text('$hint:'),
        const SizedBox(width: 8),
        Expanded(
          child: TextFormDateWidget(
            dataVisita: controller,
            label: label,
            hint: hint ?? '',
          ),
        ),
      ],
    ),
  );
}

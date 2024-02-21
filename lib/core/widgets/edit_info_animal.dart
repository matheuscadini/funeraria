import 'package:flutter/material.dart';
import 'package:flutter_funeraria/core/widgets/text_form_border_widget.dart';

editInfoCaixao({
  required TextEditingController controller,
  required String label,
  required String info,
  String? hint,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Row(
      children: [
        Text("$info:"),
        const SizedBox(width: 8),
        Expanded(
          child: textFormBorderWidgets(
              controller: controller, label: label, hintDoTexto: hint ?? ''),
        ),
      ],
    ),
  );
}

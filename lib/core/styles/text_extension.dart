import 'package:flutter/material.dart';

import 'custom_colors.dart';

extension TextExtension on Text {
  Text get textLogin => Text(
        data!,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 14,
          color: const Color.fromARGB(255, 249, 249, 252).withOpacity(0.0),
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      );
  Text get menuUnselected => Text(
        data!,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 14,
          color: const Color(0xFFCBCBCD).withOpacity(0.75),
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      );

  Text get menuSelected => Text(
        data!,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 14,
          color: CustomColors.textwhite,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
      );

  Text get funerariaView => Text(
        data!,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          color: Color.fromARGB(255, 8, 8, 8),
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      );
  Text get proprietatioMainLayout => Text(
        data!,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          color: CustomColors.textwhite,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      );
  Text get textButtonRegister => Text(
        data!,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          color: CustomColors.textwhite,
        ),
      );
  Text get nomeCampo => Text(
        data!,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 15,
          color: Color(0xFF313138),
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
        ),
      );
}

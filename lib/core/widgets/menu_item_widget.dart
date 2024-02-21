
import 'package:flutter/material.dart';
import 'package:flutter_funeraria/core/styles/text_extension.dart';

import '../styles/custom_colors.dart';


class MenuItemWidget extends StatelessWidget {
  final String title;
  //final String icon;
  final bool isSelected;
  final Function onClick;

  const MenuItemWidget({
    required this.title,
    //required this.icon,
    this.isSelected = false,
    required this.onClick,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Container(
         height: 40,
        
        color: isSelected ? CustomColors.selectedItem.withOpacity(0.8) : CustomColors.background,
        child: Row(
          children: [
            /* Container(
              height: 3,
              width: 8,
              color: isSelected ? Colors.white : Colors.transparent,
            ), */
            
            /* SvgPicture.asset(
              icon,
            ), */
            const SizedBox(
              width: 8,
            ),
            if (MediaQuery.of(context).size.width > 700)
              isSelected
                  ? Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                    ).menuSelected
                  : Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                    ).menuUnselected
          ],
        ),
      ),
    );
  }
}

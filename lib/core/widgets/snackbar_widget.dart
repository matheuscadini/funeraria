import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

snackbarWidget({String? title, String? icon}) async {
  return Get.rawSnackbar(
    duration: const Duration(seconds: 3),
    snackStyle: SnackStyle.GROUNDED,
    borderRadius: 2,
    borderWidth: 0,
    forwardAnimationCurve: Curves.easeInCubic,
    reverseAnimationCurve: Curves.easeInCubic,
    maxWidth: 400,
    padding: const EdgeInsets.all(0),
    messageText: Container(
      width: 400,
      height: 48,
      color: const Color(0XFFFFFFFF),
      child: Row(
        children: [
          SvgPicture.asset(
            icon!,
            height: 20,
            width: 20,
          ).paddingOnly(right: 18, left: 26),
          // const SizedBox(width: 18),
          Text(
            title!,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF313138),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),

          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.close,
              color: Color(0XFF9FA2B4),
            ),
          ),
        ],
      ),
    ),
  );
}

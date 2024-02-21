import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ActionDialog extends StatelessWidget {
  String confirmButton;
  String title;
  String subtitle;
  Function()? functionController;

  ActionDialog({
    Key? key,
    this.confirmButton = 'Excluir',
    required this.title,
    this.subtitle = '',
    this.functionController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          height: 223,
          width: 384,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32, 38, 32, 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    title,
                  ),
                ),
                const Divider(
                  height: 2,
                ),
                Text(
                  subtitle,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.red,
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        fixedSize: const Size(152, 40),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('Cancelar'),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.red,
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        fixedSize: const Size(152, 40),
                      ),
                      onPressed: () {
                        functionController!();
                        Get.back();
                      },
                      child: Text(confirmButton),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

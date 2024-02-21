import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  final Function()? confirmFunction;
  final Function()? negativeFunction;
  final String? title;
  final String? subtitle;

  final String confirmOption;

  //final String option;

  const AlertDialogWidget({
    Key? key,
    required this.confirmFunction,
    required this.negativeFunction,
    required this.title,
    required this.subtitle,
    required this.confirmOption,
    // required this.option,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
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
            Text(
              title!,
            ),
            const Divider(
              height: 2,
            ),
            Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
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
                  onPressed: negativeFunction,
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
                  onPressed: confirmFunction,
                  child: Text(confirmOption),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

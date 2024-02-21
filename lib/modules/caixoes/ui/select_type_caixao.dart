//TODO
/* import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oxenfy/core/styles/custom_colors.dart';
import 'package:oxenfy/core/widgets/action_button_widget.dart';
import 'package:oxenfy/modules/animais/application/animal_controller.dart';
import 'package:oxenfy/modules/animais/ui/create_new_animal_screen.dart';

class SelectTypeAnimalScreen extends StatefulWidget {
  AnimalController animalController;
  SelectTypeAnimalScreen({
    Key? key,
    required this.animalController,
  }) : super(key: key);

  @override
  State<SelectTypeAnimalScreen> createState() => _SelectTypeAnimalScreenState();
}

class _SelectTypeAnimalScreenState extends State<SelectTypeAnimalScreen> {
  RxBool? bezerro = false.obs;
  RxBool? adulto = false.obs;
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            //width: 450,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => Checkbox(
                    value: bezerro?.value,
                    onChanged: (bool? value) {
                      bezerro!.value = value!;
                      adulto!.value = false;
                      bezerro!.value == true;
                    },
                  ),
                ),
                const Text("Bezerro"),
                const SizedBox(
                  width: 20,
                ),
                Obx(
                  () => Checkbox(
                      value: adulto!.value,
                      onChanged: (bool? value) {
                        adulto!.value = value!;
                        bezerro!.value = false;
                      }),
                ),
                const Text("Adulto"),
                const SizedBox(
                  height: 20,
                ),
                ActionButtonWidget(
                    ontap: () {
                      if (bezerro!.value == true || adulto!.value == true) {
                        Get.back();
                        Get.dialog(
                          CreateNewAnimalScreen(
                            animalController: AnimalController(),
                            bezerro: bezerro!.value,
                          ),
                        );
                      }
                    },
                    title: 'Continuar',
                    color: CustomColors.buttonAdd),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
 */
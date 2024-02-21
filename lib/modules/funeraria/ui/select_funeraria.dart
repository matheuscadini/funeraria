import 'package:flutter/material.dart';
import 'package:flutter_funeraria/core/models/funeraria_model.dart';
import 'package:flutter_funeraria/modules/funeraria/application/funeraria_controller.dart';
import 'package:get/get.dart';
import 'package:selection_menu/components_configurations.dart';
import 'package:selection_menu/selection_menu.dart';

import '../../../core/routes/routes_getx.dart';
import '../../../core/styles/custom_colors.dart';

class SelectFarm extends StatefulWidget {
  const SelectFarm({Key? key}) : super(key: key);

  @override
  State<SelectFarm> createState() => _SelectFarmState();
}

class _SelectFarmState extends State<SelectFarm> {
  FunerariaController funerariaController = Get.find();
  final SelectionMenuController selectionMenuController =
      SelectionMenuController();
  @override
  void initState() {
    super.initState();

    funerariaController.getFunerarias();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: Center(
        child: Obx(
          () => funerariaController.listaFunerarias.isEmpty
              ? const CircularProgressIndicator(
                  strokeWidth: 0.8,
                  color: Colors.white,
                )
              : SizedBox(
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: const Color.fromARGB(158, 138, 136, 136),
                        child: Center(
                          child: SelectionMenu<String>(
                            componentsConfiguration:
                                DialogComponentsConfiguration(
                              triggerComponent:
                                  TriggerComponent(builder: _triggerBuilder),
                            ),
                            showSelectedItemAsTrigger: true,
                            itemsList: list,
                            onItemSelected: (String selectedItem) {
                              FunerariaModel funerariaSelecionada =
                                  funerariaController.listaFunerarias.firstWhere(
                                      (element) =>
                                          element.nome == selectedItem);
                              funerariaController.funerariaSelecionada.value =
                                  funerariaSelecionada;
                              funerariaController.save(funerariaSelecionada);
                            },
                            itemBuilder: (BuildContext context, String item,
                                OnItemTapped onItemTapped) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 1),
                                height: 30,
                                color: const Color.fromARGB(31, 45, 107, 30),
                                child: InkWell(
                                  onTap: onItemTapped,
                                  child: Center(child: Text(item)),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      funerariaController.funerariaSelecionada.value.id == null
                          ? Container()
                          : ElevatedButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 16,
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color.fromARGB(31, 95, 95, 95)),
                              ),
                              child: const Text(
                                'Avançar',
                                style: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 2,
                                    fontSize: 16),
                              ),
                              onPressed: () {
                                Get.offAllNamed(RoutesGetx.mainLayoutScreen);
                              },
                            ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Cadastrar nova funeraria',
                          style: TextStyle(
                              color: Color.fromARGB(31, 255, 255, 255),
                              letterSpacing: 2,
                              fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  List<String> get list {
    List<String> itemFuneraria = [];
    for (var i = 0; i < funerariaController.listaFunerarias.length; i++) {
      itemFuneraria.add(funerariaController.listaFunerarias[i].nome.toString());
    }
    return itemFuneraria;
  }

  static Widget _triggerBuilder(TriggerComponentData data) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            //shadowColor: Colors.yellow,
            primary: CustomColors.backgroundTextFormField
            //backgroundColor: Colors.white,
            //TODO verificar essa cor
            ),
        onPressed: data.triggerMenu,
        child: const Text(
          "Selecione a funeraria",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

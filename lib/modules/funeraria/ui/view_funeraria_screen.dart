import 'package:flutter/material.dart';
import 'package:flutter_funeraria/modules/funeraria/application/funeraria_controller.dart';
import 'package:get/get.dart';

class ViewFunerariaScreen extends StatelessWidget {
  FunerariaController funerariaController;
  ViewFunerariaScreen({
    Key? key,
    required this.funerariaController,
  }) : super(key: key);
  TextEditingController propietarioController = TextEditingController();
  TextEditingController nomeFunerariaController = TextEditingController();
  TextEditingController estadoController = TextEditingController();
  TextEditingController cidadeController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  rowDataFarm(
                    info: 'Nome da funeraria:',
                    data: funerariaController
                        .funerariaSelectedEdition.value.nome
                        .toString(),
                    controller: nomeFunerariaController,
                  ),
                  rowDataFarm(
                      info: 'Propietário',
                      data: funerariaController
                          .funerariaSelectedEdition.value.proprietario
                          .toString(),
                      controller: propietarioController),
                  rowDataFarm(
                      info: 'Telefone',
                      data: funerariaController
                          .funerariaSelectedEdition.value.telefone
                          .toString(),
                      controller: telefoneController),
                  rowDataFarm(
                      info: 'Estado',
                      data: funerariaController
                          .funerariaSelectedEdition.value.estado
                          .toString(),
                      controller: estadoController),
                  rowDataFarm(
                      info: 'Cidade',
                      data: funerariaController
                          .funerariaSelectedEdition.value.cidade
                          .toString(),
                      controller: cidadeController),
                  rowDataFarm(
                      info: 'Endereço',
                      data: funerariaController
                          .funerariaSelectedEdition.value.rua
                          .toString(),
                      controller: enderecoController),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          funerariaController.funerariaSelecionada =
                              funerariaController.funerariaSelectedEdition;
                          Get.back();
                        },
                        child: const Text('Acessar'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Salvar'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          funerariaController.deleteFunerarias(
                              funerariaController
                                  .funerariaSelectedEdition.value.id
                                  .toString());
                          funerariaController.getFunerarias();
                          Get.back();
                        },
                        child: const Text('Excluir'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('Cancelar'),
                      ),
                    ],
                  )
                ],
              ),
            ))
      ],
    );
  }

  Row rowDataFarm(
      {required String info,
      required String data,
      required TextEditingController controller}) {
    return Row(
      children: [
        Text(
          info,
        ),
        const SizedBox(
          width: 5,
        ),
        SizedBox(
          width: 200,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: (data),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}

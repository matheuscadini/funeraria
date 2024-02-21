import 'package:flutter/material.dart';
import 'package:flutter_funeraria/core/models/caixao_model.dart';
import 'package:flutter_funeraria/modules/caixoes/application/caixao_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../core/widgets/edit_date_animal.dart';
import '../../../core/widgets/edit_info_animal.dart';

class EditCaixaoScreen extends StatelessWidget {
  CaixaoController caixaoController;

  EditCaixaoScreen({
    Key? key,
    required this.caixaoController,
  }) : super(key: key);
  TextEditingController idAnimalController = TextEditingController();
  TextEditingController sexoController = TextEditingController();
  TextEditingController dataNascimentoController = TextEditingController();
  TextEditingController pesoNascimentoController = TextEditingController();
  TextEditingController dataDesmamaController = TextEditingController();
  TextEditingController pesoDesmamaController = TextEditingController();
  TextEditingController ultimoPesoController = TextEditingController();
  TextEditingController dataPesagemController = TextEditingController();
  TextEditingController idMaeController = TextEditingController();
  TextEditingController idPaiController = TextEditingController();

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
                  Text(
                    'ID do Caixão: ${caixaoController.caixaoSelectedEdition.value.idCaixao.toString()}',
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  editDateCaixao(
                    controller: dataNascimentoController,
                    label:
                        '${caixaoController.caixaoSelectedEdition.value.dataUltimaVenda?.day}-${caixaoController.caixaoSelectedEdition.value.dataUltimaVenda?.month}-${caixaoController.caixaoSelectedEdition.value.dataUltimaVenda?.year}',
                    hint: 'Data de nascimento',
                  ),
                  editDateCaixao(
                    controller: dataDesmamaController,
                    label:
                        '${caixaoController.caixaoSelectedEdition.value.dataUltimaVenda?.day}-${caixaoController.caixaoSelectedEdition.value.dataUltimaVenda?.month}-${caixaoController.caixaoSelectedEdition.value.dataUltimaVenda?.year}',
                    hint: 'Data da desmama',
                  ),
                  editInfoCaixao(
                      info: 'ID mãe',
                      controller: idMaeController,
                      label: caixaoController.caixaoSelectedEdition.value.codigo
                          .toString()),
                  editInfoCaixao(
                      info: 'ID pai',
                      controller: idMaeController,
                      label: caixaoController
                          .caixaoSelectedEdition.value.descricao
                          .toString()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          editCaixao(CaixaoModel(
                            idCaixao: idMaeController.text.isEmpty
                                ? caixaoController
                                    .caixaoSelectedEdition.value.codigo
                                : idMaeController.text,
                            dataUltimaVenda:
                                dataNascimentoController.text.isEmpty
                                    ? caixaoController.caixaoSelectedEdition
                                        .value.dataUltimaVenda
                                    : DateFormat('dd/MM/yyyy')
                                        .parse(dataNascimentoController.text),
                            codigo: idMaeController.text.isEmpty
                                ? caixaoController
                                    .caixaoSelectedEdition.value.codigo
                                : idMaeController.text,
                            descricao: idPaiController.text.isEmpty
                                ? caixaoController
                                    .caixaoSelectedEdition.value.descricao
                                : idPaiController.text,
                          ));
                          Get.back();
                        },
                        child: const Text('Salvar'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          deleteCaixao(caixaoController
                              .caixaoSelectedEdition.value.id
                              .toString());
                          Get.back();
                        },
                        child: const Text('Excluir'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('Ok'),
                      ),
                    ],
                  )
                ],
              ),
            ))
      ],
    );
  }

  void editCaixao(CaixaoModel caixaoModel) {
    caixaoController.editCaixoes(
        caixaoEdit: caixaoModel,
        id: caixaoController.caixaoSelectedEdition.value.id.toString());
  }

  deleteCaixao(String id) {
    caixaoController.deleteCaixoes(id);
  }
}

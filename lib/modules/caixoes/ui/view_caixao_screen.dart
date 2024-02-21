import 'package:flutter/material.dart';
import 'package:flutter_funeraria/core/models/caixao_model.dart';
import 'package:flutter_funeraria/modules/caixoes/application/caixao_controller.dart';
import 'package:get/get.dart';

import '../../../core/styles/custom_colors.dart';
import 'edit_caixao_screen.dart';

class ViewCaixaoScreen extends StatelessWidget {
  CaixaoController caixaoController;

  ViewCaixaoScreen({
    Key? key,
    required this.caixaoController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        Center(
          child: Container(
              width: 1000,
              height: 1000,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      fit: StackFit.expand,
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            caixaoController
                                .caixaoSelectedEdition.value.valorVenda
                                .toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 18,
                          right: 18,
                          child: Container(
                            height: 32,
                            width: 32,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0XFF313138)),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              color: CustomColors.backgroundTextFormField,
                              onPressed: () {},
                              icon: const Icon(
                                Icons.close_outlined,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    /* TODO
 DADOS que pode ser mostrado na tela  
  double? ganhoPesoDiario;
  String? destino;
  double? valorVenda;
  bool? touro;
  String? nomeTouro; */
                    textViewCaixao(
                        label: 'ID Caixao',
                        context: caixaoController
                            .caixaoSelectedEdition.value.codigo
                            .toString()),
                    textViewCaixao(
                        label: 'Data de Nascimento',
                        context: caixaoController
                            .caixaoSelectedEdition.value.fornecedor
                            .toString()),
                    textViewCaixao(
                        label: 'Data da desmama',
                        context: (caixaoController
                            .caixaoSelectedEdition.value.descricao
                            .toString())),
                    textViewCaixao(
                        label: 'ID mãe',
                        context: caixaoController
                            .caixaoSelectedEdition.value.codigo
                            .toString()),
                    textViewCaixao(
                        label: 'ID pai',
                        context: caixaoController
                            .caixaoSelectedEdition.value.descricao
                            .toString()),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Get.dialog(
                              EditCaixaoScreen(
                                caixaoController: caixaoController,
                              ),
                            );
                          },
                          child: const Text('Editar'),
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
                          child: const Text('Cancelar'),
                        ),
                      ],
                    )
                  ],
                ),
              )),
        )
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

  textViewCaixao({
    required String label,
    required String context,
  }) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        width: 260,
        color: CustomColors.backgroundScaffold,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                    text: '$label : ',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

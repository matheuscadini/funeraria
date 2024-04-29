// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_funeraria/core/styles/text_extension.dart';
import 'package:flutter_funeraria/modules/caixoes/application/caixao_controller.dart';
import 'package:flutter_funeraria/modules/caixoes/ui/select_caixao_venda.dart';
import 'package:flutter_funeraria/modules/funeraria/application/funeraria_controller.dart';
import 'package:flutter_funeraria/modules/venda/application/venda_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../core/styles/custom_colors.dart';
import '../../../core/widgets/button_create_new.dart';
import '../../../core/widgets/convert_monetario.dart';
import '../../../core/widgets/custom_form_field.dart';
import '../../../core/widgets/snackbar_widget.dart';

// ignore: must_be_immutable
class CreateNewVendaScreen extends StatefulWidget {
  VendaController vendaController;
  CaixaoController caixaoController;
  late var imageFileScreen;
  late Uint8List file;
  RxBool imageLoaded = false.obs;
  late File foto;

  CreateNewVendaScreen({
    Key? key,
    required this.caixaoController,
    required this.vendaController,
  }) : super(key: key);

  @override
  State<CreateNewVendaScreen> createState() => _CreateNewOxScreen();
}

class _CreateNewOxScreen extends State<CreateNewVendaScreen> {
  FunerariaController funerariaController = Get.find();
  //AnimalController animalController = Get.find();

  var weightMaskFormatter = MaskTextInputFormatter(
    mask: '####',
  );
  var maskFormatter = MaskTextInputFormatter(
    mask: '',
  );

  TextEditingController idCaixao = TextEditingController();
  TextEditingController textCaixao = TextEditingController();
  TextEditingController textValor = TextEditingController();

  TextEditingController textObservacao = TextEditingController();
  TextEditingController textClient = TextEditingController();

  @override
  Widget build(BuildContext context) {
    widget.vendaController.caixaoSelecionado.value == null;

    return Obx(
      () => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        height: 550,
        width: 950,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 42, 32, 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Cadastrar Nova Venda",
                      )),
                  Row(
                    children: [
                      IconButton(
                          alignment: Alignment.topRight,
                          icon: SvgPicture.asset(
                            'icons/close_round.svg',
                            height: 24,
                            width: 24,
                          ),
                          onPressed: () {
                            Get.back();
                          }),
                    ],
                  ),
                ],
              ),
              const Divider(
                thickness: 2,
                height: 10,
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: CustomColors.backgroundTextFormField,
                      ),
                      height: 369,
                      child: widget.caixaoController.isLoadingUpload == false
                          ? Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  'icons/figure_survey_stack.png',
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.fitWidth,
                                ),
                              ],
                            )
                          : Stack(
                              fit: StackFit.expand,
                              alignment: Alignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    widget.caixaoController.url.value,
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
                                      color:
                                          CustomColors.backgroundTextFormField,
                                      onPressed: () {
                                        widget.imageLoaded.value = false;
                                      },
                                      icon: const Icon(
                                        Icons.close_outlined,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    flex: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Cliente').nomeCampo,
                            SizedBox(
                              width: 450,
                              child: CustomTextFormField(
                                controller: textClient,
                                hintLabel: "Cliente",
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Caixão').nomeCampo,
                            ButtonCreateNew(
                              buttonText: "Caixão",
                              onPressed: () {
                                Get.dialog(
                                  SimpleDialog(
                                    insetPadding: EdgeInsets.zero,
                                    contentPadding: EdgeInsets.zero,
                                    children: [
                                      VendaCaixaoWidget(
                                        caixaoController:
                                            widget.caixaoController,
                                        vendaController: widget.vendaController,
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                                "${widget.vendaController.caixaoSelecionado.value.descricao} tipo:${widget.vendaController.tipoCaixaoSelecionado.value}"),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Valor').nomeCampo,
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                                width: 450,
                                child: TextFormField(
                                    controller: textValor,
                                    decoration: const InputDecoration(
                                      icon: Icon(Icons.monetization_on),
                                      labelText: 'Valor *',
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      CurrencyPtBrInputFormatter()
                                    ])),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Observações').nomeCampo,
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: 400,
                              child: CustomTextFormField(
                                controller: textObservacao,
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 2,
                          height: 10,
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: BorderSide.none,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                fixedSize: const Size(152, 40),
                              ),
                              onPressed: () {
                                if (textClient.text == "") {
                                  snackbarWidget(
                                      title: 'Um cliente é necessario.',
                                      icon: 'icons/warning_message.svg');
                                } else if (textValor.text == "") {
                                  snackbarWidget(
                                      title: 'Insira o valor',
                                      icon: 'icons/warning_message.svg');
                                } else
                                  addVenda();
                              },
                              child: const Text('Publicar'),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  textDate({
    required TextEditingController dateController,
    required String label,
  }) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        readOnly: true,
        controller: dateController,
        decoration: InputDecoration(
          labelText: label,
        ),
        onTap: () async {
          await showDatePicker(
            builder: (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(
                    primary: CustomColors.background,
                    onPrimary: CustomColors.textwhite,
                  ),
                ),
                child: child!,
              );
            },
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2015),
            lastDate: DateTime(2025),
          ).then((selectedDate) {
            if (selectedDate != null) {
              dateController.text =
                  DateFormat('dd-MM-yyyy').format(selectedDate);
            }
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter date.';
          }
          return null;
        },
      ),
    );
  }

  void addVenda() {
    print(funerariaController.funerariaSelecionada.value.id);
    widget.vendaController.createNewVenda(
        textClient.value.text,
        widget.vendaController.caixaoSelecionado.value,
        widget.vendaController.tipoCaixaoSelecionado.value,
        textValor.text,
        textObservacao.text);
  }

  void clearText() {
    textCaixao.clear();
    textValor.clear();
    textObservacao.clear();
    textClient.clear();
  }
}

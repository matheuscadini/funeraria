// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_funeraria/core/models/caixao_model.dart';
import 'package:flutter_funeraria/modules/caixoes/application/caixao_controller.dart';
import 'package:flutter_funeraria/modules/funeraria/application/funeraria_controller.dart';
import 'package:flutter_funeraria/modules/venda/application/venda_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../core/models/table/caixao_table/caixao_data_table_model.dart';
import '../../../core/styles/custom_colors.dart';
import '../../../core/widgets/custom_form_field.dart';
import '../../../core/widgets/snackbar_widget.dart';
import '../../../core/widgets/table/table_widget.dart';

class CaixaoVendaScreen extends StatefulWidget {
  CaixaoController caixaoController = CaixaoController();
  VendaController vendaController;
  late var imageFileScreen;
  late Uint8List file;
  RxBool imageLoaded = false.obs;
  late File foto;

  CaixaoVendaScreen({
    Key? key,
    required this.vendaController,
  }) : super(key: key);

  @override
  State<CaixaoVendaScreen> createState() => _CreateNewOxScreen();
}

class _CreateNewOxScreen extends State<CaixaoVendaScreen> {
  FunerariaController funerariaController = Get.find();
  //AnimalController animalController = Get.find();

  var weightMaskFormatter = MaskTextInputFormatter(
    mask: '####',
  );
  var maskFormatter = MaskTextInputFormatter(
    mask: '',
  );

  TextEditingController idCaixao = TextEditingController();
  TextEditingController textCodigo = TextEditingController();
  TextEditingController textDescricao = TextEditingController();
  TextEditingController textObservacao = TextEditingController();
  TextEditingController textFornecedor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SimpleDialog(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 42, 32, 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Selecione um caixão para venda",
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
                    flex: 50,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: CustomColors.backgroundTextFormField,
                      ),
                      height: 369,
                      child: widget.imageLoaded.value == false
                          ? Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  'icons/figure_survey_stack.png',
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.fitWidth,
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
                                          color: CustomColors
                                              .backgroundTextFormField,
                                          onPressed: () async {
                                            pickImage();
                                          },
                                          icon: const Icon(Icons.add))),
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
                                    widget.imageFileScreen.path,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                TableWidget(
                  isLoading: false,
                  itens: CaixaoDataTableModel.fromList(
                    list: widget.caixaoController.listCaixoes,
                    caixaoController: widget.caixaoController,
                  ),
                ),
              ],
                ),
                    ),
                  
                ],
              ),
            ],
          ),
        ),
      ]),
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
                  textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                      backgroundColor: CustomColors.background,
                    ),
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

  void addCaixao() {
    print(funerariaController.funerariaSelecionada.value.id);
    widget.caixaoController.createNewCaixao(
        CaixaoModel(
          funerariaModel: funerariaController.funerariaSelecionada.value,
          idCaixao: idCaixao.text,
          funerariaId: funerariaController.funerariaSelecionada.value.id,
          fornecedor: textFornecedor.text,
          descricao: textDescricao.value.text,
          codigo: textCodigo.text,
        ),
        widget.file);
  }

  void clearText() {
    textCodigo.clear();
    textDescricao.clear();
    textObservacao.clear();
    textFornecedor.clear();
  }

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    widget.imageFileScreen = image;
    Uint8List data = await image!.readAsBytes();
    widget.file = data;
    widget.imageLoaded.value = true;
  }
}

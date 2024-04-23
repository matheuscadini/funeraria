// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_funeraria/modules/caixoes/application/caixao_controller.dart';
import 'package:flutter_funeraria/modules/funeraria/application/funeraria_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../core/styles/custom_colors.dart';
import '../../../core/widgets/custom_form_field_number.dart';
import '../../../core/widgets/snackbar_widget.dart';

class VisualizarCaixaoScreen extends StatefulWidget {
  CaixaoController caixaoController;
  late var imageFileScreen;
  late Uint8List file;
  RxBool imageLoaded = false.obs;
  late File foto;

  VisualizarCaixaoScreen({
    Key? key,
    required this.caixaoController,
  }) : super(key: key);

  @override
  State<VisualizarCaixaoScreen> createState() => _CreateNewOxScreen();
}

class _CreateNewOxScreen extends State<VisualizarCaixaoScreen> {
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
  TextEditingController textQuantidadeNormal = TextEditingController(text: "0");
  TextEditingController textQuantidadeGordo = TextEditingController(text: "0");
  TextEditingController textQuantidadeAlto = TextEditingController(text: "0");
  TextEditingController textQuantidadeAltoGordo =
      TextEditingController(text: "0");

  @override
  Widget build(BuildContext context) {
    widget.caixaoController.getFoto(
        widget.caixaoController.caixaoSelectedEdition.value.valorVenda!);
    widget.imageLoaded.value == true;
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
                        "Cadastrar novo Caixão",
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text('Fornecedor: '),
                            Text(widget.caixaoController.caixaoSelectedEdition
                                .value.fornecedor!)
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Código'),
                            SizedBox(
                              width: 380,
                              child: Text(widget.caixaoController
                                  .caixaoSelectedEdition.value.codigo!),
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
                            const Text('Descrição'),
                            SizedBox(
                              width: 380,
                              child: Text(widget.caixaoController
                                  .caixaoSelectedEdition.value.descricao!),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Observações'),
                            SizedBox(
                              width: 380,
                              child: Text("existe?"),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text('Normal:   '),
                                Text(
                                    "Estoque: ${widget.caixaoController.caixaoSelectedEdition.value.quantidadeTipoNormal}    Comprar:   "),
                                SizedBox(
                                  width: 60,
                                  child: TextFormField(
                                    controller: textQuantidadeNormal,
                                    decoration: const InputDecoration(
                                      labelText: 'Valor',
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text('Gordo:   '),
                                Text(
                                    "Estoque: ${widget.caixaoController.caixaoSelectedEdition.value.quantidadeTipoGordo}    Comprar:   "),
                                SizedBox(
                                  width: 60,
                                  child: CustomTextFormFieldNumber(
                                    controller: textQuantidadeGordo,
                                    keyboard: TextInputType.number,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text('Alto:   '),
                                Text(
                                    "Estoque: ${widget.caixaoController.caixaoSelectedEdition.value.quantidadeTipoAlto}    Comprar:   "),
                                SizedBox(
                                  width: 60,
                                  child: CustomTextFormFieldNumber(
                                    controller: textQuantidadeAlto,
                                    keyboard: TextInputType.number,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text('Alto e Gordo:   '),
                                Text(
                                    "Estoque: ${widget.caixaoController.caixaoSelectedEdition.value.quantidadeGordoAlto}    Comprar:   "),
                                SizedBox(
                                  width: 60,
                                  child: CustomTextFormFieldNumber(
                                    controller: textQuantidadeAltoGordo,
                                    keyboard: TextInputType.number,
                                  ),
                                )
                              ],
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: CustomColors.background,
                                side: BorderSide.none,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                fixedSize: const Size(152, 40),
                              ),
                              onPressed: () {
                                compraCaixao();
                              },
                              child: const Text('Comprar'),
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

  void compraCaixao() async {
    await widget.caixaoController.editCaixoes(
        quantidadeAlto: int.parse(textQuantidadeAlto.value.text) +
            widget.caixaoController.caixaoSelectedEdition.value
                .quantidadeTipoAlto!,
        quantidadeNormal: int.parse(textQuantidadeNormal.value.text) +
            widget.caixaoController.caixaoSelectedEdition.value
                .quantidadeTipoNormal!,
        quantidadeGordo: int.parse(textQuantidadeGordo.value.text) +
            widget.caixaoController.caixaoSelectedEdition.value
                .quantidadeTipoGordo!,
        quantidadeAltoGordo: int.parse(textQuantidadeAltoGordo.value.text) +
            widget.caixaoController.caixaoSelectedEdition.value
                .quantidadeGordoAlto!,
        datacompra: DateTime.now(),
        id: widget.caixaoController.caixaoSelectedEdition.value.id!);

    clearText();
    snackbarWidget(
        title: 'Caixão Cadastrado com Sucesso.', icon: 'icons/Key.svg');
  }

  void clearText() {
    textCodigo.clear();
    textDescricao.clear();
    textObservacao.clear();
    textFornecedor.clear();
    textQuantidadeAlto.clear();
    textQuantidadeAltoGordo.clear();
    textQuantidadeGordo.clear();
    textQuantidadeNormal.clear();
    widget.imageLoaded.value == false;
  }

  pickImage() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);

    //widget.foto = File(image.path);
    widget.imageFileScreen = image;
    Uint8List data = await image!.readAsBytes();
    widget.file = data;
    widget.imageLoaded.value = true;
  }
}

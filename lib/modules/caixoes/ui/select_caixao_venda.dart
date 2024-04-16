import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_funeraria/core/models/table/caixao_table/caixao_venda_data_table_model.dart';
import 'package:flutter_funeraria/modules/caixoes/application/caixao_controller.dart';
import 'package:flutter_funeraria/modules/venda/application/venda_controller.dart';
import 'package:flutter_funeraria/modules/venda/ui/tipo_caixao_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/styles/custom_colors.dart';
import '../../../core/widgets/button_create_new.dart';
import '../../../core/widgets/table/table_widget.dart';
import '../../funeraria/application/funeraria_controller.dart';

class VendaCaixaoWidget extends StatelessWidget {
  final VendaController vendaController;
  final CaixaoController caixaoController;
  FunerariaController funerariaController = Get.find();
  late var imageFileScreen;
  late Uint8List file;
  late File foto;

  //final DashboardController? dashboardController;
  VendaCaixaoWidget({
    Key? key,
    required this.vendaController,
    required this.caixaoController,
    //this.dashboardController,
  }) : super(key: key);
  final ScrollController _horizontal = ScrollController(),
      _vertical = ScrollController();
  @override
  Widget build(BuildContext context) {
    caixaoController.filterCaixoesByFuneraria(
        funerariaController.funerariaSelecionada.value.id.toString());

    return Obx(
      () {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          height: 600,
          width: 850,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32, 42, 32, 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Selecione o Caixão",
                        ),
                      ),
                      SingleChildScrollView(
                        child: Row(
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
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 2,
                    height: 10,
                  ).paddingOnly(bottom: 32),
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
                          child: caixaoController.isLoadingUpload == false
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
                                        caixaoController.url.value,
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
                                          color: CustomColors
                                              .backgroundTextFormField,
                                          onPressed: () {
                                            caixaoController
                                                .isLoadingUpload.value = false;
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
                      const SizedBox(width: 40),
                      Container(
                        height: 400,
                        width: 500,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TableWidget(
                                    isLoading: false,
                                    itens: CaixaoVendaDataTableModel.fromList(
                                        list: caixaoController.listCaixoes,
                                        vendaController: vendaController,
                                        caixaoController: caixaoController),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ButtonCreateNew(
                        buttonText: "Caixão",
                        onPressed: () {
                          Get.dialog(
                            SimpleDialog(
                              insetPadding: EdgeInsets.zero,
                              contentPadding: EdgeInsets.zero,
                              children: [
                                TipoCaixaoWidget(
                                  vendaController: vendaController,
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    imageFileScreen = image;
    Uint8List data = await image!.readAsBytes();
    file = data;
    caixaoController.isLoadingUpload.value = true;
  }
}

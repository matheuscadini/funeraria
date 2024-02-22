import 'package:flutter/material.dart';
import 'package:flutter_funeraria/core/models/table/caixao_table/caixao_venda_data_table_model.dart';
import 'package:flutter_funeraria/modules/caixoes/application/caixao_controller.dart';
import 'package:flutter_funeraria/modules/venda/application/venda_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/styles/custom_colors.dart';
import '../../../core/widgets/table/table_widget.dart';
import '../../funeraria/application/funeraria_controller.dart';

class VendaCaixaoWidget extends StatelessWidget {
  final VendaController vendaController;
  final CaixaoController caixaoController;
  FunerariaController funerariaController = Get.find();

  //final DashboardController? dashboardController;
  VendaCaixaoWidget({
    Key? key,
    required this.vendaController,
    required this.caixaoController,
    //this.dashboardController,
  }) : super(key: key);

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
          height: 525,
          width: 821,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32, 42, 32, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Caixões",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.3,
                        ),
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
                    const SizedBox(width: 40),
                    Expanded(
                      flex: 60,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: TableWidget(
                          isLoading: false,
                          itens: CaixaoVendaDataTableModel.fromList(
                              list: caixaoController.listCaixoes,
                              vendaController: vendaController,
                              caixaoController: caixaoController),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

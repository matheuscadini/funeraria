import 'package:flutter/material.dart';
import 'package:flutter_funeraria/core/models/table/caixao_table/caixao_data_table_model.dart';
import 'package:flutter_funeraria/core/models/table/venda_table/venda_data_table_model.dart';
import 'package:flutter_funeraria/core/styles/text_extension.dart';
import 'package:flutter_funeraria/modules/caixoes/application/caixao_controller.dart';
import 'package:flutter_funeraria/modules/funeraria/application/funeraria_controller.dart';
import 'package:flutter_funeraria/modules/venda/application/venda_controller.dart';
import 'package:flutter_funeraria/modules/venda/ui/nova_venda_screen.dart';
import 'package:get/get.dart';
import '../../../core/widgets/table/table_widget.dart';

class VendasScreen extends StatefulWidget {
  const VendasScreen({Key? key}) : super(key: key);

  @override
  State<VendasScreen> createState() => _VendasScreenState();
}

class _VendasScreenState extends State<VendasScreen> {
  VendaController vendaController = VendaController();
  FunerariaController funerariaController = Get.find();

  @override
  void initState() {
    super.initState();
    vendaController.filterVendasByFuneraria(
        funerariaController.funerariaSelecionada.value.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "caixões Cadastrados: ${vendaController.listVendas.length}"),
                const SizedBox(height: 15),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 16,
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  child: const Text(
                    'Nova Venda',
                  ).textButtonRegister,
                  onPressed: () => Get.dialog(
                    CreateNewVendaScreen(
                      vendaController: vendaController,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TableWidget(
                  isLoading: false,
                  itens: VendaDataTableModel.fromList(
                    list: vendaController.listVendas,
                    vendaController: vendaController,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

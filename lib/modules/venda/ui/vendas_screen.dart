import 'package:flutter/material.dart';
import 'package:flutter_funeraria/core/models/table/venda_table/venda_data_table_model.dart';
import 'package:flutter_funeraria/modules/caixoes/application/caixao_controller.dart';
import 'package:flutter_funeraria/modules/funeraria/application/funeraria_controller.dart';
import 'package:flutter_funeraria/modules/venda/application/venda_controller.dart';
import 'package:flutter_funeraria/modules/venda/ui/nova_venda_screen.dart';
import 'package:get/get.dart';
import '../../../core/widgets/button_create_new.dart';
import '../../../core/widgets/table/table_widget.dart';

class VendasScreen extends StatefulWidget {
  const VendasScreen({Key? key}) : super(key: key);

  @override
  State<VendasScreen> createState() => _VendasScreenState();
}

class _VendasScreenState extends State<VendasScreen> {
  VendaController vendaController = VendaController();
  FunerariaController funerariaController = Get.find();
  CaixaoController caixaoController = CaixaoController();

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
                Text("Vendas: ${vendaController.listVendas.length}"),
                const SizedBox(height: 15),
                ButtonCreateNew(
                  buttonText: "Nova Venda",
                  onPressed: () {
                    Get.dialog(
                      SimpleDialog(
                        insetPadding: EdgeInsets.zero,
                        contentPadding: EdgeInsets.zero,
                        children: [
                          CreateNewVendaScreen(
                            vendaController: vendaController,
                            caixaoController: caixaoController,
                          )
                        ],
                      ),
                    );
                  },
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

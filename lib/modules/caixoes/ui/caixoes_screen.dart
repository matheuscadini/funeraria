import 'package:flutter/material.dart';
import 'package:flutter_funeraria/core/models/table/caixao_table/caixao_data_table_model.dart';
import 'package:flutter_funeraria/core/styles/text_extension.dart';
import 'package:flutter_funeraria/modules/caixoes/application/caixao_controller.dart';
import 'package:flutter_funeraria/modules/funeraria/application/funeraria_controller.dart';
import 'package:get/get.dart';
import '../../../core/widgets/table/table_widget.dart';
import 'create_new_caixao_screen.dart';

class CaixoesScreen extends StatefulWidget {
  const CaixoesScreen({Key? key}) : super(key: key);

  @override
  State<CaixoesScreen> createState() => _CaixoesScreenState();
}

class _CaixoesScreenState extends State<CaixoesScreen> {
  CaixaoController caixaoController = CaixaoController();
  FunerariaController funerariaController = Get.find();

  @override
  void initState() {
    super.initState();
    caixaoController.filterCaixoesByFuneraria(
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
                    "caixões Cadastrados: ${caixaoController.listCaixoes.length}"),
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
                    'Cadastrar novo Caixão',
                  ).textButtonRegister,
                  onPressed: () => Get.dialog(
                    CreateNewCaixaoScreen(
                      caixaoController: caixaoController,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TableWidget(
                  isLoading: false,
                  itens: CaixaoDataTableModel.fromList(
                    list: caixaoController.listCaixoes,
                    caixaoController: caixaoController,
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

import 'package:flutter/material.dart';
import 'package:flutter_funeraria/modules/funeraria/application/funeraria_controller.dart';
import 'package:get/get.dart';

class FunerariaScreen extends StatefulWidget {
  const FunerariaScreen({Key? key}) : super(key: key);

  @override
  State<FunerariaScreen> createState() => _FunerariaScreenState();
}

class _FunerariaScreenState extends State<FunerariaScreen> {
  FunerariaController funerariaController = Get.find();

  @override
  void initState() {
    super.initState();
    funerariaController.getFunerarias();
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
                const Text("Funerarias"),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 15),
                            hintText: 'Buscar Funeraria',
                          )),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
                const SizedBox(height: 21),
                // TableWidget(
                //   //isLoadingTest: false,
                //   itens: FazendaDataTableModel.fromList(
                //     list: funerariaController.listaFunerarias.toList(),
                //     funerariaController: funerariaController,
                //   ),
                //   isLoading: false,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

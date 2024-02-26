import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/button_create_new.dart';
import '../application/venda_controller.dart';

class TipoCaixaoWidget extends StatefulWidget {
  final VendaController vendaController;

  //final DashboardController? dashboardController;
  TipoCaixaoWidget({
    Key? key,
    required this.vendaController, //this.dashboardController,
  }) : super(key: key);

  @override
  State<TipoCaixaoWidget> createState() => _TipoCaixaoWidgetState();
  String tipo = "N";
}

class _TipoCaixaoWidgetState extends State<TipoCaixaoWidget> {
  @override
  Widget build(BuildContext context) {
    String group = "grupo";

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      height: 300,
      width: 500,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32, 42, 32, 10),
        child: Column(
          children: [
            Column(
              children: [
                RadioListTile(
                  title: const Text("Normal"),
                  activeColor: Colors.green,
                  value: "Normal",
                  groupValue: widget.tipo,
                  onChanged: (value) {
                    setState(() {
                      widget.tipo = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("Alto"),
                  activeColor: Colors.green,
                  value: "Alto",
                  groupValue: widget.tipo,
                  onChanged: (value) {
                    setState(() {
                      widget.tipo = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("Gordo"),
                  activeColor: Colors.green,
                  value: "Gordo",
                  groupValue: widget.tipo,
                  onChanged: (value) {
                    setState(
                      () {
                        widget.tipo = value.toString();
                      },
                    );
                  },
                ),
                RadioListTile(
                  title: const Text("Alto e Gordo"),
                  activeColor: Colors.green,
                  value: "Alto e Gordo",
                  groupValue: widget.tipo,
                  onChanged: (value) {
                    setState(() {
                      widget.tipo = value.toString();
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonCreateNew(
                      buttonText: "Caixão",
                      onPressed: () {
                        widget.vendaController.tipoCaixaoSelecionado.value =
                            widget.tipo;
                        Get.back();
                        Get.back();
                      },
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

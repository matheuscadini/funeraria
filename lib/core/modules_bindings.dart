import 'package:flutter_funeraria/modules/venda/application/venda_controller.dart';
import 'package:flutter_funeraria/modules/venda/domain/nova_venda_UC.dart';
import 'package:flutter_funeraria/modules/venda/repository/venda_repository.dart';
import 'package:get/get.dart';

class ModulesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => VendaRepository(),
    );

    Get.put<NovaVendaUC>(
      NovaVendaUC(
        vendaRepository: Get.find(),
      ),
    );
    Get.lazyPut<VendaController>(
      () => VendaController(),
    );
  }
}

import 'package:flutter_funeraria/modules/caixoes/application/caixao_controller.dart';
import 'package:flutter_funeraria/modules/funeraria/application/funeraria_controller.dart';
import 'package:flutter_funeraria/modules/venda/application/venda_controller.dart';
import 'package:get/get.dart';

import 'controllers/app_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AppController>(
      AppController(),
      //permanent: true,
    );

    Get.put<FunerariaController>(
      FunerariaController(),
      //permanent: true,
    );

    Get.put<CaixaoController>(
      CaixaoController(),
      //permanent: true,
    );

    Get.put<VendaController>(
      VendaController(),
      //permanent: true,
    );
  }
}

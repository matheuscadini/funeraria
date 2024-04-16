import 'package:flutter_funeraria/core/models/caixao_model.dart';
import 'package:flutter_funeraria/modules/caixoes/repository/caixoes_repository.dart';
import 'package:get/get.dart';

import '../../funeraria/application/funeraria_controller.dart';

class CaixaoController extends GetxController {
  FunerariaController funerariaController = Get.find();

  final CaixaoRepository caixaoRepository = CaixaoRepository();
  RxList<CaixaoModel> listCaixoes = <CaixaoModel>[].obs;
  RxList<CaixaoModel> listAllCaixoes = <CaixaoModel>[].obs;
  String idFuneraria = '';
  Rx<CaixaoModel> caixaoSelectedEdition = CaixaoModel().obs;
  RxBool isLoadingUpload = false.obs;
  final Rx url = ''.obs;

  getCaixoes() async {
    listAllCaixoes.value = await caixaoRepository.getCaixoes();
  }

  getFoto(String nameImage) async {
    url.value = await caixaoRepository.getImageCaixao(nameImage);
    isLoadingUpload.value = true;
  }

  compraCaixao(CaixaoModel caixao, DateTime datacompra) async {
    await caixaoRepository.compraCaixoes(
      datacompra,
      caixao.quantidadeTipoAlto!,
      caixao.quantidadeTipoAlto!,
      caixao.quantidadeTipoAlto!,
      caixao.quantidadeTipoAlto!,
      caixao.id.toString(),
    );
    //listCaixoes.elementAt(id == caixao.id);

    Get.back();
  }

  novoCaixao(CaixaoModel caixao) async {
    await caixaoRepository.newCaixao(caixao);
    //listCaixoes.elementAt(id == caixao.id);

    Get.back();
  }

  deleteCaixoes(String id) {
    caixaoRepository.deleteCaixoes(id);
  }

  editCaixoes(
      {required int quantidadeNormal,
      required int quantidadeGordo,
      required DateTime datacompra,
      required int quantidadeAlto,
      required int quantidadeAltoGordo,
      required String id}) {}

  editStatusCaixoes(
      {required String id,
      String? status,
      String? idLote,
      String? loteAtual}) async {
    await caixaoRepository.editStatusCaixoes(
        status: status, id: id, idLote: idLote, loteAtual: loteAtual);
  }

  filterCaixoesByFuneraria(String idFuneraria) async {
    listCaixoes.value = await caixaoRepository.findCaixoes(idFuneraria);
    listCaixoes.forEach(
      (element) {
        /* if (element.status == "apta" || element.status == "vazia") {
          listVacasAptas.add(element);
        } */
      },
    );
  }
}

import 'package:flutter_funeraria/core/models/caixao_model.dart';
import 'package:flutter_funeraria/modules/caixoes/repository/caixoes_repository.dart';
import 'package:get/get.dart';

class CaixaoController extends GetxController {
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

  createNewCaixao(CaixaoModel caixao) async {
    caixao = await caixaoRepository.newCaixao(caixao);
    listCaixoes.add(caixao);
  }

  deleteCaixoes(String id) {
    caixaoRepository.deleteCaixoes(id);
  }

  editCaixoes({required CaixaoModel caixaoEdit, required String id}) {
    caixaoRepository.editCaixoes(caixaoEdit: caixaoEdit, id: id);
  }

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
    // ignore: unused_local_variable
    for (var element in listCaixoes) {
        /* if (element.status == "apta" || element.status == "vazia") {
          listVacasAptas.add(element);
        } */
      }
  }
}

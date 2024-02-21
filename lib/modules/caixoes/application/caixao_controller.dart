import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_funeraria/core/models/caixao_model.dart';
import 'package:flutter_funeraria/modules/caixoes/repository/caixoes_repository.dart';
import 'package:get/get.dart';

class CaixaoController extends GetxController {
  final CaixaoRepository caixaoRepository = CaixaoRepository();
  RxList<CaixaoModel> listCaixoes = <CaixaoModel>[].obs;


  RxList<CaixaoModel> listAllCaixoes = <CaixaoModel>[].obs;
  String idFuneraria = '';
  Rx<CaixaoModel> caixaoSelectedEdition = CaixaoModel().obs;
  bool isLoadingUpload = false;

  getCaixoes() async {
    listAllCaixoes.value = await caixaoRepository.getCaixoes();
  }

  getFoto() async{
        Uint8List? foto = await FirebaseStorage.instance.ref("WIN_20230602_18_22_39_Pro.jpg").getData();

  }

  createNewCaixao(
    CaixaoModel caixao, Uint8List foto
  ) async {
    caixao = await caixaoRepository.newCaixao(caixao, foto);
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
    listCaixoes.forEach(
      (element) {
        /* if (element.status == "apta" || element.status == "vazia") {
          listVacasAptas.add(element);
        } */
      },
    );
  }
}

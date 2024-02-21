import 'dart:html';

import 'package:flutter_funeraria/core/models/funeraria_model.dart';
import 'package:flutter_funeraria/modules/funeraria/repository/funeraria_repository.dart';
import 'package:get/get.dart';

class FunerariaController extends GetxController {
  final FunerariaRepository funerariaRepository = FunerariaRepository();

  RxList<FunerariaModel> listaFunerarias = <FunerariaModel>[].obs;
  Rx<FunerariaModel> funerariaSelecionada = FunerariaModel().obs;
  Rx<FunerariaModel> funerariaSelectedEdition = FunerariaModel().obs;
  final Storage localStorage = window.localStorage;
  @override
  void onInit() {
    super.onInit();
    getStorage();
  }

  Future save(FunerariaModel funeraria) async {
    localStorage['nome'] = funeraria.nome.toString();
    localStorage['id'] = funeraria.id.toString();
    localStorage['proprietario'] = funeraria.proprietario.toString();
    localStorage['cidade'] = funeraria.cidade.toString();
    localStorage['estado'] = funeraria.estado.toString();
    localStorage['rua'] = funeraria.rua.toString();
    localStorage['telefone'] = funeraria.telefone.toString();
    getStorage();
  }

  getStorage() {
    funerariaSelecionada.value.nome = localStorage['nome'];
    funerariaSelecionada.value.id = localStorage['id'];
    funerariaSelecionada.value.proprietario = localStorage['proprietario'];
    funerariaSelecionada.value.cidade = localStorage['cidade'];
    funerariaSelecionada.value.estado = localStorage['estado'];
    funerariaSelecionada.value.rua = localStorage['rua'];
    funerariaSelecionada.value.telefone = localStorage['telefone'];
  }

  getFunerarias() async {
    listaFunerarias.value = await funerariaRepository.getFuneraria();
  }

  deleteFunerarias(String idFuneraria) async {
    funerariaRepository.deleteFuneraria(idFuneraria);
  }
}

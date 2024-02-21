import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_funeraria/core/models/caixao_model.dart';
import 'package:flutter_funeraria/core/models/venda_model.dart';
import 'package:flutter_funeraria/modules/caixoes/repository/caixoes_repository.dart';
import 'package:flutter_funeraria/modules/venda/repository/venda_repository.dart';
import 'package:get/get.dart';

class VendaController extends GetxController {
  final VendaRepository vendaRepository = VendaRepository();
  RxList<VendaModel> listVendas = <VendaModel>[].obs;

  RxList<VendaModel> listAllCaixoes = <VendaModel>[].obs;
  String idFuneraria = '';
    Rx<CaixaoModel> caixaoSelecionado = CaixaoModel().obs;

  Rx<VendaModel> vendaSelectedEdition = VendaModel().obs;
  bool isLoadingUpload = false;

  getVendas() async {
    listAllCaixoes.value = await vendaRepository.getVenda();
  }

  getFoto() async {
    Uint8List? foto = await FirebaseStorage.instance
        .ref("WIN_20230602_18_22_39_Pro.jpg")
        .getData();
  }

  createNewVenda(VendaModel venda) async {
    venda = await vendaRepository.newVenda(venda);
    listVendas.add(venda);
  }

  deleteVenda(String id) {
    vendaRepository.deleteVenda(id);
  }

  editVenda({required String edit, required String id}) {
    vendaRepository.editVenda(edit: edit, id: id);
  }



  filterVendasByFuneraria(String idFuneraria) async {
    listVendas.value = await vendaRepository.findVendas(idFuneraria);
    
      }
    
  
}

import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_funeraria/core/models/caixao_model.dart';
import 'package:flutter_funeraria/core/models/venda_model.dart';
import 'package:flutter_funeraria/modules/caixoes/repository/caixoes_repository.dart';
import 'package:flutter_funeraria/modules/funeraria/application/funeraria_controller.dart';
import 'package:flutter_funeraria/modules/venda/repository/venda_repository.dart';
import 'package:get/get.dart';

class VendaController extends GetxController {
  final VendaRepository vendaRepository = VendaRepository();
  FunerariaController funerariaController = Get.find();
  RxList<VendaModel> listVendas = <VendaModel>[].obs;

  RxList<VendaModel> listAllCaixoes = <VendaModel>[].obs;
  String idFuneraria = '';
  Rx<CaixaoModel> caixaoSelecionado = CaixaoModel().obs;
  RxString tipoCaixaoSelecionado = "".obs;

  Rx<VendaModel> vendaSelectedEdition = VendaModel().obs;
  bool isLoadingUpload = false;

  getVendas() async {
    listAllCaixoes.value = await vendaRepository.getVenda();
    print(listAllCaixoes.length);
  }

  getFoto() async {
    Uint8List? foto = await FirebaseStorage.instance
        .ref("WIN_20230602_18_22_39_Pro.jpg")
        .getData();
  }

  createNewVenda(String cliente, CaixaoModel caixao, String tipo, String valor,
      String observacao) async {
    VendaModel novaVenda = VendaModel();
    novaVenda.cliente = cliente;
    novaVenda.caixaoModel = caixao;
    novaVenda.caixaoId = caixao.id;
    novaVenda.dataVenda = DateTime.now();
    novaVenda.descricao = observacao;
    novaVenda.tipo = tipo;
    novaVenda.valorVenda = valor;
    novaVenda.funerariaModel = funerariaController.funerariaSelecionada.value;
    novaVenda.funerariaId = funerariaController.funerariaSelecionada.value.id;
    if (tipo == "Normal") {
      novaVenda.caixaoModel!.quantidadeTipoNormal =
          novaVenda.caixaoModel!.quantidadeTipoNormal! - 1;
    } else if (tipo == "Gordo") {
      novaVenda.caixaoModel!.quantidadeTipoGordo =
          novaVenda.caixaoModel!.quantidadeTipoGordo! - 1;
    } else if (tipo == "Alto") {
      novaVenda.caixaoModel!.quantidadeTipoAlto =
          novaVenda.caixaoModel!.quantidadeTipoAlto! - 1;
    } else if (tipo == "Alto e Gordo") {
      novaVenda.caixaoModel!.quantidadeGordoAlto =
          novaVenda.caixaoModel!.quantidadeGordoAlto! - 1;
    }

    novaVenda = await vendaRepository.newVenda(novaVenda);
    await CaixaoRepository().editCaixoes(caixaoEdit: caixao, id: caixao.id!);
    listVendas.add(novaVenda);
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

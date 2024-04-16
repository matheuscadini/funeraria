import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as fb;
import 'package:flutter_funeraria/core/models/caixao_model.dart';
import 'package:flutter_funeraria/core/models/venda_model.dart';

class CaixaoRepository {
  Future<List<CaixaoModel>> getCaixoes() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('caixoes').get();

    final List<CaixaoModel> listaCaixoes = [];
    snapshot.docs.forEach((QueryDocumentSnapshot<Map<String, dynamic>> doc) =>
        listaCaixoes.add(CaixaoModel.fromJson(doc.data())));
    return listaCaixoes;
  }

  Future<List<CaixaoModel>> findCaixoes(String idFuneraria) async {
    QuerySnapshot<Map<String, dynamic>> searchCaixoes = await FirebaseFirestore
        .instance
        .collection('caixoes')
        .where('funerariaId', isEqualTo: idFuneraria)
        .get();

    final List<CaixaoModel> listaCaixoes = [];
    searchCaixoes.docs.forEach(
        (QueryDocumentSnapshot<Map<String, dynamic>> doc) =>
            listaCaixoes.add(CaixaoModel.fromJson(doc.data())));
    return listaCaixoes;
  }

  Future<String> getImageCaixao(String nameImage) {
    return fb.FirebaseStorage.instance
        .refFromURL('gs://fir-funeraria.appspot.com')
        .child(nameImage)
        .getDownloadURL();
  }

  deleteCaixoes(String id) {
    FirebaseFirestore.instance.collection('caixoes').doc(id).delete();
  }

  compraCaixoes(DateTime dataCompra, int quantidadeAlto, int quantidadeNormal,
      int quantidadeGordo, int quantidadeAltoGordo, String id) {
    FirebaseFirestore.instance.collection('caixoes').doc(id).update(
      {
        'quantidadeTipoNormal': quantidadeNormal,
        'quantidadeTipoAlto': quantidadeAlto,
        'quantidadeTipoGordo': quantidadeGordo,
        'quantidadeTipoGordoAlto': quantidadeAltoGordo,
        'dataUltimaCompra': dataCompra,
      },
    );
  }

  editStatusCaixoes(
      {String? status, required String id, String? idLote, String? loteAtual}) {
    FirebaseFirestore.instance.collection('caixoes').doc(id).update(
      {'status': status, 'idLote': idLote, 'loteAtual': loteAtual},
    );
  }

  Future<CaixaoModel> newCaixao(CaixaoModel caixao) async {
    //String nome = '';

    // if (foto != null) {
    //   nome = DateTime.now().microsecondsSinceEpoch.toString();
    //   fb.UploadTask storage =
    //       fb.FirebaseStorage.instance.ref(nome).putFile(foto);
    //   caixao.valorVenda = nome;
    // }

    final db = FirebaseFirestore.instance.collection('caixoes').doc();
    caixao.idCaixao = db.id;

    final json = caixao.toJson();
    await db.set(json);
    return caixao;
  }

  Future<VendaModel> vendaCaixao(VendaModel venda) async {
    final db = FirebaseFirestore.instance.collection('vendas').doc();
    venda.id = db.id;

    final json = venda.toJson();
    await db.set(json);
    return venda;
  }
}

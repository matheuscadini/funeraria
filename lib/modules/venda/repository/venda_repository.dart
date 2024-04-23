import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_funeraria/core/models/venda_model.dart';
import 'dart:async';


class VendaRepository {
  FutureOr<List<VendaModel>> getVenda() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('vendas').get();

    final List<VendaModel> listaVendas = [];
    snapshot.docs.forEach((QueryDocumentSnapshot<Map<String, dynamic>> doc) =>
        listaVendas.add(VendaModel.fromJson(doc.data())));

    return listaVendas;
  }

  deleteVenda(String id) {
    FirebaseFirestore.instance.collection('vendas').doc(id).delete();
  }

  editVenda({required String edit, required String id}) {
    FirebaseFirestore.instance.collection('vendas').doc(id).update(
      {'xxxx': edit},
    );
  }

    FutureOr<VendaModel> newVenda(VendaModel venda) async {

    final db = FirebaseFirestore.instance.collection('vendas').doc();
    venda.id = db.id;

    final json = venda.toJson();
    await db.set(json);
    return venda;
  }

  FutureOr<List<VendaModel>> findVendas(String idFuneraria) async {
    QuerySnapshot<Map<String, dynamic>> searchVendas = await FirebaseFirestore
        .instance
        .collection('vendas')
        .where('funerariaId', isEqualTo: idFuneraria)
        .get();

    final List<VendaModel> listaVendas = [];
    searchVendas.docs.forEach(
        (QueryDocumentSnapshot<Map<String, dynamic>> doc) =>
            listaVendas.add(VendaModel.fromJson(doc.data())));
    return listaVendas;
  }
}

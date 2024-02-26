import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as fb;
import 'package:flutter/cupertino.dart';
import 'package:flutter_funeraria/core/models/caixao_model.dart';
import 'package:image_picker/image_picker.dart';

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

  editCaixoes({required CaixaoModel caixaoEdit, required String id}) {
    FirebaseFirestore.instance.collection('caixoes').doc(id).update(
      {
        'quantidadeTipoNormal': caixaoEdit.quantidadeTipoNormal,
        'quantidadeTipoAlto': caixaoEdit.quantidadeTipoAlto,
        'quantidadeTipoGordo': caixaoEdit.quantidadeTipoGordo,
        'quantidadeTipoGordoAlto': caixaoEdit.quantidadeGordoAlto,
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
    caixao.id = db.id;

    final json = caixao.toJson();
    await db.set(json);
    return caixao;
  }
}

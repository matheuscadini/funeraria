// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_funeraria/core/models/caixao_model.dart';
import 'package:flutter_funeraria/core/models/funeraria_model.dart';

class VendaModel {
  String? cliente;
  String? id;
  CaixaoModel? caixaoModel;
  String? codigo;
  String? descricao;
  String? funerariaId;
  DateTime? dataVenda;
  FunerariaModel? funerariaModel;
  String? valorVenda;
  String? caixaoId;

  VendaModel(
      {this.cliente,
      this.id,
      this.caixaoModel,
      this.codigo,
      this.descricao,
      this.funerariaId,
      this.dataVenda,
      this.funerariaModel,
      this.caixaoId,
      this.valorVenda});

  VendaModel.fromJson(Map<String, dynamic> json) {
    cliente = json['cliente'];

    id = json['id'];

    caixaoModel = json['caixaoModel'] != null
        ? CaixaoModel.fromJson(json['caixaoModel'])
        : null;
    caixaoId = json['caixaoId'];

    codigo = json['codigo'];
    descricao = json['descricao'];
    funerariaId = json['funerariaId'];
    if (json['dataVenda'] != null) {
      Timestamp timestamp = json['dataVenda'];
      dataVenda = (timestamp.toDate());
    }

    valorVenda = json['valorVenda'];
    funerariaModel = json['funerariaModel'] != null
        ? FunerariaModel.fromJson(json['funerariaModel'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cliente'] = cliente;

    data['id'] = id;
    if (caixaoModel != null) {
      data['caixaoModel'] = caixaoModel!.toJson();
    }
    data['caixaoId'] = caixaoId;
    data['codigo'] = codigo;
    data['descricao'] = descricao;
    data['funerariaId'] = funerariaId;
    data['dataVenda'] = dataVenda;
    data['valorVenda'] = valorVenda;
    if (funerariaModel != null) {
      data['funerariaModel'] = funerariaModel!.toJson();
    }

    return data;
  }
}

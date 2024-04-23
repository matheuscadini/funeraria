// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_funeraria/core/models/caixao_model.dart';
import 'package:flutter_funeraria/core/models/funeraria_model.dart';

class CompraModel {
  String? cliente;
  String? id;
  CaixaoModel? caixaoModel;
  String? tipo;
  String? descricao;
  String? funerariaId;
  DateTime? dataVenda;
  FunerariaModel? funerariaModel;
  String? valorCompra;
  String? caixaoId;

  CompraModel(
      {this.cliente,
      this.id,
      this.caixaoModel,
      this.tipo,
      this.descricao,
      this.funerariaId,
      this.dataVenda,
      this.funerariaModel,
      this.caixaoId,
      this.valorCompra});

  CompraModel.fromJson(Map<String, dynamic> json) {
    cliente = json['cliente'];

    id = json['id'];

    caixaoModel = json['caixaoModel'] != null
        ? CaixaoModel.fromJson(json['caixaoModel'])
        : null;
    caixaoId = json['caixaoId'];

    tipo = json['codigo'];
    descricao = json['descricao'];
    funerariaId = json['funerariaId'];
    if (json['dataCompra'] != null) {
      Timestamp timestamp = json['dataCompra'];
      dataVenda = (timestamp.toDate());
    }

    valorCompra = json['valorCompra'];
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
    data['codigo'] = tipo;
    data['descricao'] = descricao;
    data['funerariaId'] = funerariaId;
    data['dataCompra'] = dataVenda;
    data['valorCompra'] = valorCompra;
    if (funerariaModel != null) {
      data['funerariaModel'] = funerariaModel!.toJson();
    }

    return data;
  }
}

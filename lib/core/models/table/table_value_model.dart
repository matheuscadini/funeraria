import 'package:flutter/material.dart';

enum TableValueType {
  text,
  edit,
  exclude,
  statusPositive,
  statusNegative,
  statusWarning,
  image,
  shared,
  pending,
  rejected,
  acepted,
  expired,
  influencer,
}

class TableValueModel {
  late String description;
  int flex;
 // bool isRelevant;
  void Function()? onClick;
  TableValueType type;
  String? imagem;
  AlignmentGeometry? alignment;

  TableValueModel({
    String? description,
    this.flex = 1,
  //  this.isRelevant = false,
    this.onClick,
    this.type = TableValueType.text,
    this.imagem,
    this.alignment,
  }) {
    this.description = description ?? '';
  }
}

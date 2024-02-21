class FunerariaModel {
  String? nome;
  String? id;
  String? proprietario;
  String? cidade;
  String? estado;
  String? rua;
  String? telefone;

  FunerariaModel(
      {this.nome,
      this.id,
      this.proprietario,
      this.cidade,
      this.estado,
      this.rua,
      this.telefone});

  FunerariaModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    id = json['id'];
    proprietario = json['proprietario'];
    cidade = json['cidade'];
    estado = json['estado'];
    rua = json['rua'];
    telefone = json['telefone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['id'] = id;
    data['proprietario'] = proprietario;
    data['cidade'] = cidade;
    data['estado'] = estado;
    data['rua'] = rua;
    data['telefone'] = telefone;
    return data;
  }

  toMap() {}

  static fromMap(Map<String, dynamic> map) {}
}

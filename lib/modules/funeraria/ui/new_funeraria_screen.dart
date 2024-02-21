import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_funeraria/core/models/funeraria_model.dart';


class NovaFunerariaScreen extends StatefulWidget {
  const NovaFunerariaScreen({Key? key}) : super(key: key);

  @override
  State<NovaFunerariaScreen> createState() => _NovaFunerariaScreenState();
}

class _NovaFunerariaScreenState extends State<NovaFunerariaScreen> {
  TextEditingController propietarioController = TextEditingController();
  TextEditingController nomeFunerariaController = TextEditingController();
  TextEditingController estadoController = TextEditingController();
  TextEditingController cidadeController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();

  //final _firebaseAuth = FirebaseAuth.instance;
  final fieldText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SizedBox(
        width: 300,
        child: ListView(
          children: [
            TextFormField(
              controller: propietarioController,
              decoration: const InputDecoration(label: Text('Propietário')),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: nomeFunerariaController,
              decoration: const InputDecoration(label: Text('Nome da Funeraria')),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: estadoController,
              decoration: const InputDecoration(label: Text('Estado')),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: cidadeController,
              decoration: const InputDecoration(label: Text('Cidade')),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: enderecoController,
              decoration: const InputDecoration(label: Text('Endereço')),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: telefoneController,
              decoration: const InputDecoration(label: Text('Telefone')),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  cadastrar();
                  clearText();
                },
                child: const Text('Cadastrar'))
          ],
        ),
      ),
    ));
  }

  Future cadastrar() async {
    final db = FirebaseFirestore.instance.collection('funerarias').doc();
    final funeraria = FunerariaModel(
        id: db.id,
        cidade: cidadeController.text,
        rua: enderecoController.text,
        estado: estadoController.text,
        nome: nomeFunerariaController.text,
        proprietario: propietarioController.text,
        telefone: telefoneController.text);
    final json = funeraria.toJson();
    await db.set(json);
  }

  void clearText() {
    propietarioController.clear();
    nomeFunerariaController.clear();
    estadoController.clear();
    cidadeController.clear();
    enderecoController.clear();
    telefoneController.clear();
  }
}

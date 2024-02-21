import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/models/funeraria_model.dart';

class FunerariaRepository {
  Future<List<FunerariaModel>> getFuneraria() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('funerarias').get();

    final List<FunerariaModel> listaFunerarias = [];
    snapshot.docs.forEach((QueryDocumentSnapshot<Map<String, dynamic>> doc) =>
        listaFunerarias.add(FunerariaModel.fromJson(doc.data())));

    return listaFunerarias;
  }

  deleteFuneraria(String id) {
    FirebaseFirestore.instance.collection('funerarias').doc(id).delete();
  }

  editFuneraria({required String edit, required String id}) {
    FirebaseFirestore.instance.collection('funerarias').doc(id).update(
      {'xxxx': edit},
    );
  }
}

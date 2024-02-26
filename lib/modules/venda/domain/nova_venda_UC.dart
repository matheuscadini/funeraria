import 'package:flutter_funeraria/core/models/venda_model.dart';
import 'package:flutter_funeraria/modules/venda/repository/venda_repository.dart';

import '../../../core/models/caixao_model.dart';

class NovaVendaUC {
  final VendaRepository vendaRepository;

  NovaVendaUC({required this.vendaRepository});

  Future<bool> call({
    required VendaModel novaVenda,
    
    
  }) async {
    try {
      await vendaRepository.newVenda(

novaVenda
      );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
import 'package:flutter_funeraria/core/models/venda_model.dart';
import 'package:flutter_funeraria/modules/venda/application/venda_controller.dart';
import '../table_data_model.dart';
import '../table_row_model.dart';
import '../table_value_model.dart';

class VendaDataTableModel implements TableDataModel {
  @override
  List<TableRowModel> data = [];

  @override
  TableRowModel? header;

  VendaDataTableModel.fromList({
    required List<VendaModel> list,
    required VendaController vendaController,
  }) {
    List<TableValueModel> headerValues = [
      TableValueModel(
        description: 'Cliente',
        flex: 2,
      ),
      TableValueModel(
        description: 'Caixão',
        flex: 2,
      ),
      TableValueModel(
        description: 'Data',
        flex: 2,
      ),
    ];
    header = TableRowModel(row: headerValues);

    for (var i = 0; i < list.length; i++) {
      TableRowModel dataRow = vendaDataTable(
        venda: list[i],
        index: i,
        vendaController: vendaController,
      );

      dataRow.onClick = () {
        vendaController.vendaSelectedEdition.value = list[i];

        //Get.dialog(CreateNewVendaScreen(vendaController: vendaController, caixaoController: ,));
      };
      data.add(dataRow);
    }
  }

  TableRowModel vendaDataTable({
    required VendaModel venda,
    int index = 0,
    required VendaController vendaController,
  }) {
    TableRowModel rowItem = TableRowModel(
      row: [],
      index: index,
    );

    TableValueModel cliente = TableValueModel(
      description: venda.cliente.toString(),
      flex: 2,
      // isRelevant: true,
    );
    TableValueModel caixao = TableValueModel(
      description: venda.caixaoModel!.descricao.toString(),
      flex: 2,
      // isRelevant: true,
    );
    TableValueModel data = TableValueModel(
      description: venda.dataVenda.toString(),
      flex: 2,
      //isRelevant: false,
    );

    rowItem.row = [
      cliente,
      caixao,
      data,
    ];
    return rowItem;
  }
}

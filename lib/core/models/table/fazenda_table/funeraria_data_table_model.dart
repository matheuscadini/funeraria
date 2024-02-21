import 'package:flutter_funeraria/core/models/funeraria_model.dart';
import 'package:flutter_funeraria/modules/funeraria/application/funeraria_controller.dart';
import 'package:get/get.dart';
import '../../../../modules/funeraria/ui/view_funeraria_screen.dart';
import '../table_data_model.dart';
import '../table_row_model.dart';
import '../table_value_model.dart';

class FunerariaDataTableModel implements TableDataModel {
  @override
  List<TableRowModel> data = [];

  @override
  TableRowModel? header;

  FunerariaDataTableModel.fromList({
    required List<FunerariaModel> list,
    required FunerariaController funerariaController,
  }) {
    List<TableValueModel> headerValues = [
      TableValueModel(
        description: 'Nome da Funeraria',
        flex: 2,
      ),
      TableValueModel(
        description: 'Propietário',
        flex: 2,
      ),
      TableValueModel(
        description: 'Cidade',
        flex: 2,
      ),
    ];
    header = TableRowModel(row: headerValues);

    for (var i = 0; i < list.length; i++) {
      TableRowModel dataRow = funerariaDataTable(
        funeraria: list[i],
        index: i,
        funerariaController: funerariaController,
      );

      dataRow.onClick = () {
        funerariaController.funerariaSelectedEdition.value = list[i];

        Get.dialog(
            ViewFunerariaScreen(funerariaController: funerariaController));
      };
      data.add(dataRow);
    }
  }

  TableRowModel funerariaDataTable({
    required FunerariaModel funeraria,
    int index = 0,
    required FunerariaController funerariaController,
  }) {
    TableRowModel rowItem = TableRowModel(
      row: [],
      index: index,
    );

    TableValueModel nomeFuneraria = TableValueModel(
      description: funeraria.nome.toString(),
      flex: 2,
      // isRelevant: true,
    );
    TableValueModel propietario = TableValueModel(
      description: funeraria.proprietario.toString(),
      flex: 2,
      // isRelevant: true,
    );
    TableValueModel cidade = TableValueModel(
      description: funeraria.cidade.toString(),
      flex: 2,
      //isRelevant: false,
    );

    rowItem.row = [
      nomeFuneraria,
      propietario,
      cidade,
    ];
    return rowItem;
  }
}

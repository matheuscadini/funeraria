import 'package:flutter_funeraria/core/models/caixao_model.dart';
import 'package:flutter_funeraria/modules/caixoes/application/caixao_controller.dart';
import 'package:flutter_funeraria/modules/caixoes/ui/modal_survey_widget.dart';
import 'package:get/get.dart';

import '../../../../modules/caixoes/ui/view_caixao_screen.dart';
import '../table_data_model.dart';
import '../table_row_model.dart';
import '../table_value_model.dart';

class CaixaoDataTableModel implements TableDataModel {
  @override
  List<TableRowModel> data = [];

  @override
  TableRowModel? header;

  CaixaoDataTableModel.fromList({
    required List<CaixaoModel> list,
    required CaixaoController caixaoController,
  }) {
    List<TableValueModel> headerValues = [
      TableValueModel(
        description: 'Id Caixão',
        flex: 2,
      ),
      TableValueModel(
        description: 'Sexo',
        flex: 2,
      ),
      TableValueModel(description: 'Data Nascimento', flex: 2),
    ];
    header = TableRowModel(row: headerValues);
    list.sort((a, b) => (a.idCaixao)!.compareTo(b.idCaixao!));
    for (var i = 0; i < list.length; i++) {
      TableRowModel dataRow = caixaoToDataTable(
        caixao: list[i],
        index: i,
        caixaoController: caixaoController,
      );
      dataRow.onClick = () {
        caixaoController.caixaoSelectedEdition.value = list[i];
        caixaoController.getFoto();

        Get.dialog(ModalSurveyWidget(
          caixaoController: caixaoController,
        ));
      };
      data.add(dataRow);
    }
  }

  TableRowModel caixaoToDataTable({
    required CaixaoModel caixao,
    int index = 0,
    required CaixaoController caixaoController,
  }) {
    TableRowModel rowItem = TableRowModel(
      row: [],
      index: index,
    );
    TableValueModel idCaixao = TableValueModel(
      description: caixao.idCaixao.toString(),
      flex: 20,
      //isRelevant: true,
    );
    TableValueModel fornecedor = TableValueModel(
      description: caixao.fornecedor.toString(),
      flex: 20,
      //isRelevant: true,
    );
    TableValueModel dataNascimento = TableValueModel(
      description: getData(caixao),
      //("${animal.dataNascimento?.day}-${animal.dataNascimento?.month}-${animal.dataNascimento?.year} "),
      flex: 20,
      //isRelevant: true,
    );

    // TableValueModel editItem = TableValueModel(
    //   flex: 1,
    //   isRelevant: true,
    //   type: TableValueType.edit,
    //   onClick: () {
    //     Get.dialog(
    //       ActionDialog(
    //         title: 'Editar Badword',
    //         confirmButton: 'Editar',
    //       ),
    //     );
    //   },
    // );
    // TableValueModel removeItem = TableValueModel(
    //   flex: 1,
    //   isRelevant: true,
    //   type: TableValueType.exclude,
    //   onClick: () {
    //     Get.dialog(
    //       SimpleDialog(
    //         insetPadding: EdgeInsets.zero,
    //         contentPadding: EdgeInsets.zero,
    //         children: [
    //           AlertDialogWidget(
    //             title: 'Tem certeza que deseja excluir?',
    //             subtitle: 'Remover badword: ${animal.description}',
    //             confirmOption: 'Excluir',
    //             confirmFunction: () async {
    //               await badwordsController.removeItem(animal.id ?? '');
    //               Get.back();
    //             },
    //             negativeFunction: () => Get.back(),
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // );
    rowItem.row = [idCaixao, fornecedor, dataNascimento];
    return rowItem;
  }

  String getData(CaixaoModel caixao) {
    String data2 = '';
    if (caixao.dataUltimaVenda == null) {
      data2 = 'Sem Registro';
    } else {
      data2 =
          "${caixao.dataUltimaVenda!.day}-${caixao.dataUltimaVenda!.month}-${caixao.dataUltimaVenda!.year}";
    }
    return data2;
  }
}

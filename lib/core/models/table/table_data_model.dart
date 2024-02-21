import 'table_row_model.dart';

class TableDataModel {
  TableRowModel? header;
  List<TableRowModel> data;

  TableDataModel({
    required this.data,
    this.header,
  });
}


import 'table_value_model.dart';

class TableRowModel {
  int? index;
  List<TableValueModel> row;
  Function? onClick;

  TableRowModel({
    this.index,
    this.onClick,
    required this.row,
  });
}

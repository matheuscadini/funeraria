import 'package:flutter/material.dart';
import '../../helper/table_helpers.dart';
import '../../models/table/table_row_model.dart';
import '../../models/table/table_value_model.dart';

class TableHeaderWidget extends StatelessWidget {
  final TableRowModel item;

  const TableHeaderWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.shade300, width: 2),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i = 0; i < item.row.length; i++) ..._getTableItems(item.row[i], i),
          ],
        ),
      ),
    );
  }

  _getTableItems(TableValueModel header, int index) {
    return [
      Expanded(
        flex: header.flex,
        child: Align(
          alignment: header.alignment ?? TableHelpers.alignmentFromIndex(index),
          child: GestureDetector(
            onTap: header.onClick,
            child: Text(
              header.description,
            )
            //.textHeaderTable,
          ),
        ),
      ),
      const SizedBox(width: 8),
    ];
  }
}

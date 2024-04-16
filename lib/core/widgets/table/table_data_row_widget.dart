import 'package:flutter/material.dart';

import '../../helper/table_helpers.dart';
import '../../models/table/table_row_model.dart';
import '../../models/table/table_value_model.dart';

class TableDataRowWidget extends StatelessWidget {
  final TableRowModel item;
/*   final double? heightImage;
  final double? widthImage;
  final double circularImage; */

  const TableDataRowWidget({
    Key? key,
    required this.item,
    /* this.heightImage,
    this.widthImage,
    required this.circularImage, */
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => item.onClick != null ? item.onClick!() : null,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey.shade300,
              width: 2,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i < item.row.length; i++)
                ..._buildContentRow(item.row[i], i)
            ],
          ),
        ),
      ),
    );
  }

  _buildContentRow(TableValueModel e, int index) {
    return [
      Flexible(
        flex: e.flex,
        child: Align(
          alignment: e.alignment ?? TableHelpers.alignmentFromIndex(index),
          child: _getRowItem(e, index),
        ),
      ),
      const SizedBox(width: 8)
    ];
  }

  _getRowItem(TableValueModel e, int index) {
    switch (e.type) {
     /*  case TableValueType.image:
        return ClipRRect(
          borderRadius: BorderRadius.circular(circularImage),
          child: Image.network(
            e.imagem!,
            height: heightImage,
            width: circularImage >= 50 ? heightImage : null,
            fit: circularImage >= 50 ? BoxFit.fitWidth : BoxFit.scaleDown,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return _getImagePlaceholder(loading: true);
            },
            errorBuilder: (_, __, ___) => _getImagePlaceholder(),
          ),
        ); */
      case TableValueType.exclude:
      case TableValueType.shared:
      case TableValueType.edit:
      case TableValueType.influencer:
        return _getCorrespondentIcon(
          onPressed: () => e.onClick!(),
          iconPath: _getIconPath(e.type),
        );

      case TableValueType.statusPositive:
      case TableValueType.statusNegative:
      case TableValueType.acepted:
      case TableValueType.pending:
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: _getStatusBoxColor(e.type),
          ),
          alignment: Alignment.center,
          height: 24,
          width: 94,
          child: _getStatusText(e.type, e.description),
        );

      default:
        return Text(e.description);
    }
  }

  // _getImagePlaceholder({loading = false}) {
  //   return Container(
  //     padding: const EdgeInsets.all(8.0),
  //     color: loading ? Colors.transparent : Colors.grey[300],
  //     width: 50,
  //     height: 50,
  //     child: loading
  //         ? const CircularProgressIndicator(
  //             strokeWidth: 0.8,
  //             color: Colors.greenAccent,
  //           )
  //         : Container(),
  //   );
  // }

  _getIconPath(TableValueType type) {
    switch (type) {
      case TableValueType.edit:
        return 'assets/icons/edit_fill.svg';
      case TableValueType.shared:
        return 'assets/icons/shared_link.svg';
      case TableValueType.exclude:
        return 'images/trash_red.svg';
      case TableValueType.influencer:
        return 'assets/icons/star.svg';
      default:
        return 'assets/icons/shared_link.svg';
    }
  }

  _getCorrespondentIcon({
    required void Function()? onPressed,
    required String iconPath,
  }) {
    // return IconButton(
    //   icon: SvgPicture.asset(
    //     iconPath,
    //     height: 24,
    //     width: 24,
    //   ),
    //   onPressed: onPressed,
    // );
  }

  _getStatusBoxColor(TableValueType type) {
    switch (type) {
      case TableValueType.statusNegative:
      case TableValueType.pending:
        return Colors.red;
      case TableValueType.acepted:
      case TableValueType.statusPositive:
        return Colors.green;
      default:
    }
  }

  _getStatusText(TableValueType type, String text) {
    switch (type) {
      case TableValueType.statusNegative:
        return Text(text);
      case TableValueType.pending:
        return Text(text);
      case TableValueType.acepted:
      case TableValueType.statusPositive:
        return Text(text);
      default:
    }
  }
}

import 'package:flutter/material.dart';
import '../../models/table/table_data_model.dart';
import 'table_data_row_widget.dart';
import 'table_header_widget.dart';

class TableWidget extends StatelessWidget {
  final TableDataModel itens;
  /* final double? heightImage;
  final double? widthImage;
  final double circularImage; */
  final bool isLoading;

  const TableWidget({
    Key? key,
    required this.itens,
    /*  this.heightImage,
    this.widthImage,
    this.circularImage = 4, */
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        height: MediaQuery.of(context).size.height / 1.5,
        child: const Center(
          child: CircularProgressIndicator(
            strokeWidth: 0.8,
            //color: CustomColors.circularProgress,
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          if (itens.header != null && itens.header!.row.isNotEmpty)
            TableHeaderWidget(item: itens.header!),
          ListView.builder(
            shrinkWrap: true,
            itemCount: itens.data.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) => TableDataRowWidget(
              item: itens.data[i],
              /* circularImage: circularImage,
              widthImage: widthImage,
              heightImage: heightImage, */
            ),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pml_ship_admin/core/core.dart';
import 'package:pml_ship_admin/data/models/response/get_all_status_order_response_model.dart';

import '../../pages/document/document_list_page.dart';

class OnProcessDocumentDataCard extends StatelessWidget {
  final GetAllStatusOrderResponseModel responseModel;

  const OnProcessDocumentDataCard({
    super.key,
    required this.responseModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: responseModel.data?.length,
      itemBuilder: (context, index) {
        final orderData = responseModel.data?[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DocumentListPage(
                  transactionId: orderData.transactionId!,
                ),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.black),
                borderRadius: BorderRadius.circular(5.0)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Text(
                              'Created at: ${orderData!.createdAt?.toFormattedIndonesianShortDateAndUTC7Time()}')),
                      Flexible(
                        child: Text(
                          orderData.transactionId!,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    orderData.customerCompanyName!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                      '${orderData.loading?.port} → ${orderData.discharge?.port}'),
                  Text(
                      '${orderData.loading?.date} → ${orderData.discharge?.date}'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

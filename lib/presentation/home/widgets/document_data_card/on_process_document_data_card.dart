// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pml_ship_admin/core/core.dart';
import 'package:pml_ship_admin/data/models/response/get_all_status_order_response_model.dart';

import '../../../../core/styles.dart';
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
                border: Border.all(color: Colors.black),
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
                      // Column(
                      //   children: [
                      //     Text(
                      //       'Adjuration:',
                      //       style: primaryTextStyle.copyWith(fontWeight: bold),
                      //     ),
                      //     Row(
                      //       children: [
                      //         Icon(
                      //           Icons.done,
                      //           color: verifyCheck,
                      //           weight: 700,
                      //         ),
                      //         const Text('Accepted'),
                      //       ],
                      //     ),
                      //     const Row(
                      //       children: [
                      //         Icon(
                      //           Icons.close,
                      //           color: Color(0xffff0000),
                      //           weight: 700,
                      //         ),
                      //         Text('Rejected'),
                      //       ],
                      //     )
                      //   ],
                      // ),
                      Flexible(
                        child: Text(
                          orderData.transactionId!,
                          style: primaryTextStyle,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    orderData.customerCompanyName!,
                    style: primaryTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 16.0,
                    ),
                  ),

                  Text(
                      '${orderData.loading?.port} → ${orderData.discharge?.port}'),
                  Text(
                      '${orderData.loading?.date} → ${orderData.discharge?.date}'),
                  // Container(
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //     border: Border.all(),
                  //     borderRadius: BorderRadius.circular(5.0),
                  //   ),
                  //   margin: const EdgeInsets.all(10),
                  //   padding: const EdgeInsets.all(10),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  // Text(
                  //   'Putri Ayu Tarra',
                  //   style: primaryTextStyle.copyWith(
                  //     fontWeight: regular,
                  //     fontSize: 14.0,
                  //   ),
                  // ),

                  //       ),
                  //     ],
                  //   ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: TextButton(

                  //     style: TextButton.styleFrom(
                  //       padding: const EdgeInsets.symmetric(
                  //         horizontal: 12.0,
                  //         vertical: 10.0,
                  //       ),
                  //       // backgroundColor: getDocumentTypeColor(documentType),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(
                  //           10.0,
                  //         ),
                  //       ),
                  //     ),
                  //     onPressed: () {},
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Icon(
                  //               Icons.description,
                  //               color: primaryColor,
                  //             ),
                  //             const SizedBox(
                  //               width: 10,
                  //             ),
                  //             // Text(
                  //             //   getDocumentTypeText(documentType),
                  //             //   style: primaryTextStyle.copyWith(
                  //             //       fontWeight: medium,
                  //             //       fontSize: 16.0,
                  //             //       color: primaryColor),
                  //             // ),
                  //           ],
                  //         ),
                  //         Icon(
                  //           Icons.download,
                  //           color: primaryColor,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

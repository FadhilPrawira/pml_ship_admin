import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../../core/styles.dart';
import '../../../../data/models/response/get_all_status_order_response_model.dart';
import '../../pages/order_data/verify_order_data_page.dart';

class BuildOrderDataItem extends StatelessWidget {
  final GetAllStatusOrderResponseModel response;
  final VoidCallback refreshData;
  const BuildOrderDataItem({
    super.key,
    required this.response,
    required this.refreshData,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: response.data?.length,
      itemBuilder: (context, index) {
        final orderData = response.data?[index];
        return Container(
          margin: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 12,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      orderData?.status == 'order_pending'
                          ? 'Created at:\n${orderData?.createdAt?.toFormattedInternationalShortDateAndUTC7Time()}'
                          : orderData?.status == 'payment_pending'
                              ? 'Approved at:\n${orderData?.negotiationOrOrderApprovedAt?.toFormattedInternationalShortDateAndUTC7Time()}'
                              : orderData?.status == 'on_shipping'
                                  ? 'On shipping at:\n${orderData?.updatedAt?.toFormattedInternationalShortDateAndUTC7Time()}'
                                  : orderData?.status == 'order_completed'
                                      ? 'Completed at:\n${orderData?.updatedAt?.toFormattedInternationalShortDateAndUTC7Time()}'
                                      : orderData?.status == 'order_rejected'
                                          ? 'Rejected at:\n${orderData?.orderRejectedAt?.toFormattedInternationalShortDateAndUTC7Time()}'
                                          : orderData?.status ==
                                                  'order_canceled'
                                              ? 'Canceled at:\n${orderData?.orderCanceledAt?.toFormattedInternationalShortDateAndUTC7Time()}'
                                              : 'Created at:\n${orderData?.createdAt?.toFormattedInternationalShortDateAndUTC7Time()}',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  Text(orderData!.transactionId!),
                ],
              ),
              Text(
                '${orderData.shipper?.name} - ${orderData.consignee?.name}',
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 18.0,
                ),
              ),
              Text(
                '${orderData.loading?.port} → ${orderData.discharge?.port}',
                style:
                    primaryTextStyle.copyWith(fontWeight: bold, fontSize: 18.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Button.filled(
                    width: 170,
                    onPressed: () {
                      // To navigate to VerifyOrderDataPage

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerifyOrderDataPage(
                            transactionId: orderData.transactionId!,
                            refreshData: refreshData,
                          ),
                        ),
                      );
                    },
                    label: 'Order Detail',
                    fontSize: 12.0,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

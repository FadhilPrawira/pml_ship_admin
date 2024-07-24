import 'package:flutter/material.dart';
import 'package:pml_ship_admin/presentation/home/pages/payment/payment_data_page.dart';

import '../../../../core/core.dart';
import '../../../../data/models/response/get_all_status_order_response_model.dart';
import '../../../history/pages/track_vessel_page.dart';
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
              border: Border.all(color: AppColors.black),
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
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  Text(orderData!.transactionId!),
                ],
              ),
              Text(
                '${orderData.shipper?.name} - ${orderData.consignee?.name}',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                ),
              ),
              Text(
                '${orderData.loading?.port} → ${orderData.discharge?.port}',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button.filled(
                    width: 170,
                    onPressed: () {
                      // To navigate to VerifyOrderDataPage

                      if (orderData.status == 'payment_pending') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PaymentDataPage(),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VerifyOrderDataPage(
                              transactionId: orderData.transactionId!,
                              refreshData: refreshData,
                            ),
                          ),
                        );
                      }
                    },
                    label: 'Order Detail',
                    fontSize: 12.0,
                  ),
                  Visibility(
                    visible: response.data![index].status == 'on_shipping',
                    child: Button.filled(
                      width: 150,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TrackVesselPage(
                              transactionId: response.data![index].transactionId
                                  .toString(),
                            ),
                          ),
                        );
                      },
                      label: 'Track Vessel',
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

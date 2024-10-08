import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../data/models/response/get_all_status_order_response_model.dart';
import '../pages/order_detail_page.dart';
import '../pages/track_vessel_page.dart';

class OrderDataCard extends StatelessWidget {
  final GetAllStatusOrderResponseModel response;
  const OrderDataCard({
    super.key,
    required this.response,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const SpaceHeight(4);
      },
      itemCount: response.data!.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.black),
              borderRadius: BorderRadius.circular(5.0)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(response.data![index].createdAt!
                        .toFormattedIndonesianShortDateAndUTC7Time()),
                    Text(response.data![index].transactionId.toString()),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(response.data![index].shipper!.name.toString()),
                    Text(
                        '${response.data![index].loading!.port.toString()} - ${response.data![index].discharge!.port.toString()}'),
                    Text(
                        '${response.data![index].cargo!.description.toString()} ${response.data![index].cargo!.weight.toString()}')
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button.filled(
                      fontSize: 12,
                      width: 150,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderDetailPage(
                              transactionId: response.data![index].transactionId
                                  .toString(),
                            ),
                          ),
                        );
                      },
                      label: 'Order Detail',
                    ),
                    //  If response.data[index].status == 'on_shipping', show Track Vessel button
                    Visibility(
                      visible: response.data![index].status == 'on_shipping',
                      child: Button.filled(
                        width: 150,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TrackVesselPage(
                                transactionId: response
                                    .data![index].transactionId
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
              ),
            ],
          ),
        );
      },
    );
  }
}

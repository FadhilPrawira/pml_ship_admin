import 'package:flutter/material.dart';
import '../../../core/core.dart';

class ShippingInstructionDataPage extends StatelessWidget {
  const ShippingInstructionDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: AppColors.gray4,
        title: Container(
          padding: const EdgeInsets.all(30.0),
          child: const Text(
            'Shipping Instruction Data',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
      );
    }

    Widget customFormField(String label, String value) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Container(
              margin: const EdgeInsets.only(
                right: 16.0,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 12.0,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(),
              ),
              child: Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget detailShipper() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Shipper Name
              customFormField('Shipper Name', 'Anugrah Lautan Luas, PT'),
              // Shipper Address
              customFormField('Shipper Address',
                  'JL.PAHLAWAN SERIBU RUKO GOLDEN BOULEVARD BLOK O/5-6 BUMI SERPONG DAMAI,KEL. LENGKONG GUDANG, KEC. SERPONG, KOTA TANGERANG SELATAN, BANTEN, 15311, INDONESIA'),
            ],
          ),
        ),
      );
    }

    Widget detailConsignee() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Consignee Name
              customFormField('Consignee Name', 'Prima Multi Mineral, PT'),
              // Consignee Address
              customFormField('Consignee Address',
                  'JL. RAWAGELAM I NO.9 KAWASAN INDUSTRI PULOGADUNG JAKARTA TIMUR 13930'),
            ],
          ),
        ),
      );
    }

    Widget detailDate(String date, String month, String year) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 60.0,
              margin: const EdgeInsets.only(
                right: 16.0,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 12.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(),
              ),
              child: Center(
                child: Text(
                  date,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13.0,
                  ),
                ),
              ),
            ),
            Container(
              width: 160.0,
              margin: const EdgeInsets.only(
                right: 16.0,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 12.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(),
              ),
              child: Center(
                child: Text(
                  month,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13.0,
                  ),
                ),
              ),
            ),
            Container(
              width: 80.0,
              margin: const EdgeInsets.only(
                right: 16.0,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 12.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(),
              ),
              child: Center(
                child: Text(
                  year,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget detailDelivery() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Port Of Loading
              customFormField('Port Of Loading', 'Jakarta, IDJKT'),
              // Port of Discharge
              customFormField('Port of Discharge', 'Banjarmasin, IDBDJ'),
              //  Estimated Time Of Departure (Loading Date)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Estimated Time Of Departure (Loading Date)',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                  // Row tanggal
                  detailDate('2', 'November', '2023'),
                ],
              ),
              //  Estimated Time Of Arrival (Discharge Date)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Estimated Time Of Arrival (Discharge Date)',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                  // Row tanggal
                  detailDate('9', 'November', '2023'),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget detailCargo() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cargo Type
              customFormField('Cargo Type', 'Prima Multi Mineral, PT'),
              // Description of Cargo
              customFormField('Description of Cargo', 'Low calorie coal'),
              // Gross Weight
              customFormField('Gross Weight', '12,000 MT'),
            ],
          ),
        ),
      );
    }

    Widget detailDocument() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Shipping Instruction',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Container(
                  margin: const EdgeInsets.only(
                    right: 16.0,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 12.0,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          'shipping_instruction_doc_Anugrah_Lautan_Luas.pdf',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                      Icon(Icons.download),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget sectionTitle(String text) {
      return Container(
        margin: const EdgeInsets.only(
          top: 20.0,
          left: 30.0,
          right: 30.0,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22.0,
          ),
        ),
      );
    }

    Widget rejectOrAccept() {
      return Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {
                // Navigator.pushNamed(context, '/mainpage');
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xffff0000),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Text(
                'Reject Order',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                    color: AppColors.primaryColor),
              ),
            ),
            TextButton(
              onPressed: () {
                //navigator
              },
              style: TextButton.styleFrom(
                backgroundColor: AppColors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Text(
                'Accept Order',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                    color: AppColors.primaryColor),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      body: ListView(
        children: [
          sectionTitle('Shipper Info'),
          detailShipper(),
          sectionTitle('Consignee Info'),
          detailConsignee(),
          sectionTitle('Delivery Info'),
          detailDelivery(),
          sectionTitle('Cargo Info'),
          detailCargo(),
          sectionTitle('Document'),
          detailDocument(),
          rejectOrAccept()
        ],
      ),
    );
  }
}

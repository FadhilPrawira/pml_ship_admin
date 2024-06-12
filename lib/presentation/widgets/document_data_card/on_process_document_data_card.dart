import 'package:flutter/material.dart';

import '../../../core/styles.dart';

class OnProcessDocumentDataCard extends StatelessWidget {
  final int documentType;
  // 0 = Document Not Found (RED)
  // 1 = Shipping Instruction
  // 2 = Bill of Lading
  // 3 = Cargo Manifest
  // 4 = Timesheet

  const OnProcessDocumentDataCard({super.key, this.documentType = 0});

  @override
  Widget build(BuildContext context) {
    String getDocumentTypeText(int documentType) {
      switch (documentType) {
        case 0:
          return 'Document Not Found';
        case 1:
          return 'Shipping Instruction';
        case 2:
          return 'Bill of Lading';
        case 3:
          return 'Cargo Manifest';
        case 4:
          return 'Timesheet';
        default:
          return 'Unknown Document Type';
      }
    }

    Color getDocumentTypeColor(int documentType) {
      switch (documentType) {
        case 0:
          return Colors.red; // Document Not Found
        case 1:
          return secondaryColor; // Shipping Instruction  (using pre-defined color)
        case 2:
          return billOfLadingCard; // Bill of Lading (using pre-defined color)
        case 3:
          return cargoManifestCard; // Cargo Manifest (using pre-defined color)
        case 4:
          return timeSheetCard; // Timesheet (using pre-defined color)
        default:
          return Colors.grey; // Unknown document type
      }
    }

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(5.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('2024-02-29'),
                  Column(
                    children: [
                      Text(
                        'Adjuration:',
                        style: primaryTextStyle.copyWith(fontWeight: bold),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.done,
                            color: verifyCheck,
                            weight: 700,
                          ),
                          const Text('Accepted'),
                        ],
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.close,
                            color: Color(0xffff0000),
                            weight: 700,
                          ),
                          Text('Rejected'),
                        ],
                      )
                    ],
                  ),
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
                  Text(
                    'Putri Ayu Tarra',
                    style: primaryTextStyle.copyWith(
                      fontWeight: regular,
                      fontSize: 14.0,
                    ),
                  ),
                  Text(
                    'Anugrah Lautan Luas, PT',
                    style: primaryTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 10.0,
                  ),
                  backgroundColor: getDocumentTypeColor(documentType),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.description,
                          color: primaryColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          getDocumentTypeText(documentType),
                          style: primaryTextStyle.copyWith(
                              fontWeight: medium,
                              fontSize: 16.0,
                              color: primaryColor),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.download,
                      color: primaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

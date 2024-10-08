import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class ReceivedDocumentDataCard extends StatelessWidget {
  final int documentType;
  // 0 = Document Not Found (RED)
  // 1 = Bill of Lading
  // 2 = Cargo Manifest
  // 3 = Timesheet

  const ReceivedDocumentDataCard({super.key, this.documentType = 0});

  @override
  Widget build(BuildContext context) {
    String getDocumentTypeText(int documentType) {
      switch (documentType) {
        case 0:
          return 'Document Not Found';
        case 1:
          return 'Bill of Lading';
        case 2:
          return 'Cargo Manifest';
        case 3:
          return 'Timesheet';
        default:
          return 'Unknown Document Type';
      }
    }

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.black),
            borderRadius: BorderRadius.circular(5.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('2024-02-29'),
                  Text('VO/0250/PML/20'),
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
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Putri Ayu Tarra',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                    ),
                  ),
                  Text(
                    'Anugrah Lautan Luas, PT',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
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
                        const Icon(
                          Icons.description,
                          color: AppColors.primaryColor,
                        ),
                        const SpaceWidth(10),
                        Text(
                          getDocumentTypeText(documentType),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                              color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.download,
                      color: AppColors.primaryColor,
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

import 'package:flutter/material.dart';
import 'package:pml_ship_admin/theme.dart';

class CustomerDataCard extends StatelessWidget {
  const CustomerDataCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      padding: EdgeInsets.symmetric(vertical: 10),
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
                Text('2024-02-29T04:25:05+00:00'),
                Text('VO/0250/PML/20'),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Putri Ayu Tarra',
                      style: primaryTextStyle.copyWith(
                          fontWeight: medium, fontSize: 18.0),
                    ),
                    Text(
                      'Anugrah Lautan Luas, PT',
                      style: primaryTextStyle.copyWith(
                          fontWeight: bold, fontSize: 18.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 10.0,
                    ),
                    backgroundColor: secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                    ),
                  ),
                  onPressed: () {
                    // Navigator.pushNamed(context, '/verify-customer');
                  },
                  child: Text(
                    'Customer Detail',
                    style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 16.0,
                        color: primaryColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

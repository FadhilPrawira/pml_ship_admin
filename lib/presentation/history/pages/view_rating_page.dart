import 'package:flutter/material.dart';

import '../../../core/core.dart';

class ViewRatingPage extends StatelessWidget {
  const ViewRatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: AppColors.gray4,
        title: Container(
          padding: const EdgeInsets.all(30.0),
          child: const Text(
            'Customer Payment Data',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
      );
    }

    Widget shipIdentity() {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        height: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Expanded(
                  // Wrap the image with Expanded
                  child: Assets.image.ship.imageShipAuroraChristine.image(
                    width: 150.0,
                    fit: BoxFit
                        .contain, // Ensure the image fits within the available space
                  ),
                ),
              ],
            ),
            const SpaceWidth(20),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('JKT-SBY'),
                Text('Coal 5 MT'),
                Text('2024-02-29')
              ],
            )
          ],
        ),
      );
    }

    Widget rate() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.icon.iconStarColored.image(
            height: 40,
          ),
          const SpaceWidth(10),
          Assets.icon.iconStarColored.image(
            height: 40,
          ),
          const SpaceWidth(10),
          Assets.icon.iconStarColored.image(
            height: 40,
          ),
          const SpaceWidth(10),
          Assets.icon.iconStarBlank.image(
            height: 40,
          ),
          const SpaceWidth(10),
          Assets.icon.iconStarBlank.image(
            height: 40,
          ),
        ],
      );
    }

    Widget giveReview() {
      return Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Berikan ulasan untuk pesanan ini',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SpaceHeight(20),
            Container(
              height: 300.0,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.black),
                borderRadius: BorderRadius.circular(
                  5.0,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration.collapsed(
                        hintText: 'Tulis deskripsi Anda untuk pesanan ini',
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget rejectOrVerify() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: TextButton(
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
                'Batal',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                    color: AppColors.primaryColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: TextButton(
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
                'Kirim',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                    color: AppColors.primaryColor),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: header(),
      body: ListView(
        children: [
          shipIdentity(),
          rate(),
          giveReview(),
          rejectOrVerify(),
        ],
      ),
    );
  }
}

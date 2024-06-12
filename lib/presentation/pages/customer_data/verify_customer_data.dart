import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/styles.dart';
import '../../../data/models/request/approve_user_or_conference_request_model.dart';
import '../../../data/models/request/reject_user_or_conference_request_model.dart';
import '../../bloc/customerData/approveUser/approve_user_bloc.dart';
import '../../bloc/customerData/profileAndDetailCustomer/profile_and_detail_customer_bloc.dart';
import '../../bloc/customerData/rejectUser/reject_user_bloc.dart';

class VerifyCustomerDataPage extends StatefulWidget {
  final int userId;
  const VerifyCustomerDataPage({
    super.key,
    required this.userId,
  });

  @override
  State<VerifyCustomerDataPage> createState() => _VerifyCustomerDataPageState();
}

class _VerifyCustomerDataPageState extends State<VerifyCustomerDataPage> {
  @override
  void initState() {
    context
        .read<ProfileAndDetailCustomerBloc>()
        .add(ProfileAndDetailCustomerEvent.getFullUserData(widget.userId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          padding: EdgeInsets.all(defaultMargin),
          child: Text(
            'Verify Customer Data',
            style:
                primaryTextStyle.copyWith(fontWeight: semiBold, fontSize: 18),
          ),
        ),
      ),
      body: BlocBuilder<ProfileAndDetailCustomerBloc,
          ProfileAndDetailCustomerState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const Center(child: Text('Error'));
            },
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
            success: (user) {
              return ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 20.0,
                      left: defaultMargin,
                      right: defaultMargin,
                    ),
                    child: Text(
                      'PIC Info',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: primaryColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'PIC Name',
                              style: primaryTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 12,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
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
                                  user.data.name,
                                  style: primaryTextStyle.copyWith(
                                    fontWeight: medium,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'PIC Phone',
                              style: primaryTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 12,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
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
                                  user.data.phone,
                                  style: primaryTextStyle.copyWith(
                                    fontWeight: medium,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'PIC Email',
                              style: primaryTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 12,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
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
                                  user.data.email,
                                  style: primaryTextStyle.copyWith(
                                    fontWeight: medium,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 20.0,
                      left: defaultMargin,
                      right: defaultMargin,
                    ),
                    child: Text(
                      'Company Info',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: primaryColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Company Name
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Company Name',
                              style: primaryTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 12,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
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
                                  user.data.companyName,
                                  style: primaryTextStyle.copyWith(
                                    fontWeight: medium,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Company Tax Identification Number (TIN)/NPWP
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Company NPWP',
                              style: primaryTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 12,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
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
                                  user.data.companyNpwp,
                                  style: primaryTextStyle.copyWith(
                                    fontWeight: medium,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Company Address
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Company Address',
                              style: primaryTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 12,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
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
                                  user.data.companyAddress,
                                  style: primaryTextStyle.copyWith(
                                    fontWeight: medium,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Company Phone
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Company Phone',
                              style: primaryTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 12,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
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
                                  user.data.companyPhone,
                                  style: primaryTextStyle.copyWith(
                                    fontWeight: medium,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Company Email
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Company Email',
                              style: primaryTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 12,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
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
                                  user.data.companyEmail,
                                  style: primaryTextStyle.copyWith(
                                    fontWeight: medium,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Akta Perusahaan',
                              style: primaryTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 12,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
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
                                  user.data.companyAktaUrl,
                                  style: primaryTextStyle.copyWith(
                                    fontWeight: medium,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BlocListener<RejectUserBloc, RejectUserState>(
                          listener: (context, state) {
                            state.maybeMap(
                              orElse: () {},
                              error: (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(e.message),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              },
                              success: (value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'User ${user.data.companyName} rejected successfully'),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                                Navigator.pop(context);
                              },
                            );
                          },
                          child: TextButton(
                            onPressed: () {
                              final dataRequest =
                                  RejectUserOrConferenceRequestModel(
                                rejectedDate: DateTime.now(),
                              );
                              context.read<RejectUserBloc>().add(
                                    RejectUserEvent.rejectUser(
                                      dataRequest,
                                      widget.userId,
                                    ),
                                  );
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            child: Text(
                              'Reject',
                              style: primaryTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 16.0,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ),
                        BlocListener<ApproveUserBloc, ApproveUserState>(
                          listener: (context, state) {
                            state.maybeMap(
                              orElse: () {},
                              error: (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(e.message),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              },
                              success: (value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'User ${user.data.companyName} approved successfully'),
                                    backgroundColor: Colors.green,
                                  ),
                                );

                                Navigator.pop(context);
                              },
                            );
                          },
                          child: TextButton(
                            onPressed: () {
                              final dataRequest =
                                  ApproveUserOrConferenceRequestModel(
                                approvedDate: DateTime.now(),
                              );
                              context.read<ApproveUserBloc>().add(
                                    ApproveUserEvent.approveUser(
                                      dataRequest,
                                      widget.userId,
                                    ),
                                  );
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: verifyCheck,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            child: Text(
                              'Verify',
                              style: primaryTextStyle.copyWith(
                                  fontWeight: medium,
                                  fontSize: 16.0,
                                  color: primaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

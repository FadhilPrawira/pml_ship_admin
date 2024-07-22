import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../../data/datasources/auth_local_datasource.dart';
import '../../auth/bloc/logout/logout_bloc.dart';
import '../../auth/pages/sign_in_page.dart';
import '../bloc/get_authenticated_user/get_authenticated_user_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    context
        .read<GetAuthenticatedUserBloc>()
        .add(const GetAuthenticatedUserEvent.getAuthenticatedUser());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        toolbarHeight: 124.0, //Didapat dari Figma
        titleSpacing:
            0, //Untuk menghilangkan padding dari leading (leading = biasanya berupa tombol back)
        backgroundColor: AppColors.gray4,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Container(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage:
                    AssetImage(Assets.image.imageProfileExample.path),
                radius: 30.0,
              ),
              const SizedBox(
                width: 16,
              ),
              const SpaceWidth(16),
              Expanded(
                child: BlocBuilder<GetAuthenticatedUserBloc,
                    GetAuthenticatedUserState>(
                  builder: (context, state) {
                    String? name = '';
                    String? email = '';
                    state.maybeWhen(
                      orElse: () {},
                      loaded: (profile) {
                        name = profile.data?.user!.name!;
                        email = profile.data?.user!.email!;
                      },
                    );
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$name',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                        Text(
                          '$email',
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocListener<LogoutBloc, LogoutState>(
                listener: (context, state) {
                  state.maybeMap(
                    orElse: () {},
                    error: (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(e.message),
                          backgroundColor: AppColors.red,
                        ),
                      );
                    },
                    success: (value) {
                      AuthLocalDataSource().removeAuthData();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Logout success'),
                          backgroundColor: AppColors.green,
                        ),
                      );
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInPage(),
                        ),
                        (route) => false,
                      );
                    },
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Button.filled(
                    onPressed: () {
                      context
                          .read<LogoutBloc>()
                          .add(const LogoutEvent.logout());
                    },
                    label: 'Logout',
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}

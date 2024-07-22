import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../data/datasources/auth_local_datasource.dart';
import '../../home/pages/main_page.dart';
import '../bloc/login/login_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String password = ''; // Initialize the password variable
  bool showPassword = true; // Initialize the showPassword flag

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void toggleShowPassword() {
    setState(() {
      showPassword = !showPassword; // Toggle the showPassword flag
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget forgotPassword() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/recover-password');
        },
        child: Container(
          padding: const EdgeInsets.only(top: 10),
          child: const Text(
            'I forget my password',
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Stack(
          children: [
            SizedBox(
              height: 250.0,
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Center(
                    child:
                        Assets.image.imageAppLogoTransparentBackground.image()),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(28.0)),
                  child: ColoredBox(
                    color: AppColors.gray5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              color: AppColors.blue,
                            ),
                          ),
                          const SpaceHeight(8.0),
                          const Text(
                            'Masukkan kredensial akun untuk melanjutkan masuk dalam aplikasi',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: AppColors.black,
                            ),
                          ),
                          const SpaceHeight(14.0),
                          CustomTextField(
                            controller: emailController,
                            label: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            prefixIcon: const Icon(
                              Icons.email,
                              color: AppColors.black,
                            ),
                          ),
                          const SpaceHeight(18.0),
                          CustomTextField(
                            controller: passwordController,
                            label: 'Password',
                            obscureText: showPassword,
                            textInputAction: TextInputAction.done,
                            prefixIcon: const Icon(
                              Icons.key,
                              color: AppColors.black,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(showPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: toggleShowPassword,
                            ),
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.end,
                          //   children: [
                          //     forgotPassword(),
                          //   ],
                          // ),
                          const SpaceHeight(33.0),
                          BlocConsumer<LoginBloc, LoginState>(
                            listener: (context, state) {
                              state.maybeWhen(
                                orElse: () {},
                                error: (message) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(message),
                                      backgroundColor: AppColors.red,
                                    ),
                                  );
                                },
                                success: (data) {
                                  AuthLocalDataSource().saveAuthData(data);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Login success'),
                                      backgroundColor: AppColors.gray1,
                                    ),
                                  );
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const MainPage(),
                                    ),
                                  );
                                },
                              );
                            },
                            builder: (context, state) {
                              return state.maybeWhen(
                                loading: () => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                orElse: () {
                                  return Button.filled(
                                    onPressed: () {
                                      context.read<LoginBloc>().add(
                                            LoginEvent.login(
                                              email: emailController.text,
                                              password: passwordController.text,
                                            ),
                                          );
                                    },
                                    label: 'Sign In',
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:lesson1/infrastructure/utils/routes.dart';
import 'package:lesson1/infrastructure/utils/styles.dart';

import '../../../../infrastructure/utils/consts.dart';
import '../../../widgets/text_field.dart';
import '../widgets/app_bar.dart';
import '../widgets/mini_button.dart';
import 'bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool emailEnable = false;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final _passwordController = TextEditingController();
  bool isError = false;
  bool passwordEnable = false;
  bool hide = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthAppBar(
        title: 'Log in',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Text(
                'Email or username',
                style: TextStyles.textTitle(),
              ),
              const SizedBox(height: 16),
              CTextField(
                keyboardType: TextInputType.emailAddress,
                hintText: 'Enter your email',
                validator: (p02) {
                  if (p02 != null && !p02.contains('@')) {
                    return 'Введите почту корректно';
                  }
                  return null;
                },
                controller: _emailController,
                onChanged: (p02) {
                  if (p02.isNotEmpty) {
                    setState(() {
                      emailEnable = true;
                    });
                  } else {
                    setState(() {
                      emailEnable = false;
                    });
                  }
                },
              ),
              const SizedBox(height: 24),
              Text(
                'Password',
                style: TextStyles.textTitle(),
              ),
              const SizedBox(height: 16),
              CTextField(
                style: TextStyles.main(
                    color: isError ? AppColors.red : Colors.white),
                errorTextStyle: TextStyles.textGrey(color: AppColors.red),
                obscureText: hide,
                suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        hide = !hide;
                      });
                    },
                    child: Icon(
                      hide
                          ? Icons.remove_red_eye_outlined
                          : Icons.visibility_off_outlined,
                      color: Colors.white,
                    )),
                prefix: const SizedBox(width: 16),
                validator: (p03) {
                  if (p03 != null && p03.length < 8) {
                    setState(() {
                      isError = true;
                    });
                    return 'Use at least 8 characters';
                  }
                  setState(() {
                    isError = false;
                  });
                  return null;
                },
                controller: _passwordController,
                onChanged: (p03) {
                  if (p03.isNotEmpty) {
                    setState(() {
                      passwordEnable = true;
                    });
                  } else {
                    setState(() {
                      passwordEnable = false;
                    });
                  }
                },
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.center,
                child: BlocConsumer<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return MiniBtn(
                      isLoading: state is LoginLoading,
                      onTap: () async {
                        if (formKey.currentState?.validate() == true) {
                          context.read<LoginBloc>().add(LoginOnTap(
                              email: _emailController.text,
                              password: _passwordController.text));
                        }
                      },
                      text: 'Next',
                      enable: emailEnable && passwordEnable,
                    );
                  },
                  listener: (BuildContext context, LoginState state) {
                    if (state is LoginLoaded) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRoutes.main, (Route route) => false);
                    }
                  },
                ),
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Log in without password',
                  style: TextStyles.searchHint(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

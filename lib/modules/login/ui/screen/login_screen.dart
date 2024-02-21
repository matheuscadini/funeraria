import 'package:flutter/material.dart';
import 'package:flutter_funeraria/core/styles/text_extension.dart';
import 'package:get/get.dart';

import '../../../../core/routes/routes_getx.dart';
import '../../../../core/styles/custom_colors.dart';
import '../../../../core/widgets/custom_form_field.dart';
import '../../application/login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: CustomColors.background,
      body: Stack(children: [
        Center(
          child: Container(
            alignment: Alignment.center,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset(
                    "caixao.png",
                    color: Colors.black,
                  )),
              SizedBox(
                  width: 300,
                  child: CustomTextFormField(
                    controller: emailController,
                    hintLabel: 'Email',
                    icons: Icons.email,
                  )),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: 300,
                  child: CustomTextFormField(
                      controller: passwordController,
                      hintLabel: 'Password',
                      icons: Icons.key,
                      isPasswordField: true)),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 16,
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      CustomColors.blackCollor),
                ),
                child: const Text(
                  'Login',
                ).textButtonRegister,
                onPressed: () {
                  login(emailController.text, passwordController.text);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  Get.offAllNamed(RoutesGetx.enrollmentUser);
                },
                child: Text(
                  "Criar conta",
                  style: TextStyle(color: CustomColors.blackCollor),
                ),
              ),
            ]),
          ),
        )
      ]),
    );
  }
}

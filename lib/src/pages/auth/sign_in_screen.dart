import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages_routes/app_page.dart';
import '../../config/custom_colors.dart';
import '../common_widgets/app_name_widget.dart';
import '../common_widgets/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppNameWidget(
                    greenTitleColor: Colors.white,
                    textSize: 40,
                  ),
                  SizedBox(
                    height: 50,
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      child: AnimatedTextKit(
                        pause: Duration.zero,
                        repeatForever: true,
                        animatedTexts: [
                          FadeAnimatedText('Frutas'),
                          FadeAnimatedText('Verduras'),
                          FadeAnimatedText('Legumes'),
                          FadeAnimatedText('Carnes'),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
              Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 40,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(45),
                    ),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextField(
                          label: 'E-mail',
                          icon: Icons.email,
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return 'Digite seu e-mail';
                            }
                            if (!email.isEmail) {
                              return 'Digite seu e-mail válido!';
                            }

                            return null;
                          },
                        ),
                        CustomTextField(
                            label: 'Senha',
                            icon: Icons.lock,
                            isSecret: true,
                            validator: (password) {
                              if (password == null || password.isEmpty) {
                                return 'Digite sua senha!';
                              }
                              if (password.length < 7) {
                                return 'Digite sua senha com pelo menos 7 caracteres';
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18))),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Get.toNamed(PagesRoutes.baseRoute);
                              }

                              // Navigator.of(context).pushReplacement(
                              //     MaterialPageRoute(builder: (c) {
                              //   return const BaseScreen();
                              // }));
                            },
                            child: const Text(
                              'Entrar',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text('Esqueceu a senha',
                                style: TextStyle(
                                  color: CustomColors.customContrastColor,
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.grey.withAlpha(90),
                                  thickness: 2,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Text('Ou'),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.grey.withAlpha(90),
                                  thickness: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 50,
                              width: 430,
                              child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    side: const BorderSide(
                                        width: 2, color: Colors.green),
                                  ),
                                  onPressed: () {
                                    Get.toNamed(PagesRoutes.signupRoute);
                                  },
                                  child: const Text(
                                    'Criar conta',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

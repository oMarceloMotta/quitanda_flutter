import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../config/custom_colors.dart';
import '../../services/validators.dart';
import '../common_widgets/custom_text_field.dart';
import 'controller/auth_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );
  final phoneFormatter = MaskTextInputFormatter(
    mask: '## # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );
  final _formKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text('Cadastro',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                          )),
                    ),
                  ),
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
                              icon: Icons.email,
                              label: 'Email',
                              validator: emailValidator,
                              onSaved: (value) {
                                authController.user.email = value;
                              },
                              textInputType: TextInputType.emailAddress,
                            ),
                            CustomTextField(
                                icon: Icons.lock,
                                label: 'Senha',
                                onSaved: (value) {
                                  authController.user.password = value;
                                },
                                validator: passwordValidator,
                                isSecret: true),
                            CustomTextField(
                              validator: nameValidator,
                              icon: Icons.person,
                              onSaved: (value) {
                                authController.user.name = value;
                              },
                              label: 'Nome',
                            ),
                            CustomTextField(
                              validator: phoneValidator,
                              inputFormatters: [phoneFormatter],
                              icon: Icons.phone,
                              onSaved: (value) {
                                authController.user.phone = value;
                              },
                              textInputType: TextInputType.phone,
                              label: 'Celular',
                            ),
                            CustomTextField(
                                validator: cpfValidator,
                                icon: Icons.file_copy,
                                label: 'CPF',
                                onSaved: (value) {
                                  authController.user.cpf = value;
                                },
                                textInputType: TextInputType.number,
                                inputFormatters: [cpfFormatter]),
                            SizedBox(
                                height: 50,
                                child: Obx(() {
                                  return ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    )),
                                    onPressed: () {
                                      FocusScope.of(context).unfocus();
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        authController.signUp();
                                      }
                                    },
                                    child: authController.isLoading.value
                                        ? const CircularProgressIndicator()
                                        : const Text(
                                            'Cadastrar',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                  );
                                }))
                          ],
                        ),
                      )),
                ],
              ),
              Positioned(
                left: 15,
                top: 15,
                child: SafeArea(
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

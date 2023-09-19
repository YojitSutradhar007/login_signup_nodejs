import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../model/model.dart';
import '../../../resources/resources.dart';
import '../../../routes/routes_name.dart';
import '../../../services/api_services.dart';
import '../../../services/services.dart';
import '../../../widget/widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

void requiredAllFilled(BuildContext context) {
  final bar = WarningBar();

  final notExist = bar.snack("Required All Filed", Colors.red);
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(notExist);
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final bar = WarningBar();
  final List<SignUpModel>signupData=[];

  @override
  void dispose() {
    super.dispose();
    _userController.dispose();
    _emailController.dispose();
    _passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance.focusManager.primaryFocus
            ?.unfocus(); // unfocus the text field on tapping gesture deatector
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Check Nodejs",
                      style: TextStyle(
                        fontSize: 34,
                      ),
                    ),
                    const Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: PrimaryTextFilled(
                        controller: _emailController,
                        hintText: StringManager.emailHintTxt,
                        labelText: StringManager.emailLabelTxt,
                        prefixIcon: const Icon(
                          Icons.mail_rounded,
                          color: ColorManager.gradientPurpleColor,
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: PrimaryPassField(
                        textPassCtrl: _passController,
                        hintText: StringManager.passHintTxt,
                        labelText: StringManager.passLabelTxt,
                        prefixIcon: const Icon(
                          Icons.password_rounded,
                          color: ColorManager.gradientPurpleColor,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_emailController.text.trim() == "" ||
                            _emailController.text.trim().isEmpty ||
                            _passController.text.trim() == "" ||
                            _passController.text.trim().isEmpty) {
                          requiredAllFilled(context);
                        } else {
                          final checkAuth= await ApiServices().addUser({
                            "email": _emailController.text.trim(),
                            "password": _passController.text.trim(),
                          });/*.then((value) {
                            log("ADD SUCCESSFULLY");
                            log(value.toString());
                          });*/
                          signupData.add(SignUpModel.fromJson(checkAuth));

                          log(signupData.length.toString());
                          log(signupData[0].success.toString());


                        }
                      },
                      child: const Text("Signup"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: ElevatedButton(
                        onPressed: () {
                          context.go(RoutesName.loginScreen); //navgationto login screen
                        },
                        child: const Text("Login"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

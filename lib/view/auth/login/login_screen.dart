import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../resources/resources.dart';
import '../../../routes/routes_name.dart';
import '../../../widget/widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

void requiredAllFilled(BuildContext context) {
  final bar = WarningBar();

  final notExist = bar.snack("Required All Filed", Colors.red);
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(notExist);
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final bar = WarningBar();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    print("SizeWidth:$screenWidth ");
    print("SizeHeight:$screenHeight ");
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Check Nodejs",
                          style: TextStyle(
                            fontSize: 34,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 12),
                          child: Text(
                            "Login to the web app",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: PrimaryTextFilled(
                            controller: _emailController,
                            hintText: "Enter Email",
                            labelText: "Email",
                            prefixIcon: const Icon(
                              Icons.mail_rounded,
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: PrimaryPassField(
                            textPassCtrl: _passController,
                            hintText: "Enter Password",
                            labelText: "Password",
                            prefixIcon: const Icon(
                              Icons.password_rounded,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
                            if (_emailController.text.trim() == "" ||
                                _emailController.text.trim().isEmpty ||
                                _passController.text.trim() == "" ||
                                _passController.text.trim().isEmpty) {
                              requiredAllFilled(context); // through scaffold snackbar
                            } else {

                            }
                          },
                          child: const Text("Login"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: ElevatedButton(
                            onPressed: () {
                              context.goNamed(RoutesName.signupName); // navigate to the signup screen
                            },
                            child: const Text("SignUp"),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

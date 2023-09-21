import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:login_signup_nodejs/routes/routes_name.dart';
import 'package:go_router/go_router.dart';
import '../../model/token_model.dart';
import '../../services/api_services.dart';
import '../../services/user_preferences.dart';

// Splash Screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final userPreferences = UserPreferences();
  final List<TokenAuth> userToken = [];

  @override
  void initState() {
    super.initState();
    checkUserCredentials();
  }

  void checkUserCredentials() async {
    await userPreferences.getUserInfo(); // Give the user token
    await authCheck(); // fetch the user token information from the server
    navigation(); // then navigate to authenticate(on the basis of the result) screen
  }

  void navigation() {
    Duration duration = const Duration(seconds: 3);
    log(userPreferences.token!);
    Future.delayed(
      duration,
      () {
        if (userToken.first.sucess == true) {
          log("Token successfully authenticated");
          context.go(RoutesName.homeScreen);
        } else if (userToken.first.sucess == false) {
          log("Failed token");
          context.go(RoutesName.loginScreen);
        } else {
          log("Something went wrong");
          context.go(RoutesName.loginScreen);
        }
      },
    );
  }

  Future authCheck() async {
    final data = await ApiServices().checkAuthToken({"token": userPreferences.token!});
    userToken.add(TokenAuth.fromJson(data));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Check Nodejs",
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Center(
                child: SpinKitFoldingCube(
                  color: Colors.black,
                  size: 45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

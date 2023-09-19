import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:login_signup_nodejs/routes/routes_name.dart';
import 'package:go_router/go_router.dart';
// Splash Screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigation();
  }
  void navigation() {
    Duration duration = const Duration(seconds: 3);
    Future.delayed(
      duration,
          () {
            context.go(RoutesName.loginScreen);
          },
    );
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

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// this is the Loading animation
class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple.withOpacity(0.7),
      child: const Center(
        child: SpinKitFoldingCube(
          color: Colors.black,
          size: 45,
        ),
      ),
    );
  }
}

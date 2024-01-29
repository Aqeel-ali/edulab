// Purpose: Splash Screen

import 'package:flutter/material.dart';

import '../../theme/Theme.dart';
import '../login&singUp/login.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(microseconds: 11), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LoginScreen()));
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset(
                logo,
                height: 350,
                width: 350,
              ),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(ScoColor),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

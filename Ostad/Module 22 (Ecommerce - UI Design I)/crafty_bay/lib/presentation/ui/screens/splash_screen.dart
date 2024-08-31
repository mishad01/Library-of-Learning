import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Spacer(),
              SvgPicture.asset('assets/images/logo.svg', width: 150),
              const Spacer(),
              CircularProgressIndicator(),
              SizedBox(height: 20),
              Text('Version'),
            ],
          ),
        ),
      ),
    );
  }
}

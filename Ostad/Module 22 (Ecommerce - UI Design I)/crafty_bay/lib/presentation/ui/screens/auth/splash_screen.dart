import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/main_bottom_navbar_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _moveToNextScreen() async {
    bool isUserLoggedIn = await AuthController.checkAuthState();
    await Future.delayed(const Duration(seconds: 2));
    Get.off(() => isUserLoggedIn
        ? const MainBottomNavbarScreen()
        : const MainBottomNavbarScreen());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              AppLogoWidget(),
              Spacer(),
              CircularProgressIndicator(),
              SizedBox(height: 20),
              Text('Version', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AssetsPath.appLogo, width: 150);
  }
}

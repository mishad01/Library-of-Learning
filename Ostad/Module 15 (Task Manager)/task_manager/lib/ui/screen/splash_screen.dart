import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/ui/utility/asset_paths.dart';
import 'package:task_manager/ui/widgets/background_widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: SvgPicture.asset(AssetPaths.backgroundSvg),
        body: BackgroundWidget(
      child: Center(child: SvgPicture.asset(AssetPaths.appLogoSvg)),
    ));
  }
}

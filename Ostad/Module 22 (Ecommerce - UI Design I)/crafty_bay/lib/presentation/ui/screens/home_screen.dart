import 'package:crafty_bay/presentation/ui/screens/widgets/app_bar_icon.dart';
import 'package:crafty_bay/presentation/ui/screens/widgets/home_banner_slider.dart';
import 'package:crafty_bay/presentation/ui/screens/widgets/search_text_field.dart';
import 'package:crafty_bay/presentation/ui/screens/widgets/section_header.dart';
import 'package:crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*Container(
                // margin: const EdgeInsets.symmetric(horizontal: 16.0),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: SearchTextField(
                    textEditingController: TextEditingController()),
              ),*/
              /*TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  border: InputBorder.none,
                  enabledBorder:
                      InputBorder.none, // Ensures no border when enabled
                  focusedBorder:
                      InputBorder.none, // Ensures no border when focused
                  errorBorder: InputBorder
                      .none, // Ensures no border when there's an error
                  disabledBorder: InputBorder.none, // Ensu
                ),
              ),*/
              SearchTextField(textEditingController: TextEditingController()),
              const SizedBox(height: 16),
              const HomeBannerSlider(),
              const SizedBox(height: 10),
              _buildAllCategoriesScreen()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAllCategoriesScreen() {
    return Column(
      children: [
        SectionHeader(title: 'All Categories', onTap: () {}),
        const SizedBox(height: 10),
        SizedBox(
          height: 140,
          child: _buildAllCategorieslistView(),
        ),
      ],
    );
  }

  Widget _buildAllCategorieslistView() {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(width: 8),
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              //height: 130,
              decoration: BoxDecoration(
                color: AppColors.themeColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.computer,
                  size: 48, color: AppColors.themeColor),
            ),
            const SizedBox(height: 4),
            const Text('Electronics',
                style: TextStyle(color: AppColors.themeColor)),
          ],
        );
      },
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: SvgPicture.asset('assets/images/logo_nav.svg'),
      actions: [
        AppBarIcon(
          iconData: Icons.person_outline,
          onTap: () {},
        ),
        const SizedBox(width: 10),
        AppBarIcon(
          iconData: Icons.phone_outlined,
          onTap: () {},
        ),
        const SizedBox(width: 10),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: AppBarIcon(
            iconData: Icons.notifications_outlined,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

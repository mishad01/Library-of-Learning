import 'package:crafty_bay/presentation/ui/screens/widgets/app_bar_icon.dart';
import 'package:crafty_bay/presentation/ui/screens/widgets/home_banner_slider.dart';
import 'package:crafty_bay/presentation/ui/screens/widgets/search_text_field.dart';
import 'package:crafty_bay/presentation/ui/screens/widgets/section_header.dart';
import 'package:crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:crafty_bay/presentation/ui/utils/assets_path.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                const SizedBox(height: 16),
                SearchTextField(textEditingController: TextEditingController()),
                const SizedBox(height: 16),
                const HomeBannerSlider(),
                const SizedBox(height: 16),
                _buildAllCategoriesScreen(),
                const SizedBox(height: 10),
                SectionHeader(title: 'Popular', onTap: () {}),
                SizedBox(height: 126, child: _buildProductListView()),
              ],
            ),
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
          height: 120,
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

  Widget _buildProductListView() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                width: 120,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.themeColor.withOpacity(0.1),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      topLeft: Radius.circular(8)),
                  image: const DecorationImage(
                      image: AssetImage(AssetsPath.shoeImage),
                      fit: BoxFit.scaleDown),
                ),
              ),
              const Text('Product Name',
                  style: TextStyle(color: AppColors.themeColor)),
              Row(
                children: [
                  const Text('120'),
                ],
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(width: 10),
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

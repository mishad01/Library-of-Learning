import 'package:crafty_bay/presentation/ui/screens/widgets/home/app_bar_icon.dart';
import 'package:crafty_bay/presentation/ui/screens/widgets/home/horizontal_category_listView.dart';
import 'package:crafty_bay/presentation/ui/screens/widgets/home/horizontal_product_view_list.dart';
import 'package:crafty_bay/presentation/ui/screens/widgets/home/search_text_field.dart';
import 'package:crafty_bay/presentation/ui/screens/widgets/home_banner_slider.dart';
import 'package:crafty_bay/presentation/ui/screens/widgets/section_header.dart';
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
                _buildAllCategoriesScreen(),
                _buildPopularProductSection(),
                _buildNewProductSection(),
                _buildSpecialProductSection(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPopularProductSection() {
    return Column(
      children: [
        SectionHeader(title: 'Popular', onTap: () {}),
        SizedBox(height: 178, child: HorizontalProductListView()),
      ],
    );
  }

  Widget _buildNewProductSection() {
    return Column(
      children: [
        SectionHeader(title: 'Special', onTap: () {}),
        SizedBox(height: 178, child: HorizontalProductListView()),
      ],
    );
  }

  Widget _buildSpecialProductSection() {
    return Column(
      children: [
        SectionHeader(title: 'New', onTap: () {}),
        SizedBox(height: 178, child: HorizontalProductListView()),
      ],
    );
  }

  Widget _buildAllCategoriesScreen() {
    return Column(
      children: [
        SectionHeader(title: 'All Categories', onTap: () {}),
        const SizedBox(height: 10),
        SizedBox(height: 120, child: HorizontalCategoryListView()),
      ],
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

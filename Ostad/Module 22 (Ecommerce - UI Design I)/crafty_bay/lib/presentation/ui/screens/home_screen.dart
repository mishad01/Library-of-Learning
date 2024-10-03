import 'package:crafty_bay/presentation/state_holders/bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/state_holders/category_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/new_product_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/popular_product_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/special_product_list_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/build_product_cart.dart';
import 'package:crafty_bay/presentation/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/presentation/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
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
        GetBuilder<PopularProductListController>(
            builder: (popularProductListController) {
          return Visibility(
            visible: !popularProductListController.popularProductInProgress,
            replacement: CenteredCircularProgressIndicator(),
            child: BuildProductCart(
              productList: popularProductListController.popularProductList,
            ),
          );
        }),
      ],
    );
  }

  Widget _buildNewProductSection() {
    return Column(
      children: [
        SectionHeader(title: 'Special', onTap: () {}),
        GetBuilder<NewProductListController>(
            builder: (newProductListController) {
          return Visibility(
            visible: !newProductListController.newProductInProgress,
            replacement: CircularProgressIndicator(),
            child: BuildProductCart(
              productList: newProductListController.newProductList,
            ),
          );
        }),
      ],
    );
  }

  Widget _buildSpecialProductSection() {
    return Column(
      children: [
        SectionHeader(title: 'New', onTap: () {}),
        GetBuilder<SpecialProductListController>(
            builder: (specialProductListController) {
          return Visibility(
            visible: !specialProductListController.specialProductInProgress,
            replacement: CircularProgressIndicator(),
            child: BuildProductCart(
              productList: specialProductListController.specialProductList,
            ),
          );
        }),
      ],
    );
  }

  Widget _buildAllCategoriesScreen() {
    return Column(
      children: [
        SectionHeader(
            title: 'All Categories',
            onTap: () {
              Get.find<BottomNavBarController>().selectCategoryTab();
            }),
        const SizedBox(height: 10),
        SizedBox(
          height: 120,
          child: GetBuilder<CategoryListController>(
            builder: (categoryListController) {
              return Visibility(
                visible: !categoryListController.inProgress,
                replacement: CenteredCircularProgressIndicator(),
                child: HorizontalCategoryListView(
                  categoryList: categoryListController.categoryList,
                ),
              );
            },
          ),
        ),
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

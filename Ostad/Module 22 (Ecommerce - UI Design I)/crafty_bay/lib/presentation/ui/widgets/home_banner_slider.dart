import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/presentation/state_holders/slider_list_controller.dart';
import 'package:crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:crafty_bay/presentation/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBannerSlider extends StatefulWidget {
  const HomeBannerSlider({
    super.key,
  });

  @override
  State<HomeBannerSlider> createState() => _HomeBannerSliderState();
}

class _HomeBannerSliderState extends State<HomeBannerSlider> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SliderListController>(builder: (sliderListController) {
      return Visibility(
        visible: !sliderListController.inProgress,
        replacement: const SizedBox(
          height: 192,
          child: CenteredCircularProgressIndicator(),
        ),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 160.0,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  _selectedIndex.value = index;
                },
              ),
              items: sliderListController.sliders.map((slider) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                            color: AppColors.themeColor,
                            image: DecorationImage(
                                image: NetworkImage(slider.image ?? ""),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            /*SizedBox(
                              width: 180,
                              child: Image.asset(AssetsPath.shoeImage),
                            ),*/
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(slider.price ?? '',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600)),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  SizedBox(
                                    width: 150,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white38),
                                      child: const Text('Buy Now',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 200,
                            ),
                          ],
                        ));
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            ValueListenableBuilder(
                valueListenable: _selectedIndex,
                builder: (context, value, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0;
                          i < sliderListController.sliders.length;
                          i++)
                        Container(
                          height: 12,
                          width: 12,
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            color: _selectedIndex.value == i
                                ? AppColors.themeColor
                                : null,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey),
                          ),
                        )
                    ],
                  );
                })
          ],
        ),
      );
    });
  }

  @override
  void dispose() {
    _selectedIndex.dispose();
    super.dispose();
  }
}

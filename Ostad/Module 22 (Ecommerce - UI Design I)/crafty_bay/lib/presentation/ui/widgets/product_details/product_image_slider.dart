import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:flutter/material.dart';

class ProductImageSlider extends StatefulWidget {
  const ProductImageSlider({super.key, required this.sliderUrls});

  final List<String> sliderUrls;

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 220.0,
            onPageChanged: (index, reason) {
              _selectedIndex.value = index;
            },
            viewportFraction: 1,
          ),
          items: widget.sliderUrls.map((imageUrls) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  //margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    image: DecorationImage(
                        image: NetworkImage(imageUrls), fit: BoxFit.cover),
                  ),
                  alignment: Alignment.center,
                  /*child: Text(
                      'text $i',
                      style: TextStyle(fontSize: 16.0),
                    )*/
                );
              },
            );
          }).toList(),
        ),
        //SizedBox(height: 10),
        Positioned(
          bottom: 12,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
              valueListenable: _selectedIndex,
              builder: (context, value, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < widget.sliderUrls.length; i++)
                      Container(
                        height: 12,
                        width: 12,
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: _selectedIndex.value == i
                              ? AppColors.themeColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey),
                        ),
                      )
                  ],
                );
              }),
        )
      ],
    );
  }

  @override
  void dispose() {
    _selectedIndex.dispose();
    super.dispose();
  }
}

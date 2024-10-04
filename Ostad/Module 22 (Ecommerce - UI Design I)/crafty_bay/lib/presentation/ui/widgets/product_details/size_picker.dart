import 'package:crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({
    super.key,
    required this.sizes,
    required this.onSelectedColor,
  });
  final List<String> sizes;
  final Function(String) onSelectedColor;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  late String _selectedSize = widget.sizes.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Size', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: 8),
        //One Way
        /*...widget.colors.map((e) {
          return CircleAvatar();
        }).toList(),*/
        Wrap(
          spacing: 6,
          children: widget.sizes.map((e) {
            return GestureDetector(
              onTap: () {
                _selectedSize = e;
                widget.onSelectedColor(e);
                setState(() {});
              },
              child: Container(
                height: 30,
                width: 50,
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    border: Border.all(),
                    color: _selectedSize == e ? AppColors.themeColor : null),
                child: Center(
                  child: Text(
                    e,
                    style: TextStyle(
                        fontSize: 15,
                        color: _selectedSize == e ? Colors.white : null),
                  ),
                ),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}

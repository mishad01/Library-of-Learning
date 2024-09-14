import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    super.key,
    required this.colors,
    required this.onSelectedColor,
  });
  final List<Color> colors;
  final Function(Color) onSelectedColor;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  late Color _selectedColor = widget.colors.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Color', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: 8),
        //One Way
        /*...widget.colors.map((e) {
          return CircleAvatar();
        }).toList(),*/
        Wrap(
          spacing: 8,
          children: widget.colors.map((e) {
            return GestureDetector(
              onTap: () {
                _selectedColor = e;
                widget.onSelectedColor(e);
                setState(() {});
              },
              child: CircleAvatar(
                backgroundColor: e,
                radius: 16,
                child: Icon(
                  _selectedColor == e ? Icons.check : null,
                  color: Colors.white,
                ),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}

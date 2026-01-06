import 'package:flutter/material.dart';

class HueSlider extends StatelessWidget {
  final double hue;
  final ValueChanged<double> onChanged;

  const HueSlider({
    super.key,
    required this.hue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 14,
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: 10,
        ),
      ),
      child: Slider(
        min: 0,
        max: 360,
        value: hue,
        onChanged: onChanged,
        thumbColor: HSVColor.fromAHSV(1, hue, 1, 1).toColor(),
        activeColor: Colors.transparent,
        inactiveColor: Colors.transparent,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class OpacitySlider extends StatelessWidget {
  final double opacity; // 0.0 → 1.0
  final Color baseColor;
  final ValueChanged<double> onChanged;

  const OpacitySlider({
    super.key,
    required this.opacity,
    required this.baseColor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            baseColor.withOpacity(0),
            baseColor.withOpacity(1),
          ],
        ),
      ),
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          trackHeight: 14,
          thumbShape:
          const RoundSliderThumbShape(enabledThumbRadius: 10),
        ),
        child: Slider(
          min: 0,
          max: 1,
          value: opacity,
          onChanged: onChanged,
          activeColor: Colors.transparent,
          inactiveColor: Colors.transparent,
          thumbColor: baseColor.withOpacity(opacity),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_color_picker_view/features/color_picker/widgets/hue_gradient_track.dart';
import '../../../core/constants/app_colors.dart';
import '../widgets/color_tile.dart';
import '../widgets/hue_slider.dart';
import '../widgets/opacity_slider.dart';
import '../widgets/color_text_input.dart';

class ColorPickerView extends StatefulWidget {
  final ValueChanged<Color> onColorSelected;
  final Color? initialColor;

  const ColorPickerView({
    super.key,
    required this.onColorSelected,
    this.initialColor,
  });

  @override
  State<ColorPickerView> createState() => _ColorPickerViewState();
}

class _ColorPickerViewState extends State<ColorPickerView> {
  double hue = 0;
  double opacity = 1;
  late Color selectedColor;

  @override
  void initState() {
    super.initState();
    selectedColor = widget.initialColor ?? Colors.red;
    final hsv = HSVColor.fromColor(selectedColor);
    hue = hsv.hue;
    opacity = selectedColor.opacity;
  }

  void _update(Color color) {
    setState(() => selectedColor = color);
    widget.onColorSelected(color);
  }

  @override
  Widget build(BuildContext context) {
    final baseColor =
    HSVColor.fromAHSV(1, hue, 1, 1).toColor();

    return Column(
      children: [
        SizedBox(height: 12),
        HueGradientTrack(
          child: HueSlider(
            hue: hue,
            onChanged: (v) {
              hue = v;
              _update(
                HSVColor.fromAHSV(opacity, hue, 1, 1).toColor(),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        OpacitySlider(
          opacity: opacity,
          baseColor: baseColor,
          onChanged: (v) {
            opacity = v;
            _update(
              HSVColor.fromAHSV(opacity, hue, 1, 1).toColor(),
            );
          },
        ),
        const SizedBox(height: 12),
        ColorTextInput(
          color: selectedColor,
          onColorChanged: (c) {
            final hsv = HSVColor.fromColor(c);
            hue = hsv.hue;
            opacity = c.opacity;
            _update(c);
          },
        ),
        const SizedBox(height: 12),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: AppColors.palette.length,
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (_, i) {
              final color = AppColors.palette[i];
              return ColorTile(
                color: color,
                isSelected:
                selectedColor.value == color.value,
                onTap: () {
                  final hsv = HSVColor.fromColor(color);
                  hue = hsv.hue;
                  opacity = 1;
                  _update(color);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class ColorTextInput extends StatefulWidget {
  final Color color;
  final ValueChanged<Color> onColorChanged;

  const ColorTextInput({
    super.key,
    required this.color,
    required this.onColorChanged,
  });

  @override
  State<ColorTextInput> createState() => _ColorTextInputState();
}

class _ColorTextInputState extends State<ColorTextInput> {
  late TextEditingController hexController;
  late TextEditingController rgbController;

  @override
  void initState() {
    super.initState();
    hexController = TextEditingController();
    rgbController = TextEditingController();
    _syncFromColor(widget.color);
  }

  @override
  void didUpdateWidget(covariant ColorTextInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.color != widget.color) {
      _syncFromColor(widget.color);
    }
  }

  void _syncFromColor(Color color) {
    hexController.text =
    '#${color.value.toRadixString(16).substring(2).toUpperCase()}';
    rgbController.text =
    '${color.red}, ${color.green}, ${color.blue}';
  }

  void _onHexChanged(String value) {
    final hex = value.replaceAll('#', '');
    if (hex.length == 6) {
      final color = Color(int.parse('FF$hex', radix: 16));
      widget.onColorChanged(color);
    }
  }

  void _onRgbChanged(String value) {
    final parts = value.split(',');
    if (parts.length == 3) {
      try {
        final r = int.parse(parts[0].trim());
        final g = int.parse(parts[1].trim());
        final b = int.parse(parts[2].trim());
        if (r <= 255 && g <= 255 && b <= 255) {
          widget.onColorChanged(Color.fromARGB(255, r, g, b));
        }
      } catch (_) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: hexController,
              decoration: const InputDecoration(
                labelText: 'HEX',
                hintText: '#FFFFFF',
              ),
              onChanged: _onHexChanged,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: rgbController,
              decoration: const InputDecoration(
                labelText: 'RGB',
                hintText: '255, 255, 255',
              ),
              onChanged: _onRgbChanged,
            ),
          ),
        ],
      ),
    );
  }
}

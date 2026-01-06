import 'package:flutter/material.dart';
import 'package:flutter_color_picker_view/features/color_picker/widgets/color_picker_dialog.dart';

class ColorPickerDemoScreen extends StatefulWidget {
  const ColorPickerDemoScreen({super.key});

  @override
  State<ColorPickerDemoScreen> createState() => _ColorPickerDemoScreenState();
}

class _ColorPickerDemoScreenState extends State<ColorPickerDemoScreen> {
  Color selectedColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Color Picker Demo',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: selectedColor,
      ),
      body: Column(
        children: [
          Expanded(child: SizedBox(height: 20)),
          ElevatedButton(
            onPressed: () {
              showColorPickerDialog(
                context: context,
                initialColor: selectedColor,
                onColorSelected: (color) {
                  setState(() => selectedColor = color);
                },
              );
            },
            child: const Text('Pick Color'),
          ),
          Expanded(child: SizedBox(height: 20)),
          Container(
            height: 80,
            color: selectedColor,
            alignment: Alignment.center,
            child: const Text(
              'Selected Color',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

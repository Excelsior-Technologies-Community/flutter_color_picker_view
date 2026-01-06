import 'package:flutter/material.dart';
import 'package:flutter_color_picker_view/features/color_picker/view/color_picker_view.dart';

Future<void> showColorPickerDialog({
  required BuildContext context,
  Color? initialColor,
  required ValueChanged<Color> onColorSelected,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false, // 🔒
    builder: (_) {
      Color tempColor = initialColor ?? Colors.red;

      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: StatefulBuilder(
          builder: (context, setState) {
            return SizedBox(
              width: 420,
              height: 560,
              child: Column(
                children: [
                  Expanded(
                    child: ColorPickerView(
                      initialColor: tempColor,
                      onColorSelected: (color) {
                        tempColor = color; // temp only
                      },
                    ),
                  ),

                  const Divider(height: 1),

                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // ❌ discard
                          },
                          child: const Text('CANCEL'),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {
                            onColorSelected(tempColor); // ✅ confirm
                            Navigator.pop(context);
                          },
                          child: const Text('APPLY'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}

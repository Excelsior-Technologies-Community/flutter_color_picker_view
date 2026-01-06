# 🎨 Custom Color Picker

A **powerful yet easy-to-use Flutter color picker library** that provides  
a **professional dialog-based color picker** with minimal setup.

> Pick a color. Get the value. Done. ✅

---

## ✨ Features

✅ Dialog-based Color Picker (no UI handling by user)  
✅ Hue slider (full color spectrum)  
✅ Opacity / Transparency slider  
✅ HEX input support (`#FF5722`)  
✅ RGB input support (`255, 87, 34`)  
✅ Predefined color palette  
✅ Apply / Cancel buttons (safe UX)  
✅ One-line API for users  
✅ Mobile, Web & Desktop friendly  
✅ Future-ready & customizable  

---

## 📸 Preview

> Dialog-based color picker UI
## 📸 Preview

<p align="center">
  <img src="https://github.com/user-attachments/assets/c0db8b8b-ce77-48b9-bdfb-2aacb5f27267" width="45%" />
  <img src="https://github.com/user-attachments/assets/e61451a2-dae5-4f0c-9585-ed952834e59f" width="45%" />
</p>



---

## 📦 Installation
### Add this to your `pubspec.yaml`:
```yaml
dependencies:
  custom_color_picker:
    path: '../flutter_color_picker_view/custom_color_picker'
```

### Using GitHub (Recommended during development)
```yaml
dependencies:
  custom_color_picker:
    git:
      url: https://github.com/YOUR_USERNAME/custom_color_picker.git
```
---

## 🚀 Quick Usage (Recommended)
### 👉 One-line color picker (Dialog)
```dart
import 'package:custom_color_picker/custom_color_picker.dart';

Color selectedColor = Colors.blue;

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
);
```
✔ No dialog code   
✔ No bottom sheet code   
✔ No UI handling

### 🎨 Apply Color to Any Widget
```dart
Container(
  height: 120,
  decoration: BoxDecoration(
    color: selectedColor,
    borderRadius: BorderRadius.circular(16),
  ),
)
```
Works with:   
- Container
- Card
- Button
- AppBar
- Theme Color
- Border / Shadow / Gradient

---

## 🧩 Advanced Usage (Custom Layout)
If you want **full control**, you can directly use the widget:
```dart
Expanded(
  child: ColorPickerView(
   initialColor: color,
   onColorSelected: (color){
     setState(() {
       color = color;
     });
   },       
 ),
),
```
Recommended for:   
- Full screen pickers
- Side panels
- Custom layouts

---
## 🧠 API Reference
**🔹 `showColorPicker()`**
```dart
Future<void> showColorPicker({
  required BuildContext context,
  Color? initialColor,
  required ValueChanged<Color> onColorSelected,
});
```

| Parameter         | Description               |
| ----------------- | ------------------------- |
| `context`         | BuildContext              |
| `initialColor`    | Initial selected color    |
| `onColorSelected` | Callback with final color |

---

## 🎯 UX Behavior
- Dialog does **not close accidentally**
- User adjusts hue / opacity safely
- Color applied only on **APPLY**
- **CANCEL** discards changes

---

## 📄 License
```dart
Copyright (c) 2026 Excelsior Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy  
of this software and associated documentation files (the "Software"), to deal  
in the Software without restriction, including without limitation the rights  
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
copies of the Software, and to permit persons to whom the Software is  
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all  
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED **"AS IS"**, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```

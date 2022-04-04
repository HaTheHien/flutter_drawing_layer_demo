import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/enums/shape_option.dart';
import '../../model/shape/circle.dart';
import '../../model/shape/line.dart';
import '../../model/shape/no_shape.dart';
import '../../model/shape/oval.dart';
import '../../model/shape/rect.dart';
import '../../model/shape/shape.dart';
import '../../provider/painter_controller.dart';
import 'shape_chooser.dart';

class BottomToolBar extends StatefulWidget {
  const BottomToolBar({Key? key}) : super(key: key);

  @override
  _BottomToolBarState createState() => _BottomToolBarState();
}

class _BottomToolBarState extends State<BottomToolBar> {
  static const iconSize = 32.0;

  late PainterController painterController;
  Color selectedColor = Colors.black;
  ShapeOption selectedShape = ShapeOption.none;

  @override
  void initState() {
    painterController = context.read<PainterController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.colorScheme.surface,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Thickness'),
                Expanded(
                  child: Slider.adaptive(
                    value: painterController.thickness,
                    onChanged: (thickness) => setState(() {
                      painterController.thickness = thickness;
                    }),
                    label: painterController.thickness.round().toString(),
                    min: 1,
                    max: 40,
                  ),
                ),
              ],
            ),
          ),
          ShapeChooser(
            currentShape: selectedShape,
            onSelected: (value) {
              setState(() {
                selectedShape = value;
              });
              painterController.shape = value.getShape(
                painterController.getCurrentPaint(),
              );
            },
          ),
          IconButton(
            iconSize: iconSize,
            icon: Icon(
              Icons.color_lens_outlined,
              color: selectedColor,
              size: iconSize,
            ),
            onPressed: () => colorPickerDialog(context),
          ),
          IconButton(
            iconSize: iconSize,
            icon: const Icon(
              Icons.undo_outlined,
              // color: theme.primaryColor,
            ),
            onPressed: () => painterController.undo(),
          ),
          IconButton(
            iconSize: iconSize,
            icon: const Icon(
              Icons.layers_clear_outlined,
              // color: theme.primaryColor,
            ),
            onPressed: () => painterController.clear(),
          ),
        ],
      ),
    );
  }

  Future<bool> colorPickerDialog(BuildContext context) async {
    return ColorPicker(
      // Use the dialogPickerColor as start color.
      color: selectedColor,
      // Update the dialogPickerColor using the callback.
      onColorChanged: (color) => setState(() {
        selectedColor = color;
        painterController.drawColor = color;
      }),
      width: 40,
      height: 40,
      borderRadius: 4,
      spacing: 5,
      runSpacing: 5,
      wheelDiameter: 155,
      heading: Text(
        'Select color',
        style: Theme.of(context).textTheme.subtitle1,
      ),
      subheading: Text(
        'Select color shade',
        style: Theme.of(context).textTheme.subtitle1,
      ),
      wheelSubheading: Text(
        'Selected color and its shades',
        style: Theme.of(context).textTheme.subtitle1,
      ),
      showMaterialName: true,
      showColorName: true,
      showColorCode: true,
      copyPasteBehavior: const ColorPickerCopyPasteBehavior(
        longPressMenu: true,
      ),
      materialNameTextStyle: Theme.of(context).textTheme.caption,
      colorNameTextStyle: Theme.of(context).textTheme.caption,
      colorCodeTextStyle: Theme.of(context).textTheme.caption,
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: false,
        ColorPickerType.primary: true,
        ColorPickerType.accent: true,
        ColorPickerType.bw: false,
        ColorPickerType.custom: true,
        ColorPickerType.wheel: true,
      },
    ).showPickerDialog(context);
  }
}

extension ShapeOptionX on ShapeOption {
  Shape getShape(Paint paint) {
    switch (this) {
      case ShapeOption.none:
        return NoShape(paint);
      case ShapeOption.line:
        return Line(paint);
      case ShapeOption.circle:
        return Circle(paint);
      case ShapeOption.oval:
        return Oval(paint);
      case ShapeOption.rectangle:
        return Rectangle(paint);
    }
  }
}
